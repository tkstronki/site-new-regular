<?php namespace ProcessWire;

/**
 * Basic translations
 */
function t($key) {
    return (new Translations())->render($key);
}

/**
 * get contents from svg icon
 *
 * @link https://phosphoricons.com/ - Visit the Phosphor Icons website.
 */
function icon($icon) {
    return ( new Icon )->render($icon);
}

/**
 * Minify CSS.
 */
function minifyCSS($cssFileName, $opt = array()) {
    return (new Assets)->minifyCSS($cssFileName, $opt);
}

/**
 * Minify JS.
 */
function minifyJS($jsFileName, $opt = array()) {
    return (new Assets)->minifyJS($jsFileName, $opt);
}

/**
 * Render a component.
 */
function component($name, $componentOptions = [], $opt = []) {
    return (new Component)->render($name, $componentOptions, $opt);
}

/**
 * Render a partial.
 */
function partial($name, $partialOptions = [], $opt = []) {
    return (new Component)->partial($name, $partialOptions, $opt);
}

/**
 * Render a block.
 */
function block($name, $blockOptions = [], $opt = []) {
    return (new Component)->block($name, $blockOptions, $opt);
}

/**
 * return page custom blocks
 */
function pageBlocks() {
    if(!page()->blocks) return '';
    $out = '';
    foreach (page()->blocks as $key => $item) {
        $out .= block($item->template->name, ['item' => $item]);
    }
    return $out;
}

/**
 * Render a component, partial regions.
 */
function renderRegions() {
    return (new Component)->renderRegions();
}

/**
 * return cookie consent
 */
function cookieConsentConfig($lang = '') {
    return (new CookieConsent($lang))->render();
}

/**
 * return cookie consent
 */
function cookieConsentBtn() {
    return (new CookieConsent())->renderBtn();
}

/**
 * Return the site favicon as an HTML link element.
 *
 * This function generates an HTML link element for the site's favicon based on the provided Pageimage.
 * If a valid Pageimage is provided, it constructs the link element with the appropriate image type and URL.
 * If no favicon is provided (null or empty), an empty string is returned.
 *
 * @param Pageimage $img The Pageimage representing the site's favicon.
 * @return string The HTML link element for the favicon, or an empty string if no favicon is provided.
 */
function favicon($img) {
    if (!$img) return '';
    return "<link rel='shortcut icon' type='image/$img->ext' href='$img->url'/>";
}

/**
 * return breadcrumbs
 */
function breadCrumbs() {
    if(!page()->parents->count()) return '';
    echo Html::div(page()->parents->implode(" &gt; ", "<a href='{url}'>{title}</a>") . "&gt;" .
    Html::p(page()->title,['class' => 'actual-page']),['id' => 'breadcrumbs', 'class' => 'breadcrumbs']);
}

/**
 * return copyright info
 * @param string $copyText
 * @param bool $copyReserved
 */
function copyright($copyText = '', $copyReserved = true) {
    $site = (new Site);
    $text = sprintf(t('copyright'), Html::a('https://processwire.com/','ProcessWire CMS'));
    $text = $site->copyright ?: $text;
    if($copyText) {
        $text = $copyText;
    }
    if($copyReserved) {
        $text = sprintf(t('copyrightReserved'), Html::a($site->url, $site->name));
    }
    return Html::p('&copy; ' .datetime('Y'). ' - ' .$text, ['class' => 'copyright']);
}

/**
 * Load site assets.
 */
function siteAssets($css = [], $js = [], $opt = []) {
    $defOpt =  [
        'jsDefer' => false,
        'preload' => true,
        'prefix' => 'site',
    ];
    $opt = array_merge($defOpt, $opt);
    $assets = new Assets;

    // set items
    $items =
    [
        $css ? $assets->getFilesContent($css, "$opt[prefix].css", ['itemsPath' => paths()->templates . 'assets/css/']) : '',
        $js ? $assets->getFilesContent($js, "$opt[prefix].js", ['itemsPath' => paths()->templates . 'assets/js/']) : ''
    ];
    $items = array_filter($items);

    // load items
    return $assets->load($items, $opt);
}

/**
 * Load custom assets
 */
function customAssets($css = [], $js = [], $opt = []) {
    $defOpt =  [
        'jsDefer' => true,
        'preload' => true,
        'prefix' => 'custom',
    ];
    $opt = array_merge($defOpt, $opt);
    return siteAssets($css, $js, $opt);
}

/**
 * Load prism js
 */
function loadPrism() {
    if(page()->body && str_contains(page()->body, '</code>') ) {
        return (new Assets)->load([
            'prism/prism.css',
            'prism/prism.js'
        ]);
    }
}

/**
 * Admin actions
 */
function adminActions() {
    if(!page()->editable()) return '';
    // edit btn
    $out = Html::a(page()->editUrl(), t('edit'), ['class' => 'btn btnEdit']);
    // manage fonts
    if(config()->debug && user()->isSuperuser() ) {
        $out .= Html::a('/list-fonts', t('manageFonts'),['class' => 'btn -prmary btnManageFonts']);
    }

    return Html::div($out, ['class' => basename(__FUNCTION__)]);
}

/**
 * return page links
 */
function pageLinks(Page $item) {
    $links = $item->links();
    if(!$links->count()) return '';
    $out = Html::h3(t('alsoLike'));
    $out .= Html::ul($links->each("<li><a href={url}>{title}</a></li>"));
    return $out;
}

/**
 * Return Debug regions
 *
 * @param string $id
 * @param string $class
 */
function debugRegions($id='debug',$class='debug') {
    if(config()->debug && user()->isSuperuser()) {
        return Html::section("<!--PW-REGION-DEBUG-->",['id' => $id,'class' => $class]);
    }
}

/**
 * Generate pagination for a list of results.
 *
 * This function generates pagination links for a list of results, such as pages or comments.
 *
 * @link https://processwire.com/api/ref/markup-pager-nav/
 * @param PageArray|CommentArray $results - The PageArray or CommentArray containing the results to paginate.
 * @param array $opt - Options to modify the default behavior of pagination:
 *   - 'baseUrl' (string): Base URL for pagination links.
 *   - 'elementId' (string): The HTML element's ID.
 *   - 'elementClass' (string): The HTML element's CSS class.
 *   - 'listClass' (string): CSS class for the pagination list.
 *   - 'linkClass' (string): CSS class for pagination links.
 *   - 'nextLabel' (string): Label for the "Next" button.
 *   - 'prevLabel' (string): Label for the "Previous" button.
 *   - 'currentLinkMarkup' (string): Markup for the link of the current page. Use {url} for href and {out} for label content.
 *   - 'inputPage' (int): The current page number.
 *   - 'hxBoost' (string): Return HTMX boost attribute.
 * @return string - The HTML markup for pagination.
 */
function pagination($results, $opt = array()) {

    // Basic options
    $default = [
        'baseUrl' => '',
        'elementId' => 'pagination' . page()->id,
        'elementClass' => 'pagination list-none',
        'listClass' => 'listClass',
        'linkClass' => 'linkClass btn',
        'nextLabel' => t('next'),
        'prevLabel' => t('prev'),
        'currentLinkMarkup' => Html::span("{out}", ['class' => 'currentLinkMarkup btn -primary']),
        'inputPage' => input()->pageNum,
        'hxBoost' => setting('hxBoost') ? 'true' : 'false',
    ];
    // Merge all with default Options
    $opt = array_merge($default, $opt);

    // Render pagination
    $pagination = $results->renderPager(array(
        'nextItemLabel' 	=> $opt['nextLabel'],
        'previousItemLabel' => $opt['prevLabel'],
        'listMarkup' 		=> Html::ul("{out}",['id' => $opt['elementId'], 'class' => $opt['elementClass'], 'hx-boost' => $opt['hxBoost']]),
        'itemMarkup' 		=> Html::li("{out}",['class' => $opt['listClass']]),
        // 'linkMarkup' 		=> Html::a("{url}","<span>{out}</span>",['class' => $opt['linkClass'],'hx-get' => "{url}", 'hx-target' => 'body', 'hx-swap' => 'outerHTML show:window:top']),
        'linkMarkup' 		=> Html::a("{url}","<span>{out}</span>",['class' => $opt['linkClass']]),
        'currentLinkMarkup' => $opt['currentLinkMarkup'],
        'baseUrl' => $opt['baseUrl']
    ));

    // set region CSS
    if($pagination) {
        region('pagination()', Html::styleTag(
        <<<CSS
            .pagination {
                list-style: none;
                display: flex;
                flex-wrap: wrap;
                gap: var(--sp-6xs);
                padding: var(--sp-md);
            }
        CSS));
    }

    return $pagination;
}
