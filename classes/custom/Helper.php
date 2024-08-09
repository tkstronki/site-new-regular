<?php namespace ProcessWire;

/**
 * Helpers for site
 */
class Helper {

    // public function __construct(Type $var = null) {
    //     $this->var = $var;
    // }

    /**
     * Cleanup URL
     */
    public static function cleanURL($url = '') {
        if(!$url) return '';
        // Sanitize the URL to ensure it is safe.
        $url = sanitizer()->url($url);
        // Sanitize HTML entities in the URL.
        $url = sanitizer()->entities($url);

        return $url;
    }


    /**
     * set base URL connect to siteUrl
     */
    public static function setURL($url = '', $lang = '') {
        // set language prefix
        if($lang || setting('lang')) {
            $lang = setting('lang') ?: $lang;
            $lang .= '/';
        }

        // Construct a full URL using the HTTP host and provided URL.
        $url = input()->httpHostUrl() . "/{$lang}{$url}";

        // cleanup url
        $url = self::cleanUrl($url);

        return $url;
    }

    /**
     * return url to partial using new URL/path Hooks
     * @link https://processwire.com/blog/posts/pw-3.0.173#introducing-url-path-hooks
     */
    public static function partialURL($partialName) {
        $partialURL = '_load-partial'. $partialName;
        return Helper::setURL($partialURL);
    }

    /**
     * return url to component using new URL/path Hooks
     * @link https://processwire.com/blog/posts/pw-3.0.173#introducing-url-path-hooks
     */
    public static function componentURL($componentName) {
        $componentURL = '_load-component'. $componentName;
        return Helper::setURL($componentURL);
    }


    /**
     * Load partials or components
     * @param HookEvent $event / Custom event
     * @param string $type / load partial or component
     */
    public static function loadHook(HookEvent $event, $type) {

        $type = sanitizer()->text($type);

        $itemName = sanitizer()->entities($event->name);
        $itemName = sanitizer()->text($itemName);
        $modal = input()->get('modal');

        // find one item
        $findOne = function () use($event) {
            $id = sanitizer()->int($event->pageID);
            $field = sanitizer()->selectorValue($event->field);
            $item = pages()->findOne("id=$id,has_parent!=2,include=hidden")->$field;
            if(!$item) return '';
            return $item;
        };

        $item = match ($type) {
            'partial'  => (new Component)->partial($itemName) . region($type . $itemName), // Set component, partial with region ( css js )
            'component' => (new Component)->render($itemName) . region($type . $itemName),
            'findOne' => $findOne(),
            default => false,
        };

        if($item == false) return '';

        if( $modal == 'true' ) {

            $zx = time();
            $icon = (new Icon)->render('x');
            $style = Html::styleTag(<<<CSS
                body.modal-opened-{$zx} {
                        overflow: hidden;
                    }
                    .root-{$zx} {
                        background: color-mix(in srgb, var(--color-black), transparent 10%);
                        display: grid;
                        justify-items: center;
                        gap: var(--sp-xs);
                        padding: var(--sp-md) var(--sp-md);
                        box-sizing: border-box;
                        overflow: auto;
                        z-index: {$zx};
                        &.overlay {
                            background: color-mix(in srgb, var(--bg-color), transparent 8%);
                        }
                    }
                    .el {
                        /* min-width: 100%; */
                        padding: var(--sp-xl);
                        button {
                            margin: var(--sp-xl) 0;
                        }
                        @media (min-width: 42rem) {
                            min-width: var(--mw-2xs);
                            max-width: var(--mw-lg);
                        }
                    }
            CSS);

            return <<<HTML
                <div
                    id='root-{$zx}'
                    class='root-{$zx} overlay'
                    x-data="{ open: true }"
                    x-init="\$el.classList.add('fade-in'); document.body.classList.add('modal-opened-{$zx}');"
                >
                    {$style}

                    <div
                        class='el'
                        x-show="open"
                    >
                        <button
                            class='-icon'

                            @click=
                                "\$root.classList.add('fade-out'); document.body.classList.remove('modal-opened-{$zx}');
                                setTimeout(() => \$root.remove(), 400);"
                        >{$icon}</button>
                        {$item}
                    </div>
                </div>
            HTML;
        }

        return $item;
    }

    /**
     * Convert file size between bytes and megabytes
     *
     * @param int|float $size The file size to convert
     * @param bool $toMB True to convert from bytes to megabytes, False to convert from megabytes to bytes
     * @param bool $prefix Set prefix
     * @return int|float|string The converted file size
     */
    public static function convertFileSize($size, $toMB = true, $prefix = false) {
        if ($toMB) {
            // set prefix
            $prefix = $prefix ? $prefix . 'MB' : '';
            // Convert bytes to megabytes
            $convertedSize = $size / 1048576; // 1 MB = 1048576 bytes
            // Format the result to one decimal place
            $formattedSize = number_format($convertedSize) . $prefix;
        } else {
            $prefix = $prefix ? $prefix . 'bytes' : '';
            // Convert megabytes to bytes
            $convertedSize = $size * 1048576; // 1 MB = 1048576 bytes
            $formattedSize = $convertedSize . $prefix;
        }
        return $formattedSize;
    }

}