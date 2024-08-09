<?php namespace ProcessWire;

$images = $item->images;

if (!$images->count) return '';

/** @var HelperOembed $embera */
$embera = modules()->get('HelperOembed');

/** @var Macy $macy */
$macy = new Macy('#macy-container');

// set grid container options
$macy->setTrueOrder(true)
    ->setWaitForImages(true)
    ->setMargin(20)
    ->setColumns(4)
    ->setBreakAt([
        1200 => 4,
        800 => 3,
        600 => 2,
        400 => 1
    ])
->render();

// set items
$items = $images->each(function($img) use($embera) {
    $body = $embera->embed($img->body,['filters' => true]);
    $image = Html::img($img, ['class' => 'responsive']);
    $description = $img->description;
    $tags = str_replace(" ", ", ", $img->tags);
    return Alpine::lightbox(
    <<<HTML
        <div class='item img-container'>
            <img
                class='lozad responsive'
                data-src="{$img->url}"
            >
            <small class='img-tags'>{$tags}</small>
            <span class='img-desc'>{$description}</span>
        </div>
    HTML, "<h3 class='title' x-intersect=\"animate(\$el, 'fade-slide-left')\">$description</h3> {$image} {$body}", 'div');
});

echo <<<HTML
<section>
    <h3 x-intersect="animate(\$el, 'fade-slide-left')">$item->title</h3>
    <div class='wrap-items'>
            {$item->body}
        <div id='macy-container' class="gallery">
            {$items}
        </div>
    </div>
</section>
HTML;

// CSS
$style = <<<CSS

.img-container  {
    position: relative;
    overflow: hidden; /* Hides external elements outside the container */

    .img-tags {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.7);
        color: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        padding: 20px;
        box-sizing: border-box;
        transform: translateY(100%); /* Initially hidden out of sight */
        transition: transform 0.5s ease-in-out;
        opacity: 0;
    }

    &:hover  {
        cursor: crosshair;
        .img-tags {
            transform: translateY(0); /* After hovering */
            opacity: 1; /* Shows the description */
            pointer-events: none; /* Still lets you click through the description */
        }
    }
}
CSS;

// set region
region($itemClassName, Html::styleTag($style));
