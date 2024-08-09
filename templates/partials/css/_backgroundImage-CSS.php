<?php namespace ProcessWire;

    /**
     * Name _backgroundImage-CSS
     * @var string $content
     *
     */

 /** @var PageImages $images */
$images = $page->images;

if(!$images) return '';
if(!$images->count) return '';

$imgFirst = $images->first();
$bgUrl = $imgFirst->url();
$bgSize = $imgFirst->hasTag("contain") ? 'contain' : 'cover';

// content
$content = <<<CSS
html::after {
    content: "";
    background: url($bgUrl);
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: $bgSize;
    background-position: center;
    background-blend-mode: hard-light;
    width: 100%;
    height: 100%;
    opacity: 0.05;
    top: 0;
    position: fixed;
    z-index: -1;
}
CSS;

return Html::styleTag($content);