<?php namespace ProcessWire;

/**
 * Class Macy
 *
 * This class provides a PHP wrapper for initializing Macy.js with ProcessWire.
 * Macy.js is a lightweight JavaScript library used for creating masonry layouts.
 * This class allows for easy configuration and integration of Macy.js with various settings.
 *
 * @link https://github.com/bigbite/macy.js
 * Usage:
 *
 * ```php
    // Instantiate the Macy class
     $macy = new Macy('#macy-container');

     // Set options
     $macy->setTrueOrder(true)
          ->setWaitForImages(true)
          ->setMargin(16)
          ->setColumns(4)
          ->setBreakAt([
              1200 => 4,
              940 => 3,
              720 => 2,
              400 => 1
          ])
          ->setThreshold(0.1); // 10% visibility threshold

     // Render the Macy.js initialization script
     $macy->render();
 * ```
 *
 * @package ProcessWire
 */
class Macy {
    private $container;
    private $trueOrder;
    private $waitForImages;
    private $margin;
    private $columns;
    private $breakAt;
    private $threshold;

    // Macy script URL
    private $macyScriptUrl;

    /**
     * Constructor to initialize Macy options and script URL.
     *
     * @param string $container The CSS selector for the container.
     * @param float $threshold Visibility threshold (0.01 means 1% visibility).
     */
    public function __construct($container = '#macy-container', $threshold = 0.01) {
        // Macy options
        $this->container = $container;
        $this->trueOrder = false;
        $this->waitForImages = true;
        $this->margin = 20;
        $this->columns = 3;
        $this->breakAt = [
            1200 => 4,
            800 => 3,
            600 => 2,
            400 => 1
        ];
        $this->setThreshold($threshold);

        // Macy script URL
        $this->macyScriptUrl = 'https://cdn.jsdelivr.net/npm/macy@2';
    }

    /**
     * Set the trueOrder option.
     *
     * @param bool $trueOrder Whether to maintain the order of items.
     * @return Macy
     */
    public function setTrueOrder($trueOrder) {
        $this->trueOrder = (bool)$trueOrder;
        return $this;
    }

    /**
     * Set the waitForImages option.
     *
     * @param bool $waitForImages Whether to wait for images to load.
     * @return Macy
     */
    public function setWaitForImages($waitForImages) {
        $this->waitForImages = (bool)$waitForImages;
        return $this;
    }

    /**
     * Set the margin between grid items.
     *
     * @param int $margin The margin size in pixels.
     * @return Macy
     */
    public function setMargin($margin) {
        $this->margin = (int)$margin;
        return $this;
    }

    /**
     * Set the number of columns in the grid.
     *
     * @param int $columns The number of columns.
     * @return Macy
     */
    public function setColumns($columns) {
        $this->columns = (int)$columns;
        return $this;
    }

    /**
     * Set the breakpoints for responsive design.
     *
     * @param array $breakAt Associative array with screen widths as keys and column counts as values.
     * @return Macy
     */
    public function setBreakAt(array $breakAt) {
        $this->breakAt = $breakAt;
        return $this;
    }

    /**
     * Set the threshold for visibility in IntersectionObserver.
     *
     * @param float $threshold Visibility threshold (between 0 and 1).
     * @return Macy
     */
    public function setThreshold($threshold) {
        // Ensure the threshold is between 0 and 1
        if ($threshold < 0 || $threshold > 1) {
            throw new \InvalidArgumentException('Threshold must be a float between 0 and 1.');
        }
        $this->threshold = (float)$threshold;
        return $this;
    }

    /**
     * Set the URL for the Macy.js script.
     *
     * @param string $url The URL of the Macy.js script.
     * @return Macy
     */
    public function setMacyScriptUrl($url) {
        $this->macyScriptUrl = $url;
        return $this;
    }

    /**
     * Convert the breakAt array to a JavaScript object.
     *
     * @return string The breakAt settings as a JavaScript object string.
     */
    private function breakAtToJsObject() {
        $jsObject = '';
        foreach ($this->breakAt as $key => $value) {
            $jsObject .= "$key: $value, ";
        }
        return rtrim($jsObject, ', '); // Remove the last comma and space
    }

    /**
     * Generate and output the Macy.js initialization script.
     */
    public function render() {
        $breakAtJsObject = $this->breakAtToJsObject();
        $trueOrderJs = var_export($this->trueOrder, true);
        $waitForImagesJs = var_export($this->waitForImages, true);
        $thresholdJs = var_export($this->threshold, true);

        $js = <<<JS
            // Macy.js initialization function
            function initializeMacy() {
                var macy = Macy({
                    container: '{$this->container}',
                    trueOrder: {$trueOrderJs},
                    waitForImages: {$waitForImagesJs},
                    margin: {$this->margin},
                    columns: {$this->columns},
                    breakAt: {{$breakAtJsObject}}
                });
            }

            // Function to observe the visibility of an element
            function observeMacyContainer() {
                const macyContainer = document.querySelector('{$this->container}');
                if (macyContainer) {
                    const containerObserver = new IntersectionObserver((entries) => {
                        entries.forEach(entry => {
                            if (entry.isIntersecting) {
                                initializeMacy();
                                containerObserver.unobserve(entry.target); // Unfollow an item
                            }
                        });
                    }, {
                        threshold: {$thresholdJs} // Visibility threshold
                    });

                    containerObserver.observe(macyContainer);
                }
            }

            // Set a function to call when lozad.js finishes loading images
            window.onLozadLoaded = function() {
                observeMacyContainer();
            };
        JS;

        // Output the script tags
        region(basename(__CLASS__. '_' .$this->container),Html::scriptSrcTag($this->macyScriptUrl) . Html::scriptTag($js, ['type' => 'module']));
    }
}
