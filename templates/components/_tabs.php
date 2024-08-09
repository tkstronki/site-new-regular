<?php namespace ProcessWire;

/**
 * Name _tabs
 * @var string $id
 * @var string $itemClassName
 * @var string $class
 * @var string $tContent
 * @var string $tabBtn
 * @var string $allContent
 * @var int $activeTab
 */

if(!isset($tabs)) return '';

$itemClassName = $itemClassName .'-'. mt_rand();

$tabBtn = '';
$allContent = '';
$activeTab = isset($activeTab) ? $activeTab : 1;

$i = 0;
foreach ($tabs as $tName => $tContent) {
$i++;

    $active = $i == $activeTab ? ' active' : '';
    $show = $i == $activeTab ? ' show' : '';

    // item button
    $tabBtn .=
    <<<HTML
        <li><a class='btn{$active}' href='#tab{$i}'>$tName</a></li>
    HTML;

    // item content
    $allContent .=
    <<<HTML
        <div id='tab{$i}' class='tab-content{$show}'>
            $tContent
        </div>
    HTML;
}

// Content
echo <<<HTML
    <div id='{$id}' class='{$class} {$itemClassName}'>
        <ul class="tabs list-none">
            {$tabBtn}
        </ul>
        {$allContent}
    </div>
HTML;

$style = <<<CSS
    .{$itemClassName} {
        /* Reset styles for list and links */
        ul {
            padding: 0;
            margin: 0;
        }
        /* Style tabs */
        .tabs {
            display: flex;
            flex-wrap: wrap;
            li {
                margin-right: var(--sp-3xs);
                padding-left: 0;

                a {
                    border-bottom: var(--sp-2xs) solid transparent;
                    &.btn {
                        border-bottom-left-radius: 0;
                        border-bottom-right-radius: 0;
                    }
                    /* Style active tab */
                    &.active {
                        background-color: var(--color-red);
                        color: var(--color-white);
                        border-bottom: var(--sp-2xs) solid var(--color-white);
                        /* border-bottom: var(--sp-2xs) solid var(--color-contrast-70); */
                    }
                }
            }
        }
        /* Style tab contents */
        .tab-content {
            background-color: var(--bg-color);
            border-top: var(--sp-7xs) solid var( --color-contrast-70);
            padding: 20px;
            margin-top: -7px;
            box-shadow: var(--sh-sm);
            /* Hide inactive tab contents */
            &:not(.show) {
                display: none;
            }
        }
    }
CSS;

$script = <<<JS
    // Handle clicks on tabs
    document.querySelectorAll('.{$itemClassName} .tabs a').forEach(tab => {
        tab.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            document.querySelectorAll('.{$itemClassName} .tab-content').forEach(content => {
                if (content.getAttribute('id') === targetId.substring(1)) {
                    content.classList.add('show');
                } else {
                    content.classList.remove('show');
                }
            });
            // Add active class to clicked tab
            document.querySelectorAll('.{$itemClassName} .tabs li a').forEach(link => {
                if (link.getAttribute('href') === targetId) {
                    link.classList.add('active');
                } else {
                    link.classList.remove('active');
                }
            });
        });
    });
JS;

// set region
region($itemClassName, Html::styleTag($style) . Html::scriptTag($script));
