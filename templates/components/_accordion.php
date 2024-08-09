<?php namespace ProcessWire;

/**
 * Name _accordion
 * @var string $id
 * @var string $itemClassName
 * @var string $class
 * @var string $items
 * @var int $activeAccordion
 * @var string $open
 */

if(!isset($accordions)) return '';

$activeAccordion = isset($activeAccordion) ? $activeAccordion : 1;

$items = '';
$i = 0;
foreach ($accordions as $aName => $aContent) {
$i++;

    $open = $i == $activeAccordion ? ' opened' : '';

    $items .=
    <<<HTML
        <button class='accordion -{$i}{$open}'>{$aName}</button>
        <div class='panel -{$i}'>
            {$aContent}
        </div>
    HTML;
}

// content
echo <<<HTML
    <div id='{$id}' class='{$class}'>
        {$items}
    </div>
HTML;

$style = <<<CSS
    .{$itemClassName} {
        .accordion {
            text-align: left;
            width: 100%;
        }

        .active, .accordion:hover {
            background-color: var(--color-contrast-90);
            color: var(--color-contrast-10);
        }

        .panel {
            visibility: hidden;
            padding: 0 18px;
            background-color: var(--bg-color);
            box-shadow: var(--sh-sm);
            max-height: 0;
            overflow: hidden;
            transition: 0.2s ease-out;
        }
    }
CSS;

$script = <<<JS
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
                panel.style.visibility = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
                panel.style.visibility = 'visible';
            }
        });

        if (acc[i].classList.contains('opened')) {
            acc[i].click();
        }
    }
JS;

// set region
region($itemClassName, Html::styleTag($style) . Html::scriptTag($script));