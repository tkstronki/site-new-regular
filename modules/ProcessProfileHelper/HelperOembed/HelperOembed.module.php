<?php namespace ProcessWire;

// Use Embera witch caching ( https://github.com/mpratt/Embera/blob/master/doc/06-caching.md )
use Embera\{
	Cache\Filesystem,
	Http\HttpClient,
	Http\HttpClientCache,
	Embera};

/**
 * HelperOembed consumer library
 * usage:
 * $modules->get('HelperOembed')->embed('https://youtube.com/shorts/7Q1exvNEryE?feature=share')
 * $modules->get('HelperOembed')->embed(page()->body) // embed custom field
 * @link https://github.com/mpratt/Embera/
 * @link https://github.com/mpratt/Embera/blob/master/doc/07-advanced-usage.md
 * @link https://processwire.com/blog/posts/pw-3.0.173/
 * @link https://processwire.com/api/ref/module/
 * @link https://processwire.com/docs/modules/development/
 */
class HelperOembed extends ProcessProfileHelper {

	// A static method that returns an array of module information.
    public static function getModuleInfo() {

		return [
			'title'    => __('Helper Oembed'),
			'summary'  => __('This module uses the Embera Oembed library which supports +150 sites, such as Youtube, Twitter, Livestream, Dailymotion, Instagram, Vimeo and many many more.'),
			'author'   => 'rafaoski',
			'version'  => '1',
			'icon' 	   => 'file-code-o',
			'requires' => ['ProcessProfileHelper'],
			'autoload' => true,
			'page' => array(
                'name' => 'helper-oembed',
                'parent' => 'setup',
                'title' => 'Helper Oembed'
            ),
		];
    }

	/**
	 * Construct
	 *
	 * Here we set defaults for any configuration settings
	 *
	 */
	public function __construct() {
		parent::__construct(); // remember to call the parent

		// Set cache path
		$this->set('writablePath', config()->paths->cache . 'emberaCache/');

		//  Duration of the cache in seconds, for example: 60 = 1 minute, 600 = 10 minutes, 3600 = 1 hour, 86400 = 1 day, 604800 = 1 week, 2419200 = 1 month.
		$this->set('duration', null); // set null
		$this->set('profiles_img_page_id', 1060);
		$this->set('instagram_access_token','Instagram Access Token');
		$this->set('facebook_access_token', 'Facebook Access Token');
	}

  	// Initialization function called before any execute functions
	public function init() {

		if(!class_exists('Embera\Embera')) {
			return $this->error(
				__("You must install the compositor library (Embera Oembed) in the ProcessProfileHelper module directory to use HelperOembed module"));
		}

		// parent::init(); // always remember to call the parent init

		// Add hook before processing InputfieldCheckbox
		$this->addHookBefore('InputfieldCheckbox::processInput', function(HookEvent $event) {

			$input = $event->arguments(0);
			$files = $this->wire()->files;

			if($input->clearCache && $input->clearCache == 1) {
				$input->clearCache = 0;

				// Create a cache directory if it doesn't exist
				if( $files->mkdir($this->writablePath,true) ) {
					$cache = new Filesystem($this->writablePath, $this->duration);
					$cache->clear();
					$this->message(__("Embera Oembed Library Clear cache"));
				}
			}
			// Populate back arguments (if you have modified them)
			$event->arguments(0, $input);
		});
	}

	// Ready function for additional hooks
	public function ready() {

		// Basic content
		$this->addHook('/embera_load_content', function($event) {
			$content = $this->embedInputRequest('embed_url');
			return $content ?: '';
		});

		// Youtube content
		$this->addHook('/embera_load_youtube', function($event) {
			$content = $this->embedInputRequest('embed_url');
			if(!$content) return '';
			$content = str_replace('youtube.com','youtube-nocookie.com',$content);
			$content = str_replace('feature=oembed','feature=oembed&autoplay=1',$content);
			return $content;
		});

	}

	// Execute admin page in menu setup/Helper Oembed
    public function ___execute() {

		$page = $this->wire('pages')->get($this->profiles_img_page_id);

		/** @var InputfieldButton $button */
		$button = $this->modules->get('InputfieldButton');
		$button->value = $page->title;
		$button->icon = 'plus';
		$button->setSmall()->setSecondary()->addClass('pw-panel');
		$button->attr('data-href', $page->editUrl);
		return $button->render();
	}

	// Embed content based on input URL
	public function embedInputRequest($key = 'embed_url', $method = 'GET') {
		// Get wire input
		$input = $this->wire->input;
		// input GET
		if($method == 'GET') {
			$url = $input->get($key,'url,entities');
		}
		// input POST
		if($method == 'POST') {
			$url = $input->post($key,'url,entities');
		}
		// Check url sanitize
		if(!$url) return '';
		// return embeded content if request ok
		return $this->embed($url);
	}


	/**
	 * Clean adres in the content
	 */
	public function cleanAddressesInContent($content) {
		// Check if the content contains any YouTube addresses
		if (preg_match_all('/https:\/\/www\.youtube\.com\/live\/([^\s]+)/', $content, $matches)) {
			foreach ($matches[0] as $originalAddress) {
				$cleanedAddress = $this->cleanYoutubeAddress($originalAddress);
				$content = str_replace($originalAddress, $cleanedAddress, $content);
			}
		}

		return $content;
	}

	/**
	 * Clean Youtube adress url
	 */
	public function cleanYoutubeAddress($url) {
		// Check if the address contains the "live/" fragment
		if (strpos($url, 'live/') !== false) {
			// Split the address into parts, remove the "live/" fragment
			$parts = explode('live/', $url);

			// Get the second part, which contains the unique video identifier
			$videoId = $parts[1];

			// Concatenate the new URL
			$newUrl = 'https://www.youtube.com/watch?v=' . $videoId;

			return $newUrl;
		} else {
			// If the address does not contain "live/", return the original address
			return $url;
		}
	}

	/**
	 * Embed content
	 * @param string @embedContent
	 * @param array $options Options to modify default behavior:
	 * - `filters` (bool): default false - custom embera filters ( https://github.com/mpratt/Embera/blob/master/doc/07-advanced-usage.md#modifying-responses )
	 * - `purify` (bool): default false - cleanup content ( https://processwire.com/modules/markup-htmlpurifier/ )
	 * - `youtube_autoplay` (bool): autoplay videos / default false
	 * - `youtube_hide_controls` (bool): kide video controls / default false
	 * @param array $emberaOptions Options to modify default Embera behavior:
	 * - `responsive` (bool): true/false - Wether we modify the html response in order to get responsive html
	 * - `ignore_tags` (array): Array with tags that should be ignored when detecting urls from a text. So that for example Embera doesnt replace urls inside an iframe or img tag.
	 * - `maxwidth` (int): Set the maximun width of the embeded resource
	 * - `maxheight` (int): Set the maximun height of the embeded resource
	 * - `instagram_access_token` (string): Instagram access token
	 * - `facebook_access_token` (string): Facebook access token
	 */
	public function embed($embedContent, $options = array(), $emberaOptios = array()) {

		if(!$embedContent) return '';
		if(!class_exists('Embera\Embera')) return $embedContent;

		$modules = $this->wire()->modules;
		$files = $this->wire()->files;
		$httpCache = null;

		// Clean addresses in the content
		$embedContent = $this->cleanAddressesInContent($embedContent);

		// Default options
		$defaultOptios = [
			'filters' => false,
			'purify' => false,
			'youtube_autoplay' => false,
			'youtube_hide_controls' => false,
		];
		$options = array_merge($defaultOptios, $options);

		// Embera options
		$emberaDefaultOptios = [
			'responsive' => true,
			'ignore_tags' => ['a', 'img', 'strong', 'code'],
			'maxwidth' => '1280',
			'maxheight' => '720',
			'instagram_access_token' => $this->instagram_access_token,
			'facebook_access_token' => $this->facebook_access_token
		];
		$emberaDefaultOptios = array_merge($emberaDefaultOptios, $emberaOptios);
		$emberaDefaultOptios = array_filter($emberaDefaultOptios);

		// Create a cache directory if it doesn't exist
		if( $files->mkdir($this->writablePath,true) ) {}

		// Set embera cache
		if( $this->duration ) {
			$httpCache = new HttpClientCache(new HttpClient());
			$httpCache->setCachingEngine(new Filesystem($this->writablePath, $this->duration));
		}

		// Set embera
		$embera = new Embera($emberaDefaultOptios, null, $httpCache);

		// Set purify
		if( $options['purify'] ) {
			/** @var MarkupHTMLPurifier $purifier */
			$purifier = $modules->get('MarkupHTMLPurifier');

			// http://htmlpurifier.org/live/configdoc/plain.html
			// $purifier->set('Core.Encoding', 'ISO-8859-1');
			// $purifier->set('Attr.AllowedClasses', ['link','btn']);

			// Set content
			$embedContent = $purifier->purify($embedContent);
		}

		// embed without filters
		if(!$options['filters']) {
			// autoembed content
			$embededContent = $embera->autoEmbed($embedContent);
			// check if youtube
			if(strpos($embedContent, 'youtube.com') || strpos($embedContent, 'youtu.be')) {

				if( $options['youtube_autoplay'] ) {
					$embededContent = str_replace('feature=oembed','feature=oembed&autoplay=1',$embededContent);
				}

				if( $options['youtube_hide_controls'] ) {
					$embededContent = str_replace('feature=oembed','feature=oembed&controls=0',$embededContent);
				}
			}
			// return content without any filters
			return $embededContent;
		}

		// add custom filters ( filters for htmx responses returned clean content without styles or scripts )
		$embera->addFilter(function ($response) {

		// Set basic variables
			$providerName = strtolower($response['embera_provider_name']);
			// $home = $this->wire->pages->get('/')->httpUrl;

			/** @var HelperFunctions $helperFunctions */
			$home = pages()->get('/')->httpUrl;
			// $helperFunctions = modules()->get('HelperFunctions');
			// $helperFunctions->hookingCleanURL('');

			// set response ( https://stitcher.io/blog/php-8-match-or-switch )
			$response['html'] = match ($providerName) {
				'youtube' => $this->youtubeFilter($response, $providerName, $home),
				'tiktok' => $this->tiktokFilter($response, $providerName, $home),
				'twitter' => $this->twitterFilter($response, $providerName, $home),
				'facebook' => "<div hx-boost='false' id='fb'>$response[html]</div>",
				'instagram' => "<div hx-boost='false' id='insta'>$response[html]</div>",
				default => "<div hx-boost='false' class='embera-all $providerName'>" . $response['html'] . '</div>',
			};

			// return response
			return $response;
		});

		// return with filters
		return $embera->autoEmbed($embedContent);
	}

	/**
	 * YouTube filter
	 */
	public function youtubeFilter($response, $providerName, $home) {

		preg_match('/src="([^"]+)"/', $response['html'], $match);
		$embedUrl = $match[1];

		return $this->providerContent($providerName,[
			'title' => $response['title'],
			'author_name' => $response['author_name'],
			'author_url' => $response['author_url'],
			'hx_get' => $home . "embera_load_youtube?embed_url=$embedUrl",
			'thumb' => $response['thumbnail_url'],
			'thumb_width' =>  $response['width']
		]);
	}

	// TikTok filter
	public function tiktokFilter($response, $providerName, $home) {

		$embedUrl = $response['author_url'] . '/video/' . $response['embed_product_id'];

		return $this->providerContent($providerName,[
			'title' => $response['title'],
			'author_name' => $response['author_name'],
			'author_url' => $response['author_url'],
			'hx_get' => $home . "embera_load_content?embed_url=$embedUrl",
			'thumb' => $response['thumbnail_url'],
			'thumb_width' =>  $response['thumbnail_width'],
		]);
	}

	// Twitter filter
	public function twitterFilter($response, $providerName, $home) {
		$content = preg_replace('#<script(.*?)>(.*?)</script>#is', '', $response['html']);
		// $content = $this->wire->sanitizer->text($response['html'],['maxLength' => 180]);
		return $this->providerContent($providerName,[
			'content' => $content,
			'author_name' => $response['author_name'],
			'author_url' => $response['author_url'],
			'hx_get' => $home . "embera_load_content?embed_url=$response[url]",
			'hx_id' => sanitizer()->camelCase('twitter-'.$response['url']),
			'provider_icon' => 'x-logo'
		]);
	}

	/**
	 * Content for custom filters
	 * @link https://github.com/mpratt/Embera
	 * @link https://github.com/mpratt/Embera/blob/master/doc/07-advanced-usage.md
	 */
	public function providerContent($providerName,$opt = array()) {

		// reset variables
		$logo = $img = '';
		$icon = new Icon;

		// set defaults
		$default = [
			'class' => pathinfo(__CLASS__, PATHINFO_FILENAME) . '-' . $providerName,
			'title' => '',
			'content' => '',
			'author_name' => '',
			'author_url' => '',
			'hx_get' => '',
			'hx_id' => '',
			'provider_icon' => $providerName . '-logo',
			'thumb' => '',
			'thumb_width' => '640',
			'thumb_height' => '480',
			'profiles_img_page_id' => $this->profiles_img_page_id,
			'str_more' => $this->_('See more'),
		];
		$opt = array_merge($default,$opt);

		// Set id
		$id = sanitizer()->camelCase($providerName . '-' . $opt['title']);

		// Change default id
		if($opt['hx_id']) {
			$id = $opt['hx_id'];
		}

		$logo = '';

		$providerIcon = $icon->render($opt['provider_icon'], ['size' => '2xl']);
		$profilesPage = pages()->get($opt['profiles_img_page_id']);
		$authorName = sanitizer()->camelCase($opt['author_name']);
		if($profilesPage->id && $profilesPage->images) {
			$logo = $profilesPage->images->findTag("{$providerName}_$authorName")->first();
			if($logo) {
				$logo = Html::img($logo,['style' => 'width: 50px; height:auto']);
			}
			if(!$logo && config()->debug && user()->isSuperuser()) {
				$logo =
				"<small class='lead'>" .
					sprintf($this->_('If you want show user logo you must upload image on the Helper Oembed module page ) and set tag name ( %s )' ),
					$providerName.'_'.$authorName) .
				'</small><br>';
			}
		}
		if($opt['thumb']) {
			$img = Html::img($opt['thumb'],['width' => 640, 'height' => 420, 'description' => $opt['title'], 'class' => 'responsive']);
			$img = "<figure class='figure-wrapper'>
						{$img}
					</figure>";
		}

		return
		<<<HTML
			<article class='embedItem'>
				<h3>
					$logo
					<a class='text-2xl' href='$opt[author_url]'>$opt[author_name]</a><br>
					<span class='text-md'>$opt[title]</span>
				</h3>
				<div
					href='#'
					id='$id'
					class='embedContent $opt[class]'
					title='$opt[str_more]'
					hx-boost='false'
					hx-target='#$id'
					hx-get='$opt[hx_get]'
					hx-swap='outerHTML'
				>
					<div class='link'>
						$providerIcon
					</div>
					$img
					$opt[content]
				</div>
			</article>
		HTML;
	}

	/**
	 * Custom style for embera reponsive embed
	 * @param null|string $customStyle
	 * @link https://github.com/mpratt/Embera/blob/master/doc/05-responsive-embeds.md
	 */
	public function responsiveEmbed($customStyle = '') {
		$style =
		<<<CSS
			.embedItem {
				max-width: 960px;
				margin: auto;
				margin-top: var(--sp-2xl);
			}
			.embera-embed-responsive {
				position: relative;
				display: block;
				width: 100%;
				padding: 0;
				overflow: hidden;
				padding-bottom: 50%;
			}
			.embera-embed-responsive-item {
				position: absolute;
				top: 0;
				bottom: 0;
				left: 0;
				width: 100%;
				height: 100%;
				border: 0;
			}
			.embera-embed-responsive-item,
			.twitter-tweet {
				margin: auto;
			}
			.embedItem {
				.embedContent {
					max-width: var(--mw-xs);
					margin: auto;
					:hover {
						cursor: pointer;
						opacity: 0.8;
						transition: all .3s ease-in;
					}

				}
			}
			$customStyle
		CSS;

		return Html::styleTag($style);
	}

	/**
	 * Called only when your module is installed
	 *
	 * If you don't need anything here, you can simply remove this method.
	 *
	 */
	public function ___install() {
		parent::___install(); // Process modules must call parent method
	}

	/**
	 * Called only when your module is uninstalled
	 *
	 * This should return the site to the same state it was in before the module was installed.
	 *
	 * If you don't need anything here, you can simply remove this method.
	 *
	 */
	public function ___uninstall() {
		parent::___uninstall(); // Process modules must call parent method
	}

	/**
	 * Get module configuration inputs
	 *
	 * As an alternative, configuration can also be specified in an external file
	 * with a PHP array. See an example in the /extras/ProcessHello.config.php file.
	 *
	 * @param InputfieldWrapper $inputfields
	 *
	 */
	public function getModuleConfigInputfields(InputfieldWrapper $inputfields) {
		$modules = $this->wire()->modules;

		/** @var InputfieldText $f */
		$f = $modules->get('InputfieldText');
		$f->attr('name', 'instagram_access_token');
		$f->label = $this->_('Instagram access token');
		$f->attr('value', $this->instagram_access_token);
		$inputfields->add($f);

		/** @var InputfieldText $f */
		$f = $modules->get('InputfieldText');
		$f->attr('name', 'facebook_access_token');
		$f->label = $this->_('Facebook access token');
		$f->attr('value', $this->facebook_access_token);
		$inputfields->add($f);

		/** @var InputfieldText $f */
		$f = $modules->get('InputfieldText');
		$f->attr('name', 'profiles_img_page_id');
		$f->label = $this->_('Profiles images page id.');
		$f->description = $this->_('This page must chave field name `images`');
		$f->attr('value', $this->profiles_img_page_id);
		$inputfields->add($f);

		/** @var InputfieldRadios $f */
		$f = $modules->get('InputfieldRadios');
		$f->attr('name', 'duration');
		$f->label = $this->_('Set cache time');
		$f->addOption(60, $this->_('every minute'));
		$f->addOption(3600, $this->_('every hour'));
		$f->addOption(3600, $this->_('every 2 hours'));
		$f->addOption(14400, $this->_('every 4 hours'));
		$f->addOption(21600, $this->_('every 6 hours'));
		$f->addOption(43200, $this->_('every 12 hours'));
		$f->addOption(86400, $this->_('every day'));
		$f->addOption(172800, $this->_('every 2 days'));
		$f->addOption(345600, $this->_('every 4 days'));
		$f->addOption(604800, $this->_('every week'));
		$f->addOption(1209600, $this->_('every 2 weeks'));
		$f->addOption(2419200, $this->_('every 4 weeks'));
		$f->addOption(0, $this->_('none'));
		$f->optionColumns = 1; // make it display options on 1 line
		$f->notes = $this->_('Choose wisely'); // like description but appears under field
		$f->attr('value', $this->duration);
		$inputfields->add($f);

		/** @var InputfieldCheckbox $f */
		$f = $modules->get('InputfieldCheckbox');
		$f->attr('name', 'clearCache');
		$f->label = $this->_('Clear Embera Cache');
		if($this->get('clearCache')) $f->attr('checked', 'checked');
		$inputfields->add($f);
	}

}
