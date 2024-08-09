<?php namespace ProcessWire;

/**
 * How to use markup regions
 * @link https://processwire.com/docs/front-end/output/markup-regions/
 * @var Pages $pages
 * @var Config $config
 */

/** @var Site $site */
$site = new Site;

/** @var HomePage $home */
$home = $pages->get('/');

/** @var FlashMessage $flashMessage */
$flashMessage = new FlashMessage;

/** @var HelperOembed $embera */
$embera = modules()->get('HelperOembed');

/**
* @var string $customAssets A string representing the processed assets.
*/
$customAssets = customAssets([
	// 'https://cdn.jsdelivr.net/npm/uikit@3.21.9/dist/css/uikit.min.css'
],[
	'https://cdn.jsdelivr.net/npm/@alpinejs/intersect@3.x.x/dist/cdn.min.js',
	'https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js',
	'https://cdn.jsdelivr.net/npm/lozad/dist/lozad.min.js',
	'https://cdnjs.cloudflare.com/ajax/libs/htmx/2.0.1/htmx.min.js',
	// 'https://cdn.jsdelivr.net/npm/uikit@3.21.9/dist/js/uikit.min.js',
	// 'https://cdn.jsdelivr.net/npm/uikit@3.21.9/dist/js/uikit-icons.min.js',
],['preload' => true]);
?><!DOCTYPE html>
<html id='html' lang="<?= $site->lang ?>">
	<head id="html-head">
		<meta charset='UTF-8'>
		<meta name='viewport' content='width=device-width, initial-scale=1.0'>

		<!-- Site favicon -->
		<?= favicon($site->favicon); ?>

		<!-- Basic SEO -->
		<?= (new Seo)->render($page); ?>

		<?= Html::hreflang(); // handle output of 'hreflang attribute' link tags for multi-language ?>

		<?= $customAssets; // custom site assets ?>

		<?= siteAssets([ // site assets - css / js
			'__reset.css',
			'_base-var.css',
			'_color-var.css',
			'base.css',
			'editor.css',
			'animations.css',
			'utilities.css',
			'custom.css',
			'_overwrite-cssFrameworks.css',
			'_themes.css',
			],
			// ['_custom.js']
		);
		?>

		<!-- Load Fonts -->
		<?= (new Fonts)->render([
				'dm-sans',
				'inter',
			],[
				// `loadAll` (bool) - Load all Google fonts from assets/fonts if debug is set to true
				'loadAll' => config()->debug ? true : false
		]); ?>

		<!-- Custom style -->
		<?= Html::styleTag(
			<<<CSS
				.navLinks .page-{$page->name} {
					color: var(--link-selected);
				}
			CSS
		); ?>

		<!-- Style for embera -->
		<?= $embera->responsiveEmbed(); ?>

		<?php if ($site->gvCode) { // Verification code
			echo Html::meta('google-site-verification',$site->gvCode) . "\n";
		} ?>
	</head>
	<body id="body" class='<?= setting('bodyClasses')->implode(' ')  ?>'
		x-data="{
			animate(el, animation) {
				el.classList.add(animation);
			}
		}"
	>

		<header id='header' class='header'>

			<div id='branding' class='branding'>

				<a class='siteLink' href='<?= $home->url ?>'>
					<?= Html::img($site?->logo,['width' => 70, 'height' => 70, 'class' => 'logo', 'lozad' => false]) ?>
					<span class='siteName'><?= $site->name ?></span>
				</a>

				<p class='siteTagline'><?= $site->tagline ?></p>

			</div>

			<?= partial('_nav',['home' => $home]); ?>
		</header>

		<main id='main' class='main main-<?= page()->template->name ?>'>

			<?= $flashMessage->render(); ?>

			<?= breadCrumbs() ?>

			<div id="content" class="content content-<?= page()->name ?>">

				<div class='hero' id='hero'>

					<?= $page->if('seo.txt', Html::h1("{seo.txt}",['x-intersect' => "animate(\$el, 'fade-in')"])); ?>

					<?= $page->if('seo.txtarea', Html::h2("{seo.txtarea}", [
						'class' => $site->isHome ? 'outline' : '',
						'x-intersect' => "animate(\$el, 'zoom-in')"
					])); ?>

				</div>

				<div class='content-body' id='content-body'>
					<?= $embera->embed(page()->body,['filters' => 'true']) // embera autoembed ?>
					<?= pageBlocks(); // custom blocks ?>
				</div>

			</div>

		</main>

		<footer id='footer' class='footer'>

			<div id='info-links' class='info-links'>
				<!-- Contact info -->
				<?php if(page()->id != $site->contactPage->id) echo $site->contactInfo() ?>
				<!-- Internal links -->
				<?= $site->internalLinks(); ?>
				<!-- Friendly links -->
				<?= $site->friendlyLinks(); ?>
				<!-- Social Profiles -->
				<?= $site->socialProfiles(); ?>
			</div>

			<div class='bottom-region'>
				<!-- Copyright -->
				<?= copyright() ?>
				<!-- Color Mode -->
				<?= (new ColorMode)->render() ?>
				<?= cookieConsentBtn(); // cookie consent button ?>
			</div>

			<a
				href='#html'
				x-data='{ toTop: false }'
				@scroll.window="toTop = (window.pageYOffset < 50) ? false: true"
				:class="toTop ? '' : 'dn'" id='scrool-top' class='-icon'
			>
				<?= icon('arrow-circle-up',['size' => 'lg']) ?>
			</a>

			<?= debugRegions() ?>
		</footer>

		<?= adminActions(); // admin buttons ?>

		<?= loadPrism() // load prism.js ?>

		<?= partial('_backgroundImage-CSS'); ?>
		<?= partial('_Lozad-JS'); ?>
		<?= partial('_googleAnalytics-JS',['site' => $site]); ?>
		<?= cookieConsentConfig($site->lang); ?>

		<?php // echo (new InfoDebug)->render() ?>

		<?= renderRegions(); // regions from components, partials etc, usualy css, js items. ?>
	</body>
</html>
<?php
// remove flash messages
$flashMessage->remove();
