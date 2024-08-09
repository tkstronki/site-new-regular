<?php namespace ProcessWire;

/**
 * render component
 */
class Component {

    public function __construct(
        public string $basename = '',
    ) {
        $this->basename = lcfirst(basename(__CLASS__));
    }

    /**
     * Render a component.
     *
     * @param string $name - The name of the component.
     * @param array $componentOptions - Associative array of options to modify behavior:
     *   - 'baseName' (string): The base name for the component, typically derived from the function name. This option is crucial as it forms the basis for other component names and paths. Only change this if you need to change the component's base folder or function name.
     *   - 'componentFolderName' (string): The name of the folder containing the component.
     *   - 'filePath' (string): The file path of the component.
     *   - 'name' (string): The name of the component.
     *   - 'itemClassName' (string): CSS class name for the component.
     *   - 'id' (string): The ID attribute for the component.
     *   - 'class' (string): Additional CSS classes for the component.
     *   - 'content' (string): The content of the component.
     *   - 'generate' (bool): Whether to auto-generate the component if it does not exist.
     *   - 'showID' (int): Show the component only if this ID is not equal to the current page ID.
     *   - 'hideID' (int): Hide the component if this ID is equal to the current page ID.
     *   - 'cspNonce' (string): Content-Security-Policy nonce, retrieved from the session.
     *   - 'hxBoost' (string): HTMX boost attribute.
     * @param array $opt - Render options, see WireFileTools::render().
     * @return string - The rendered component HTML.
     */
    public function render($name, array $componentOptions = [], $opt = []) {

        // Hide the component if requested (e.g., setting('_customComponentName','remove'))
        if (setting($name) == 'remove') return '';

        // Set baseName, default to the function name if not provided.
        $componentOptions['baseName'] = $componentOptions['baseName'] ?? $this->basename;

        // Generate a unique item class name
        $itemClassName = $componentOptions['baseName'] . $name;

        // Default options
        $defaultOptions = [
            'componentFolderName' => $componentOptions['baseName'] . 's',
            'filePath' => paths()->templates . $componentOptions['baseName'] . "s/{$name}.php",
            'type' => ucfirst($componentOptions['baseName']),
            'name' => basename($name),
            'itemClassName' => $itemClassName,
            'id' => '',
            'class' => '',
            'content' => '',
            'generate' => config()->debug,
            'showID' => null,
            'hideID' => null,
            'cspNonce' => session()->get('cspNonce') ?: '',
            'hxBoost' => setting('hxBoost') ? " hx-boost='true'" : " hx-boost='false'",
        ];

        // Merge component options with default options
        $componentOptions = array_merge($defaultOptions, $componentOptions);

        // If the component name contains a '/', replace it with '_' in the item class name
        if(str_contains($name, '/')) {
            $componentOptions['itemClassName'] = $componentOptions['baseName'] . '_' . str_replace('/', '_', $name);
            if(str_contains($componentOptions['itemClassName'], '__')) {
                $componentOptions['itemClassName'] = str_replace('__','_',$componentOptions['itemClassName']);
            }
        }

        // Set id
        $componentOptions['id'] = $componentOptions['id'] ?: $componentOptions['itemClassName'];

        // Set CSS class
        $componentOptions['class'] = $componentOptions['itemClassName'] . ($componentOptions['class'] ? " {$componentOptions['class']}" : '');

        // Show/hide the component based on specified IDs
        if ($componentOptions['showID'] && $componentOptions['showID'] != page()->id) return '';
        if ($componentOptions['hideID'] && $componentOptions['hideID'] == page()->id) return '';

        // Create HTML comments for the component
        $htmlComments = "<!-- \\ " . $componentOptions['baseName'] . ' ' .$componentOptions['name'] . " \-->\n";

        // Generate a custom component if it doesn't exist and auto-generation is enabled
        if (!file_exists($componentOptions['filePath']) && $componentOptions['generate']) {
            return $this->generateComponent($name, $componentOptions);
        }

        // if debug == false not show empty component in production mode
        if (!file_exists($componentOptions['filePath']) && !$componentOptions['generate']) return '';

        // Render the component content
        $renderedItem = files()->render($componentOptions['filePath'], $componentOptions, $opt);

        // Check if the rendered item is null and return an empty string if so
        if ($renderedItem == '') return '';

        // Return the component content with comments, before, and after
        return "$htmlComments $renderedItem\n";
    }

    /**
     * Render a partial component.
     *
     * @param string $name - The name of the partial component.
     * @param array $partialOptions - Associative array of options for rendering the partial:
     *   - 'baseName' (string): Component folder name ('partials' by default).
     * @param array $opt - Render options, see WireFileTools::render().
     * @return string - The rendered partial component HTML.
     */
    public function partial($name, $partialOptions = array(), $opt = array()) {

        if (!$name) return '';

        $customPath = false;

        $customOptions = [
            'baseName' => basename(__FUNCTION__),
        ];
        // Merge all with default Options
        $partialOptions = array_merge($customOptions, $partialOptions);

        // SET CSS partial
        if(str_contains($name,'-JS') && !str_contains($name,'/')) {
            $partialPath = paths()->templates . $partialOptions['baseName'] . "s/js/{$name}.php";
            $customPath = true;
        }

        // SET JS partial
        if(str_contains($name,'-CSS') && !str_contains($name,'/')) {
            $partialPath = paths()->templates . $partialOptions['baseName'] . "s/css/{$name}.php";
            $customPath = true;
        }

        if($customPath == true) {
            $partialOptions['filePath'] = $partialPath;
        }

        // Render the partial component using the 'component()' function.
        return $this->render($name, $partialOptions, $opt);
    }

    /**
     * render custom blocks
     */
    public function block($name, $blockOptions = array(), $opt = array()) {
        $customOptions = [
            'baseName' => basename(__FUNCTION__),
        ];
        // Merge all with default Options
        $blockOptions = array_merge($customOptions, $blockOptions);
        // return partial
        return $this->partial($name, $blockOptions, $opt);
    }

    /**
     * Load scriptContent() styleContent() region
     * @link https://processwire.com/blog/posts/processwire-3.0.39-core-updates/#new-region-function
     */
    public function renderRegions() {
        $regions = region('*');
        $allRegions = '';
        foreach ($regions as $key => $item) {
            $allRegions .= "\n<!-- Region  / $key / -->\n$item";
        }
        return $allRegions;
    }

    /**
     * Generate a custom component file and redirect to the current page.
     *
     * @param string $name - The name of the component.
     * @param array $componentOptions - Associative array of options for generating the component:
     *   - 'componentFolderName' (string): Component folder name.
     *   - 'filePath' (string): Component file path.
     *   - 'name' (string): Component name.
     * @return string|Session::___redirect - The path to the generated component file or a redirect to the current page after generating the component.
     */
    private function generateComponent($name, $componentOptions = array()) {

        // get the generator type
        $generator = '_' . lcfirst($componentOptions['type']);


        $content = $this->defaultContent();

        // SET CSS partial
        if(str_contains($name,'-JS') && $generator == '_partial') {
            $content = $this->scriptContent();
        }

        // SET JS partial
        if(str_contains($name,'-CSS') && $generator == '_partial') {
            $content = $this->styleContent();
        }

        // Replace placeholder with the component name.
        $content = str_replace(
            [
                'setItemName',
            ],
            [
                "$componentOptions[name]",
            ],
            $content
        );

        // create directory
        $dir = files()->mkdir(dirname($componentOptions['filePath']),true);

        if(!$dir) return 'Problem with generate component Content';

        // Generate the component file.
        if(files()->filePutContents($componentOptions['filePath'], $content)) {
            // Redirect back to the current page.
            return session()->redirect(page()->url);
        }
    }

    /**
     * Content scripts
     */
    private function scriptContent() {
        return
        <<<"TEXT"
        <?php namespace ProcessWire;

            /**
             * Name setItemName
             * @var string \$name
             * @var string \$content
             *
             */

            // content
            \$content = <<<JS
                alert('Generate - \$name');
            JS;

            return Html::scriptTag(\$content);
        TEXT;
    }

    /**
     * Content styles
     */
    private function styleContent() {
        return
        <<<"TEXT"
        <?php namespace ProcessWire;

            /**
             * Name setItemName
             * @var string \$content
             *
             */

            // content
            \$content = <<<CSS
                body {
                    background: red;
                    color: white;
                }
            CSS;

            return Html::styleTag(\$content);
        TEXT;
    }

    /**
     * default content
     */
    private function defaultContent() {
        return <<<"TEXT"
        <?php namespace ProcessWire;

        /**
        * Name setItemName
        * @var string \$id
        * @var string \$type
        * @var string \$name
        * @var string \$class
        * @var string \$itemClassName
        * @var string \$content
        * @var string \$filePath
        * @var string \$hxBoost
        */

        // content
        echo <<<HTML
        <div id='{\$id}' class='{\$class}'>

            <h3>{\$type} {\$name}</h3>

            {\$content}

            <p>{\$type} path -> <code>{\$filePath}</code></p>
            <p>{\$type} id -> <code>{\$id}</code></p>
            <p>{\$type} CSS Class Name -> <code>{\$itemClassName}</code></p>
            <p>Load {\$type} CSS / JS -> <code>echo region('\$itemClassName');</code></p>

        </div>
        HTML;

        // CSS
        \$style = <<<CSS
            .{\$itemClassName} {
                background: var(--color-navy);
                color: var(--color-teal);
                padding: var(--sp-md);

                p {
                    color: var(--color-white);
                }

                h1,h2,h3 {
                    color: var(--color-orange);
                }

                code {
                    color: var(--color-purple);
                }
            }
        CSS;

        // JS
        \$script = <<<JS
            console.log('{\$itemClassName}');
        JS;

        // set region
        region(\$itemClassName, Html::styleTag(\$style) . Html::scriptTag(\$script));
        TEXT;
    }
}
