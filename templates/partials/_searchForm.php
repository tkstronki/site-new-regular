<?php namespace ProcessWire;

/**
 * Name _searchForm
 * @var string $id
 * @var string $itemClassName
 */

$hxURL = Helper::setURL('_hx-query');
$strSearch = (new Translations)->render('search');

echo <<<HTML
    <label class='$itemClassName' id="{$id}" for="{$id}__input">
        <input
            hx-trigger="keyup changed delay:500ms, search"
            hx-swap="innerHTML"
            hx-target="#{$id}__results"
            hx-get="{$hxURL}"
            placeholder="{$strSearch}..."
            type="search"
            name="q"
            autofocus
            href="#"
            class="form-control"
            id="{$id}__input"
        >
    </label>
    <div id='{$id}__results'></div>
HTML;

// CSS
$style = <<<CSS
    .{$itemClassName} {
        display: flex;
        flex-direction: column;
        align-items: center;
        .content {
            display: flex;
            flex-direction: column;
        }

    }
    #{$itemClassName}__results {
        font-size: var(--fs-xl);
        padding: var(--sp-md);
        display: flex;
        flex-direction: column;
        gap: var(--sp-2xs);
    }
CSS;

// set region
region($itemClassName, Html::styleTag($style));
