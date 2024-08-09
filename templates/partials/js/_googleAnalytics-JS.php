<?php namespace ProcessWire;

/**
 * Name _googleAnalytics-JS
 * @var string $id
 * @var string $name
 * @var string $class
 * @var string $cspNonce
 * @var string $hxBoost
 * @var Site $site
 */

// get google analytics tracking code
$gaCode = $site->gaCode;

 // return null if not set Google Analytics tracking code
if(!$gaCode) return '';

// content
$content = <<<JS

if (!window.gaListenerAdded) {
    window.gaListenerAdded = true;

    function initializeAnalytics() {
        // alert('ga');
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());
        gtag('config', '{$gaCode}');
    }
    if (document.readyState === 'complete' || document.readyState === 'interactive') {
        initializeAnalytics();
    } else {
        document.addEventListener('DOMContentLoaded', initializeAnalytics);
    }

    // Add HTMX boost listener
    window.addEventListener('htmx:afterSwap', function(evt) {
        if (evt.detail.boosted) {
            initializeAnalytics();
        }
    });
}
JS;

// Load scripts
echo Html::scriptSrcTag("https://www.googletagmanager.com/gtag/js?id={$gaCode}",[
    'type' => 'text/plain',
    'data-category' => 'analytics'
]);

echo Html::scriptTag($content, [
    'type' => 'text/plain',
    'data-category' => 'analytics'
]);
