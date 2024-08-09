<?php namespace ProcessWire;

/**
 * Return html element
 */
class Html {

    /**
     * Check if a String Contains HTML Tags.
     *
     * This function uses a regular expression to check whether a string contains any HTML tags.
     * If the string contains any HTML tags, the function returns true; otherwise, it returns false.
     *
     * @param string $string The string to check.
     * @return bool True if the string contains HTML tags; false otherwise.
     */
    public static function isHtml($string) {
        return preg_match("/<[^<]+>/", $string, $m) != 0;
    }

    /**
     * Return HTML element
     * @param string $el - HTML element name (e.g., 'div', 'p', 'a', etc.).
     * @param string $content - The content inside the element.
     * @param array $attr - Element html attributes:
     *   - 'id' (string): The ID of the element.
     *   - 'class' (string): CSS classes (you can specify one or multiple, separated by spaces).
     *   - 'style' (string): CSS styles as text.
     * @param array $opt - Configuration options:
     *   - 'attr' (array): Array of HTML attributes in the format ['name' => 'value'].
     *   - 'before' (string): HTML code to be inserted before the opening of the element.
     *   - 'after' (string): HTML code to be inserted after the closing of the element.
     *   - 'allowEmpty' (bool): Allow empty content.
     *   - 'single' (bool): Set single tag.
     * @return string - The generated HTML code for the element.
     */
    public static function el($el, $content, $attr = [], $opt = []) {

        if (empty($content) && !isset($opt['allowEmpty'])) return '';

        // Default options
        $default = [
            'before' => '',
            'after' => '',
            'single' => false
        ];
        // Merge with default options
        $opt = array_merge($default, $opt);

        // default attributes
        $defaultAttr = [
            'id' => '',
            'class' => '',
            'style' => '',
        ];
        // Merge with default attributes
        $attr = array_merge($defaultAttr, $attr);
        $attr = array_filter($attr);

        // Build attribute string
        $itemAttr = '';
        foreach ($attr as $key => $value) {
            if (is_bool($value)) {
                $itemAttr .= " $key";
            } else {
                $escapedValue = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
                $itemAttr .= " $key=\"$escapedValue\"";
            }
        }

        $before = $opt['before'];
        $after = $opt['after'];

        $htmlElement = $before;
        $htmlElement .= "<$el{$itemAttr}>";
        $htmlElement .= !$opt['single'] ? $content : '';
        $htmlElement .= !$opt['single'] ? "</$el>" : '';
        $htmlElement .= $after;

        // Return the element
        return $htmlElement;
    }

    /**
     * Return HTML (div) element
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function div($content = '', $attr = [], $opt = []) {
        $el = 'div';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (section) element
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function section($content = '', $attr = [], $opt = []) {
        $el = 'section';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (small) tag
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function small($content = '', $attr = [], $opt = []) {
        $el = 'small';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML link
     * @param string $href
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function a($href = '#', $content = '', $attr = [], $opt = []) {
        $el = 'a';

        if(isset($attr['blank']) && $attr['blank'] == true) {
            $attr['target'] = '_blank';
            $attr['rel'] = 'noopener noreferrer';
        }
        $attr['href'] = $href;
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (h1) tag
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function h1($content = '', $attr= [], $opt = []) {
        $el = 'h1';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (h2) tag
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function h2($content = '', $attr = [], $opt = []) {
        $el = 'h2';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (h3) tag
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function h3($content = '', $attr = [], $opt = []) {
        $el = 'h3';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (p) tag
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function p($content = '', $attr = [], $opt = []) {
        $el = 'p';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (ul) tag
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function ul($content = '', $attr = [], $opt = []) {
        $el = 'ul';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (ol) tag
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function ol($content = '', $attr = [], $opt = []) {
        $el = 'ol';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (li) tag
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function li($content = '', $attr = [], $opt = []) {
        $el = 'li';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (span) tag
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function span($content = '', $attr = [], $opt = []) {
        $el = 'span';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (title) tag
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function title($content = '', $attr = [], $opt = []) {
        $el = 'title';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (strong) tag
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function strong($content = '', $attr = [], $opt = []) {
        $el = 'strong';
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (meta) tag
     * @param string $name
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function meta($name = '', $content = '', $attr = [], $opt = []) {
        $el = 'meta';

        // set single tag
        $opt['single'] = true;
        $opt['allowEmpty'] = true;

        // set attributes
        if(isset($attr['property'])) {
            $attr['property'] = $name;
        } else {
            $attr['name'] = $name;
        }
        $attr['content'] = $content;

        // Return the element
        return self::el($el, '', $attr, $opt);
    }

    /**
     * Return HTML (input) tag
     * @param string $name
     * @param string $value - input value
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function input($name = '', $value = '', $attr = [], $opt = [],) {
        $el = 'input';

        // set single tag
        $opt['single'] = true;
        $opt['allowEmpty'] = true;

        // set attributes

        $attr['name'] = $name;
        $attr['value'] = $value;

        // Return the element
        return self::el($el,'', $attr, $opt);
    }

    /**
     * Generate an HTML list (ul or ol) with links using PageArray.
     *
     * @param PageArray $items - PageArray object containing the items to be listed.
     * @param array $opt - Configuration options:
     *   - 'heading' (string): Optional heading to be placed before the list.
     *   - 'listType' (string): Type of list ('ul' for unordered list or 'ol' for ordered list).
     *   - 'listClass' (string): CSS class for the list.
     *   - 'itemClass' (string): CSS class for list items.
     *   - 'linkClass' (string): CSS class for links within list items.
     *   - 'ref' (bool): Show item references ( element span ) to another pages.
     *   - 'refClass' (string): CSS class for the references span element.
     * @return string - The generated HTML list.
     */
    public static function listLinks(PageArray $items, $opt = array()) {

        if(!$items instanceof PageArray) return '';
        if ($items->count() === 0) return ''; // No items to list.

        // reset variables
        $itemSpan = '';
        $listHTML = '';

        $default = [
            'heading' => '',        // Optional heading.
            'listType' => 'ul',     // Default to an unordered list.
            'listClass' => 'list-class',
            'itemClass' => 'item-class',
            'linkClass' => 'link',
            'ref' => false,
            'refClass' => 'reference-class',
        ];
        $opt = array_merge($default, $opt);

        foreach ($items as $item) {

            // item references
            $countRef = $item->references();

            if($opt['ref'] && !$countRef) {
                continue;
            }

            if( $opt['ref'] ) {
                $itemSpan = self::span(" (". count($countRef) . ")", ['class' => $opt['refClass']]);
            }

            $linkItem = self::a($item->url, $item->title . $itemSpan, ['class' => $opt['linkClass']]);

            $listHTML .= self::li($linkItem, ['class' => $opt['itemClass']]);
        }
        return $opt['heading'] . self::el($opt['listType'], $listHTML,[
            'class' => $opt['listClass'],
            'hx-boost' => setting('hxBoost') ? 'true' : 'false'
        ]);
    }

    /**
     * Generate an HTML Page reference list (ul or ol) with links using PageArray.
     * @param PageArray $items
     * @param array $opt - Configuration options:
     * @see listLinks()
     */
    public static function refItems($items, $opt = array()) {

        if(!$items instanceof PageArray) return '';
        if(!$items->count) return '';

        $default = [
                'heading' => '',
                'listClass' => 'refItems',
                'linkClass' => 'btn',
                'ref' => true
        ];
        $opt = array_merge($default, $opt);

        if(!$opt['heading'] && $items->parent()[0]['url'] && $items->parent()[0]['title']) {
            $opt['heading'] = self::h3('&#10095;&nbsp;' . self::a($items->parent()[0]['url'], $items->parent()[0]['title']),
            ['hx-boost' => setting('hxBoost') ? 'true' : 'false']);
        }

        return self::listLinks($items,$opt);
    }

    /**
     * Return HTML (style) tag.
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function styleTag($content = '', $attr = [], $opt = []) {
        $el = 'style';

        if(setting('csp') == true && !isset($attr['nonce'])) {
            $attr['nonce'] = session()->cspNonce;
        }

        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (script) tag.
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function scriptTag($content = '', $attr = [], $opt = []) {
        $el = 'script';

        if(setting('csp') == true && !isset($attr['nonce'])) {
            $attr['nonce'] = session()->cspNonce;
        }
        // Return the element
        return self::el($el, $content, $attr, $opt);
    }

    /**
     * Return HTML (script src) tag.
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function scriptSrcTag($content = '', $attr = [], $opt = []) {

        $el = 'script';

        // allow to empty content
        $opt['allowEmpty'] = true;

        // set csp
        if(setting('csp') == true && !isset($attr['nonce'])) {
            $attr['nonce'] = session()->cspNonce;
        }

        if(isset($attr['defer']) && $attr['defer'] == false) {
            unset($attr['defer']);
        } else {
            $attr['defer'] = true;
        }

        $attr['src'] = $content;

        // Return the element
        return self::el($el,'', $attr, $opt);
    }

    /**
     * Return HTML (link stylesheet) tag.
     * @param string $content
     * @param array $attr
     * @param array $opt
     * @return string
     */
    public static function linkStylesheetTag($content = '', $attr = [], $opt = []) {

        $el = 'link';

        // allow to empty content
        $opt['allowEmpty'] = true;

        // set csp
        if(setting('csp') == true && !isset($attr['nonce'])) {
            $optattr['nonce'] = session()->cspNonce;
        }

        $opt['single'] = true;
        $attr['rel'] = 'stylesheet';
        $attr['href'] = $content;

        // Return the element
        return self::el($el,'', $attr, $opt);
    }

    /**
     * Generate multi-language links for language switching.
     *
     * @return string - HTML markup containing language links.
     */
    public static function languageLinks() {
        $site = new Site;
        if (!$site->hasLanguageSupport) return '';

        // Initialize the list of language links.
        $items = '';

        // Iterate through available languages.
        foreach (languages() as $language) {
            // Check if the page is viewable in this language.
            if (!page()->viewable($language)) continue;

            // Determine the CSS class for the current language.
            $class = '';
            if ($language->id == user()->language->id) {
                $class = 'current-lang';
            }

            // Generate the URL and title for the language link.
            $url = page()->localUrl($language->id);
            $langName = pages('/')->getLanguageValue($language, 'name');

            // Handle cases where the title is 'home'.
            if ($langName == 'home') $langName = $site->lang;

            // Create the language link markup.
            $items .= "<a class='ml-link $class' href='$url' alt='$langName' hreflang='$langName'>$langName</a>";
        }

        return $items;
    }

    /**
     * Generate 'hreflang' attributes for a multi-language site.
     *
     * @return string - HTML markup containing 'hreflang' attributes.
     */
    public static function hreflang() {
        $site = new Site;
        if (!$site->hasLanguageSupport) return '';

        // Initialize the output variable to store the markup.
        $out = '<!-- Hreflang attributes -->';

        // Iterate through available languages.
        foreach (languages() as $language) {
            // Skip languages where the page is not viewable.
            if (!page()->viewable($language)) continue;

            // Get the HTTP URL for this page in the given language.
            $url = page()->localHttpUrl($language);

            // Determine the hreflang code for the language (assumes language names match).
            $hreflang = pages('/')->getLanguageValue($language, 'name');

            if ($hreflang == 'home') $hreflang = $site->lang;

            // Output the <link> tag with 'hreflang' attribute.
            $out .= "\t<link rel='alternate' hreflang='$hreflang' href='$url'/>\n";
        }

        return $out;
    }

    /**
     * Returns an HTML (image) tag - either the first image from the PageImages field or a single image URL.
     *
     * @param PageImage|PageImages|string $img The object containing the single image, multiple images, or a string URL.
     * @param array $opt Configuration options:
     *   - 'description' (string): Alt attribute for the image (default: description of the first image in PageImages).
     *   - 'thumb' (bool): If true, resize the image to a thumbnail size (default: false).
     *   - 'lozad' (bool): If true, enable Lazy Loading for the image (default: true).
     *   - 'class' (string): CSS class for the image tag (default: '').
     *   - 'cf' (bool): Preventing `content reflow` from lazy-loaded images.
     *   - 'style' (string): Custom inline CSS styles for the image tag (default: '').
     *   - 'width' (string): Custom width for the image tag (default: '').
     *   - 'height' (string): Custom height for the image tag (default: '').
     * @link https://processwire.com/docs/fields/images/
     * @link https://css-tricks.com/preventing-content-reflow-from-lazy-loaded-images/
     * @return string Returns an HTML image tag or an empty string if no images or parameter errors.
     */
    public static function img($img, $opt = array()) {

        if(!$img) return '';

        // If $img is an instance of PageImages, return a message guiding the usage
        if ($img instanceof PageImages) {
            return 'Load only 1 image like `$page->images->first;` or inside a loop `foreach($page->images as $image) echo img($image);`';
        }
        // Set default instanceof PageImage
        $iop = true;
        // Set image src Attribute
        $src = 'src';
        // Content reflow
        $cf = '';
        // Set default attributes
        $default = [
            'description' => '',
            'thumb' => false,
            'lozad' => true,
            'cf' => true,
            'class' => '',
            'style' => '',
            'width' => '',
            'height' => '',
            'fitCover' => false,
        ];
        // Merge options with default attributes
        $opt = array_merge($default, $opt);

        // If $img is not an instance of PageImage, assume it's a URL string
        if (!$img instanceof PageImage) {
            $imgObject = new \stdClass();
            $imgObject->url = $img;
            $imgObject->width = $opt['width'] ?: '640';
            $imgObject->height = $opt['height'] ?: '420';
            $imgObject->description = $opt['description'];
            $imgObject->ext = pathinfo($img,PATHINFO_EXTENSION);
            // Set variable instanceof PageImage => false
            $iop = false;
            $img = $imgObject;
        }

        // Image description
        if ($opt['description'] && $iop == true) {
            $img->description = $opt['description'];
        }

        // If the 'thumb' option is set to true, create a new image at the specified width
        if ($opt['thumb'] == true && $iop == true) {
            $options = array(
                'quality' => 70,
            );
            $img = $img->width(640, $options);
        }


        $width = $opt['width'] ?: $img->width;
        $height = $opt['height'] ?: $img->width;

        $fitCover = '';
        if($opt['fitCover'] == true) {
            $fitCover = "style='height: {$height}px; object-fit: cover;'";
        }
        $style = $opt['style'] ? "style='$opt[style];'" : $fitCover;
        $class = $opt['class'];


        // If the 'lozad' option is set to true, use Lazy Loading
        if ($opt['lozad']) {
            $src = 'data-src';
            $class = 'lozad ' . $opt['class'];
            if ($opt['cf']) {
                $cf = 'src=' . '"' . "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='{$width}' height='{$height}' viewBox='0 0 {$img->width} {$img->height}'%3E%3C/svg%3E" . '"';
            }
        }

        return <<<HTML
            <img
                {$style}
                {$cf}
                {$src}='{$img->url}'
                class='{$class} _{$img->ext}'
                width='{$width}'
                height='{$height}'
                alt='{$img->description}'
            >
        HTML;
    }

    /**
     * Generates HTML content with optional customization for head and footer.
     *
     * @param string $content The main content to be included in the <main> element.
     * @param array $opt An array of options for customization, including 'customHead' and 'customFooter'.
     *                   - 'title': Html title tag.
     *                   - 'customHead': Custom content to be added within the <head> element.
     *                   - 'customFooter': Custom content to be added before the closing </body> tag.
     *
     * @return string The generated HTML document.
     */
    public static function content($content, $opt = array()) {

        $default = [
            'title' => 'Title',
            'customHead' => '',
            'customFooter' => '',
        ];
        $opt = array_merge($default, $opt);

        return
        <<<HTML
            <!DOCTYPE html>
            <html>
                <head id='head'>
                    <title>$opt[title]</title>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1" />
                    <!-- UIkit CSS -->
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.19.1/dist/css/uikit.min.css" />
                    <!-- UIkit JS -->
                    <script defer src="https://cdn.jsdelivr.net/npm/uikit@3.19.1/dist/js/uikit.min.js"></script>
                    <script defer src="https://cdn.jsdelivr.net/npm/uikit@3.19.1/dist/js/uikit-icons.min.js"></script>
                    <!-- Alpine -->
                    <script defer src="//unpkg.com/alpinejs"></script>
                    <!-- HTMX -->
                    <script defer src='https://unpkg.com/htmx.org@1.9.10'></script>
                    <!-- HYPERSCRIPT -->
                    <!-- <script defer src="https://unpkg.com/hyperscript.org@0.9.12"></script> -->
                    $opt[customHead]
                </head>
                <body>
                    <main id='main' class='uk-container uk-margin-medium-top'>
                        {$content}
                    </main>
                    $opt[customFooter]
                </body>
            </html>
        HTML;
    }

}