<?php namespace ProcessWire;

class ColorMode {

    /**
     * @param array $t Translation strings
     */
    public function __construct(
        public array $t = [],
        public string $defaultTheme = '',
        public string $id = '',
    ) {

        // translate
        $this->t = [
            // Color mode
            'lightTheme' => (new Translations)->render('lightTheme'),
            'cyberPunkTheme' => (new Translations)->render('cyberPunkTheme'),
            'darkTheme' => (new Translations)->render('darkTheme'),
            'selectColor' => (new Translations)->render('selectColor'),
        ];

        $this->id = basename(__CLASS__);
    }

    public function render() {
        // strings
        $strSelectColor = $this->t['selectColor'];
        $strLightTheme = $this->t['lightTheme'];
        $strDarkTheme = $this->t['darkTheme'];
        $strCyberPunkTheme = $this->t['cyberPunkTheme'];

        // Color Palette
        $colorPalette = [
            $strLightTheme => 'basic',
            $strDarkTheme => 'dark',
            $strCyberPunkTheme => 'cyberpunk',
        ];

        // set default theme
        $defaultTheme = array_keys($colorPalette)[0]; // 0 = basic, 1 = dark, 2 = cyberpunk
        $defaultTheme = $colorPalette[$defaultTheme];

        // set default theme
        $this->defaultTheme = $defaultTheme;

        $icon = icon('palette');

        $option = '';
        foreach ($colorPalette as $name => $value) {
            $option .= <<<HTML
                    <option value='{$value}' class='option-$value'>{$name}</option>
                HTML;
        }

        $legend = isset($showLegend) && $showLegend == true ? "<legend>{$strSelectColor}</legend>" : '';

        // content
        $content = <<<HTML
        <fieldset id='{$this->id}' class='{$this->id}'>
            {$legend}
            <label class='-labels'>{$icon}
                <select aria-label="State" class='colorPalette' id='colorPalette' name='colorPalette'>
                    {$option}
                </select>
            </label>
        </fieldset>
        HTML;
        // return all
        return $content . $this->load();
    }

    public function load() {
        $style = <<<CSS
        .{$this->id} {
            .-labels {
                select {
                    margin-bottom: 0;
                }
                display: flex;
                align-items: center;
                gap: var(--sp-3xs);
            }
        }
        CSS;

        $script = <<<JS
            var defaultTheme = '{$this->defaultTheme}';
            var storedTheme = localStorage.getItem('theme');

            if (storedTheme) {
                document.documentElement.setAttribute("data-theme", storedTheme);
            } else {
                document.documentElement.setAttribute("data-theme", defaultTheme);
            }

            var colorSelect = document.getElementById('colorPalette');

            if (colorSelect) {
                function setTheme(themeName) {
                    localStorage.setItem('theme', themeName);
                    document.documentElement.setAttribute("data-theme", themeName);
                }

                function changeColor() {
                    var selectedColor = colorSelect.value;
                    setTheme(selectedColor);
                }

                colorSelect.addEventListener('change', changeColor);

                if (storedTheme) {
                    colorSelect.value = storedTheme;
                } else {
                    colorSelect.value = defaultTheme;
                }
            }
        JS;

        return "<style>{$style}</style><script>{$script}</script>";
    }

}
