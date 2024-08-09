<?php namespace ProcessWire;

/**
 * get contents from svg icon
 *
 * @link https://phosphoricons.com/ - Visit the Phosphor Icons website.
 */
class Icon {


    /**
     * @param string $iconPath path to icons folder
     * @param array $t Translation strings
     */
    public function __construct(
        public string $iconPath = '', // icon path
        public array $t = [],
        ) {
        // icon path
        $this->iconPath = paths()->templates . 'assets/icons/';

        // translate
        $this->t = [
            'notValid' => __('File is not a valid SVG / %s'),
            'notExist' => __('The icon path does not exist / %s'),
        ];
    }

    /**
     * Generate an SVG icon element.
     *
     * @param string $icon - The name of the icon.
     * @param array $opt - Configuration options:
     *   - 'type' (string): Icon type ('bold', 'duotone', 'fill', 'light', 'regular', 'thin').
     *   - 'size' (string): Icon size md, lg, hx, 2xl, 3xl, 4xl.
     *   - 'icons_folder_path' (string): The path to the icons folder.
     * @return string - The generated SVG icon element or a list of all icons if '$icon' is 'show-all'.
     */
    public function render($icon, $opt = array()) {

        if(!$icon) return '';

        // set defaults
        $defaults = [
            'type' => 'regular', // regular, bold, light, thin
            'size' => 'md'
        ];
        // merge all with default Options
        $opt = array_merge($defaults, $opt);

        $size = match ($opt['size']) {
            'md' => 28,
            'lg' => 32,
            'xl' => 38,
            '2xl' => 46,
            '3xl' => 54,
            '4xl' => 68,
            '5xl' => 76,
            '6xl' => 125,
            '7xl' => 256,
            '8xl' => 512,
            default => 25,
        };

        // Set icon type
        $type = match ($opt['type']) {
            'bold' => '-bold',
            'duotone' => '-duotone',
            'fill', => '-fill',
            'light' => '-light',
            'thin' => '-thin',
            'regular' => '',
            default => '',
        };

        // get file path
        $filePath = $this->iconPath . "$opt[type]/{$icon}{$type}.svg";

        // validate icon
        if($this->checkSvg($filePath)) {
            return $this->checkSvg($filePath);
        }

        // get icon
        $icon = files()->fileGetContents($filePath);

        // remove empty array
        $opt = array_filter($opt);

        // set icon fill / width / height
        $icon = str_replace(['<svg'],["<svg width='$size' height='$size'"], $icon);

        // remove xml from icon
        $icon = str_replace('<?xml version="1.0" encoding="UTF-8"?>', '', $icon);

        // Return icon
        return $icon;
    }

    /**
     * Check the validity of an SVG file.
     *
     * @param string $filePath - The path to the SVG file.
     * @return null|string - Returns null if the SVG file is valid; otherwise, returns an error message.
     */
    public function checkSvg($filePath) {
        // Check if the file exists.
        if (!file_exists($filePath)) {
            return sprintf($this->t['notExist'], $filePath);
        }

        /** @var FileValidatorSvgSanitizer $validator - SVG file validator. */
        $validator = modules()->get('FileValidatorSvgSanitizer');

        // Check if the file is a valid SVG.
        if (!$validator->isValidFile($filePath)) {
            return sprintf($this->t['notValid'], $filePath);
        }
    }

}