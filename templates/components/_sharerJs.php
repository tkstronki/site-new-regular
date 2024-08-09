<?php namespace ProcessWire;

/**
 * Name _sharerJs
 * @var string $itemClassName
 * @var string $id
 * @var string $class
 * @var string $cspNonce
 * @var Page $item
 * @link https://phosphoricons.com/
 * @link https://ellisonleao.github.io/sharer.js/
 */

if(!isset($item)) return '';

// reset variables
$items = '';

// info text
$strShare = Html::p(t('share'));

if(isset($hideTitle) && $hideTitle == true) $strShare = '';

// set all items
$sharedItems = WireArray([
    'email',
    'x',
    'facebook',
    'telegram',
    'linkedin',
    'whatsapp',
    // 'pocket',
    'reddit',
]);

// loop items
foreach($sharedItems as $shared) {

    // set icon
    $sharedIcon = match ($shared) {
        'email' => 'at',
        // 'twitter' => 'x-logo',
        default => $shared . '-logo',
    };
    $icon = (new Icon)->render($sharedIcon);

    // set title
    $sharedTitle = match ($shared) {
        'x' => 'x.com',
        default => $shared,
    };

    // set items
    $items .= <<<HTML
        <button
            title='Share on $sharedTitle'
            class='btn -icon'
            data-sharer='$shared'
            data-title='$item->title'
            data-hashtags='$item->name'
            data-url='$item->httpUrl'
        >$icon</button>
    HTML;
}

// content
echo <<<HTML
<div id='{$id}' class='{$class}'>
    {$strShare}
    {$items}
</div>
HTML;

// set region
region($itemClassName, Html::scriptSrcTag('https://cdn.jsdelivr.net/npm/sharer.js@0.5.2/sharer.min.js'));
