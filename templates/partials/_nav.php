<?php namespace ProcessWire;

/**
 * Name _nav
 * @var string $id
 * @var string $hxBoost
 *
 */

// set htmx
$htmx = new Htmx;

// nav links
$links = '';
foreach ($home->and($home->children) as $key => $item) {
    $links .= Html::li(
        Html::a($item->url, $item->title, ['class' => "link page-{$item->name}"])
    );
}

// multi language links
$languageLinks = Html::languageLinks();

// load search form component
$searchForm = $htmx->getPartialModal('_searchForm',icon('magnifying-glass'),[
    'aria-label' => 'searchForm',
    'class' => '-small',
]);

// icons
$iconRSS = icon('rss');
$iconBtn = icon('equals');

// content
echo <<<HTML
<nav x-data='{ open: false }' @scroll.window='open = false' @click.outside='open = false' id='{$id}' class='{$class}'>

    <button @click='open = ! open' class='mobileBtn btn -icon outline -xs' aria-label="Mobile button trigger">
        {$iconBtn}
    </button>

    <ul :class="open ? '' : 'hide'" class='navLinks outline -sm'{$hxBoost}>

        {$links}

        <li class='more-links'>

            <!-- RSS -->
            <a class='rss' hx-boost='false' title='RSS' href='{$home->url}rss.xml'>
                {$iconRSS}
            </a>

            <!-- SEARCH FORM -->
            {$searchForm}

            <!-- Multi Language Links -->
            {$languageLinks}
        </li>

    </ul>

</nav>
HTML;
