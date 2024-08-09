<?php namespace ProcessWire;

if(!defined("PROCESSWIRE")) die();

/** @var ProcessWire $wire */

/**
 * ProcessWire Bootstrap API Ready
 * ===============================
 * This ready.php file is called during ProcessWire bootstrap initialization process.
 * This occurs after the current page has been determined and the API is fully ready
 * to use, but before the current page has started rendering. This file receives a
 * copy of all ProcessWire API variables.
 *
 * All Hooks are in the folder `site/hooks/_HookName`
 */

setting([ // primary site settings
	// EXPERIMENTAL SETTING! / Content Security Policy (CSP) ( https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP )
	'csp' => false,

	// HTMX Boost https://htmx.org/attributes/hx-boost/
	// 'hxBoost' => user()->isLoggedin() || config()->liveReload == true ? false : true,
	'hxBoost' => false,
]);


/**
 * Rules for `Content Security Policy (CSP)` - https://content-security-policy.com/
 * https://www.writesoftwarewell.com/content-security-policy/
 * https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy
 */

 // remove old session nonce
session()->remove('cspNonce');

// set rules
$cspRules = function() {
	$cspNonce = session()->get('cspNonce');
	return  [
		"default-src 'self'",
		// "script-src 'nonce-$cspNonce' 'unsafe-inline' 'strict-dynamic' https: http:",
		"script-src 'nonce-$cspNonce' 'strict-dynamic'",
		// "connect-src 'self' https://maps.googleapis.com https://www.google.com https://fonts.googleapis.com https://fonts.gstatic.com",
		"connect-src 'self' https://www.google.com ",
		"frame-src https://www.google.com https://www.youtube.com/ https://www.youtube-nocookie.com/",
		"img-src 'self' data: https://www.google.com https://i.ytimg.com/",
		"style-src 'self' 'nonce-$cspNonce'",
		// "style-src-elem 'self'",
		"font-src 'self'  https://fonts.gstatic.com",
		"base-uri 'self'",
		"form-action 'self'",
		// "report-uri https://csp.example.com",
	];
};

// nonce code for (CSP) if not htmx request is executed
if(!user()->isLoggedin() && setting('csp') == true && !setting('hxRequest')) {
	$generateNonce = base64_encode(random_bytes(16));
	session()->set('cspNonce', $generateNonce);
	header("Content-Security-Policy: " . implode('; ', $cspRules()));
}

// include all Hooks
$classes = files()->find(paths()->site . '/classes/custom', ['extensions' => 'php']);
foreach ($classes as $class) {
	include_once($class);
}

// include all Hooks
$hooks = files()->find(paths()->site . '/hooks');
foreach ($hooks as $hook) {
	include_once($hook);
}

// Google web fonts helper ( https://gwfh.mranftl.com/fonts )
if(config()->debug && user()->isLoggedin() && user()->isSuperuser()) {
	wire()->addHook('/list-fonts', null, '_listFonts');
	wire()->addHook('/list-fonts/{urlSegment}', null, '_listFonts');
	wire()->addHook('/list-fonts/preview-font/{fontID}', null, '_previewFont');
	wire()->addHook('/list-fonts/download-font/{fontID}', null, '_downloadFont');
	wire()->addHook('/list-fonts/delete/{fileName}', null, '_deleteFont');
}


/**
 * Hooks only For Admin area
 *
 */


// wire()->addHookAfter("ProcessPageEdit::buildForm", null, '_adminBuildForm');
wire()->addHookAfter("Pages::saved", null, '_publicationDate');

// Remove all notes from homepage if not debugging
wire()->addHookBefore('Inputfield::render', function(HookEvent $event) {
	 /* @var Inputfield $inputfield */
	$inputfield = $event->object;
	$pageID = input()->get('id');

	if($pageID && $pageID == 1 && config()->debug == false) {
		$inputfield->notes = null;
	}
});


// Hide hooks from front site on the admin area
if(wire('page')->template == 'admin') return '';

/**
 * Hooks only For site
 *
 */

// wire()->addHook('/csrf_input',null,'_renderCSRF');
wire()->addHook('/rss.xml', null, '_markupRSS');
wire()->addHook('/sitemap.xml', null, '_sitemapXML');
wire()->addHook('/many_request', null, '_tooManyRequest');

// HTMX request Hooks / file => `_hxRequest.php`
if(input()->is('POST') || (new Site)->hxRequest == true) {
	wire()->addHook('/_load-partial{name}', null, '_loadPartial');
	wire()->addHook('/_load-component{name}', null, '_loadComponent');
	wire()->addHook('/_find-one_{pageID}_{field}', null, '_findOne');
	wire()->addHook('/_hx-find-one_{pageID}_{field}', null, '_hxFindOne');
	wire()->addHook('/_hx-query', null, '_hxSearchResults');
}

// Watch the site files for changes
$watchFiles = function () {
	$homeURL = pages()->get('/')->httpUrl;
	return <<<JS
		var urlToCheck = '{$homeURL}watch-files'; // See Hook inside ready.php
		function checkURL() {
			fetch(urlToCheck)
				.then(response => {
					// console.log('File not change');
					// if (response.ok)
					if (response.status == 205) {
						// console.log('The site files have been changed. The page has been refreshed...');
						location.reload();
					}
				})
				.catch(error => {
					console.error('Error checking URL:', error);
				});
		}
		// Check after 1 second
		setInterval(checkURL, 1000);
	JS;
};
// set region script
if(config()->debug == true && config()->liveReload == true) {
	wire()->addHook('/watch-files', null, "_watchFiles");
    region('Watch_Site_Files_For_Changes', Html::scriptTag($watchFiles()));
}

/**
 * Simple White Space HTML Minification
 */
wire()->addHookAfter('Page::render', function($event) {
	$event->return =  preg_replace("/(\s)\s+/", "$1", $event->return);
});
