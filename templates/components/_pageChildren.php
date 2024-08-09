<?php namespace ProcessWire;

/**
 * Name _pageChildren
 * @var string $itemClassName
 * @var string $class
 * @var string $hxBoost
 */

if(!page()->hasChildren) return '';

if(!isset($limit)) $limit = 12;

// items
$items = $page->children("limit=$limit");

// pagination
$pagination = pagination($items);

// set items links
$items = $items->each("<li class='{$itemClassName}__list-item {id}'>
<a class='link {$itemClassName}__link-item {id}' href='{url}'>{title}</a></li>");

// info text
$strVisit = t('strVisitMore');

// content
echo <<<HTML
<div class='{$class}'>

    <h3>{$strVisit}</h3>

    <ul class='{$itemClassName}__list-content'{$hxBoost}>
        {$items}
    </ul>

    {$pagination}

</div>
HTML;
