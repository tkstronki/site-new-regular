<?php namespace ProcessWire;

/**
* Name _blockContent
* @var string $id
* @var string $class
* @var string $itemClassName
*/

/** @var HelperOembed $embera */
$embera = modules()->get('HelperOembed');
$body =  $embera->embed($item->body,['filters' => 'true']);

// content
echo <<<HTML
<section id='{$id}' class='{$class}'>
    <h3 x-intersect="animate(\$el, 'fade-slide-up')">{$item->title}</h3>
        {$body}
</section>
HTML;

// // CSS
// $style = <<<CSS
// CSS;

// // JS
// $script = <<<JS
// JS;

// // set region
// region($itemClassName, Html::styleTag($style) . Html::scriptTag($script));