<?php namespace ProcessWire;

/**
 * Name _Lozad-JS
 * @var string $id
 * @var string $name
 * @var string $class
 * @var string $cspNonce
 * @var string $hxBoost
 */

// content
$content = <<<JS

// Skrypt do inicjalizacji lozad.js
if (!window.lozadListenerAdded) {
    window.lozadListenerAdded = true;

    function lozadRun() {
        const observer = lozad('.lozad', {
            // load: function(el) {},
            loaded: function(el) {
                el.classList.add('loaded-finish');

                // Wywołaj funkcję po zakończeniu ładowania obrazów
                if (typeof window.onLozadLoaded === 'function') {
                    window.onLozadLoaded();
                }
            }
        });
        observer.observe();
    }

    if (document.readyState === 'complete' || document.readyState === 'interactive') {
        lozadRun();
    } else {
        document.addEventListener('DOMContentLoaded', lozadRun);
    }

    // Add htmx listener
    window.addEventListener('htmx:afterSwap', function(evt) {
        if (evt.detail.boosted) {
            lozadRun();
        }
    });

    window.addEventListener('htmx:load', function(evt) {
        lozadRun();
    });
}
JS;

return Html::scriptTag($content);