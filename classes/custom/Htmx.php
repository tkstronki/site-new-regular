<?php namespace ProcessWire;

/**
 * Load content using HTMX for dynamic updates.
 *
 * Usage
 * ```php
 *
    // set htmx
    $htmx = new Htmx;

    // load page body as modal
    $personalData = pages()->get(1051);
    echo $htmx->getOne($personalData->id,'body', 'Read more',['class' => '-icon -primary']);
    echo $htmx->getOneModal($personalData->id,'body', 'Read more - modal' . (new Icon)->render('arrow-square-in'),['class' => '-icon -primary']) . '<br>';

    // get partial
    echo $htmx->getPartial('_helloWorld', 'Hello') . '<br>';

    // get partial modal
    echo $htmx->getPartialModal('_helloWorld','Hello Modal') . '<br>';
 * ```
 *
 * This generate html element like button with customizations
    * This function allows you to load and update content on a web page dynamically using HTMX.
    *
    * @param string $item - The content item identifier.
    * @param array $opt - Configuration options:
    *   - 'content' (string): The content to be displayed within the HTML element.
    *   - 'id' (string): The HTML element ID.
    *   - 'class' (string): CSS classes for the HTML element.
    *   - 'style' (string): CSS styles for the HTML element.
    * @return string - The generated HTMX content element.
    */
class Htmx {

    private array $attr = [];
    private array $opt = [];

    public function __construct() {

        $this->opt = [
            'elType' => 'button',
            'requestVariable' => '',
            'modal' => false, // set get variables
        ];

        $this->attr = [
            'id' => '',
            'class' => 'btn',
            'style' => '',
            'hx-trigger'=> 'click',// click once
            'hx-get' => '',
            'hx-post' => '',
            'hx-target' => 'this',
            'hx-swap' => 'outerHTML', // afterend
        ];

    }

    public function render($content = '', $attr = [], $opt = []  ) {

        if(!$content) $content = 'Content';

        // set default options ( https://stackoverflow.com/questions/37714168/php-array-filter-for-false-value )
        $defOpt = array_filter($this->opt, function($x) { return !(is_null($x) || $x === "False"); });
        $opt = array_merge($defOpt, $opt);

        // set element
        $el = $opt['elType'];

        // set attributes
        $defAttr = array_filter($this->attr);
        $attr = array_merge($defAttr, $attr);

        // set requests variable
        $modal = var_export($opt['modal'], true);
        $request = "?modal=$modal";

        if(!empty($opt['requestVariable'])) {
            $request .= '&'.$opt['requestVariable'];
        }

        // cleanup get url
        if(isset($attr['hx-get'])) {
            $attr['hx-get'] = Helper::cleanURL($attr['hx-get'] . $request);
        }

        // cleanup post url
        if(isset($attr['hx-post'])) {
            $attr['hx-post'] = Helper::cleanURL($attr['hx-post']);
        }

        // return Html element
        return Html::el($el, $content, $attr, $opt);
    }


    /**
     * Request get specific url
     */
    public function get($url, $content = '', $attr = [], $opt = []) {
        if(!$url) return '';
        $attr['hx-get'] = $url;
        return $this->render($content, $attr, $opt);
    }

    public function getOne($pageID, $fieldToFind, $content = '', $attr = [], $opt = []) {
        $url = Helper::setURL("_find-one_{$pageID}_{$fieldToFind}");
        return $this->get($url, $content, $attr, $opt);
    }

    public function getOneModal($pageID, $fieldToFind, $content = '', $attr = [], $opt = []) {
        $opt['modal'] = true;
        $customAttr = [
            'hx-target' => 'body',
            'hx-swap' => 'afterbegin'
        ];
        $attr = array_merge($customAttr, $attr);
        return $this->getOne($pageID, $fieldToFind, $content, $attr, $opt);
    }

    /**
     * Get partial
     */
    public function getPartial($name = '', $content = '', $attr = [], $opt = []) {
        if(!$name) return '';
        $url = Helper::partialURL($name);
        return $this->get($url, $content, $attr, $opt);
    }

    /**
     * Get partial
     */
    public function getPartialModal($name = '', $content = '', $attr = [], $opt = []) {
        $opt['modal'] = true;
        $customAttr = [
            'hx-target' => 'body',
            'hx-swap' => 'afterbegin'
        ];
        $attr = array_merge($customAttr, $attr);
        return $this->getPartial($name, $content, $attr, $opt);
    }

    /**
     * Get component via modal
     */
    public function getComponent($name = '', $content = '', $attr = [], $opt = []) {
        if(!$name) return '';
        $url = Helper::componentURL($name);
        return $this->get($url, $content, $attr, $opt);
    }

    /**
     * Get component via modal
     */
    public function getComponentModal($name = '', $content = '', $attr = [], $opt = []) {
        $opt['modal'] = true;
        $customAttr = [
            'hx-target' => 'body',
            'hx-swap' => 'afterbegin'
        ];
        $attr = array_merge($customAttr, $attr);
        return $this->getComponent($name, $content, $attr, $opt);
    }

    /**
     * Request post specific url
     */
    public function post($url, $content, $attr = [], $opt = []) {
        if(!$url) return '';
        $attr['hx-post'] = $url;
        return $this->render($content, $attr, $opt);
    }

    /**
     * return HTMX hx-boost attribute
     *
     * @param null|bool $hxBoost
     * @return string - boost attribute
     */
    public function hxBoost($hxBoost = null) {

        $hxSetting = setting('hxBoost') ? 'true' : 'false';

        if(is_bool($hxBoost)) {
            $hxSetting = var_export($hxBoost, true);
        }

        return "hx-boost=$hxSetting";
    }
}