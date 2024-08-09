<?php namespace ProcessWire;

/**
* Name _companyMap
* @var string $id
* @var string $map
* @var string $class
* @var string $style
* @var string $itemClassName
* @var Site $site
*/

// set site
$site = new Site;

// get map
$map = $site->map;

// rreturn empty if no found map
if(!$map) return '';

// set label
$label = $site->contactInfo->getField('txtarea')->label;

// get map
$map = sanitizer()->unentities($map);

// set referrerpolicy
$map = str_replace(
    [
        '<iframe',
    ],
    [
        "<iframe referrerpolicy='no-referrer-when-downgrade' sandbox='allow-same-origin allow-scripts' ",
], $map);

// set lazy load ( default load via lazy load )
if(!input()->lozad == 'false') {
    $map = str_replace(
    [
        '<iframe',
        'src'
    ],
    [
        "<iframe class='lozad' ",
        'data-src'
    ], $map);
}

// content
echo <<<HTML
<div id='{$id}' class='{$class}'>

    <h3><span class='title' x-intersect="animate(\$el, 'fade-slide-down')">{$label}</span></h3>

    <div class='iframe-wrapper'>
        {$map}
    </div>

</div>
HTML;

// CSS
$style = <<<CSS
    .{$itemClassName} {
        display: flex;
        flex-direction: column;
    }
CSS;

// set region
region($itemClassName, Html::styleTag($style));
