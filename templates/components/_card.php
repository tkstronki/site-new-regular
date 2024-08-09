<?php namespace ProcessWire;

/**
 * Name _card
 * @var string $itemClassName
 * @var string $class
 * @var string $title
 * @var string $content
 * @var string $size
 */

if(!isset($img)) return '';

// set basic content
$title = isset($title) ? $title : __('Card title');
$content = $content ? $content : Html::p(__('Card content. You can add description, details, text, etc. here.'));

// size of the card ( max-width )
$size = isset($size) ? $size : 'md';

$size = match ($size) {
    'sm' => '320',
    'md' => '420',
    'lg' => '640',
    'xl' => '920',
    default => '320',
};

// content
echo <<<HTML
<div class='{$class} -hoverable'>
    {$img}
    <h3 class="-title">{$title}</h3>
    <div class="-content">{$content}</div>
</div>
HTML;

$style = <<<CSS
    .{$itemClassName} {
        outline: var(--sp-3xs) dotted transparent;
        outline-offset: var(--sp-3xs);
        border-radius: var(--sp-sm);
        box-shadow: var(--sh-sm);
        padding: var(--sp-md);
        margin: var(--sp-sm);
        transition: all .3s ease;
        color: var(--text-color);
        border: var(--sp-7xs) solid var(--color-contrast-90);
        max-width: {$size}px;

        img {
            max-width: 100%;
            margin: auto;
            border-radius: var(--sp-sm);
            margin-bottom: var(--sp-sm);
        }
        .-title {
            font-size: var(--fs-lg);
            font-weight: 700;
            margin-bottom: var(--sp-sm);
            transition: all .7s ease;
        }
        .-content {
            font-size: var(--fs-sm);
        }

        &:hover {
            &.-hoverable {
                outline-color: var(--color-accent-60);
                background-color: var(--color-violet);
                color: var(--color-white);
                border-color: transparent;
                box-shadow: none;
                cursor: pointer;
                h3 {
                    color: var(--color-black);
                }
            }
        }
    }
CSS;

// set region
region($itemClassName, Html::styleTag($style));
