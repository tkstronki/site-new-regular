<?php namespace ProcessWire;

class Form {

    public function __construct(
        private string $formID,
        private string $email,
        private array $options = [],
        private array $t = [],
    ) {
        // translations
        $defaultTranslations = [
            'submit' => (new Translations)->render('submit'),
            'legend' => (new Translations)->render('formLegend')
        ];

        // options
        $defaultOptions = [
            'method' => 'POST',
            'action' => '',
            'multipart' => false, // multipart form data
            'attr' => [],
            'legend' => 'Form Legend',
            'class' => '',
        ];
        $this->options = array_merge($defaultOptions, $this->options);
        $this->t = array_merge($defaultTranslations, $this->t);
        $this->options['class'] = $this->options['class'] ? $this->formID . ' ' . $this->options['class'] : $this->formID;
    }

    public function render(array $inputs): string {
        $pageID = input()->get('pageID') ?? '';
        $formClass = $this->options['class'];
        $formOptions = $this->buildFormOptions();
        $csrf = session()->CSRF->renderInput();
        $fields = $this->buildFields($inputs);
        $method = strtoupper($this->options['method']);
        $action = $this->options['action'];
        $legend = $this->options['legend'];
        $legend = $legend ? "<legend class='title' x-intersect=\"animate(\$el, 'fade-slide-right')\">".$this->t['legend']."</legend>" : '';
        return <<<HTML
        <form id="{$this->formID}" class='{$formClass}' method="{$method}" action="{$action}" {$formOptions}>
            <fieldset>
                {$legend}
                {$csrf}
                {$fields}
                <input type="hidden" name="{$this->formID}" value="{$this->formID}">
                <input type="hidden" name="fromPage_{$this->formID}" value="$pageID">
                <button type="submit">{$this->t['submit']}</button>
            </fieldset>
        </form>
        HTML;
    }

    private function buildFormOptions(): string {
        $attributes = [];
        if (!empty($this->options['multipart'])) {
            $attributes[] = 'enctype="multipart/form-data"';
        }
        if (!empty($this->options['attr'])) {
            foreach ($this->options['attr'] as $key => $value) {
                $attributes[] = "{$key}=\"{$value}\"";
            }
        }
        return implode(' ', $attributes);
    }

    private function buildFields(array $inputs): string {
        $formID = $this->formID;
        $fields = '';

        foreach ($inputs as $name => $input) {
            $type = $input['type'];
            $label = $input['label'] ?? '';
            $required = $input['required'] ?? true;
            $requiredClass = $required ? 'required' : '';
            // $inputValue = $input['value'] ?? '';
            // $required = false;
            $id = "{$formID}_{$name}";
            $name = $id;
            $class = $input['class'] ?? '';
            $attr = $input['attr'] ?? [];

            if (isset($input['hideIf']) && $input['hideIf']) {
                continue;
            }

            $attrString = '';
            foreach ($attr as $key => $value) {
                $attrString .= " $key=\"$value\"";
            }

            if($type != 'hidden') {
                $fields .= "<div class=\"form-group wrap-$name\">";
                $fields .= "<label class='label-$name {$requiredClass}' for=\"$id\">$label</label>";
            }

            $fields .= match ($type) {
                'text', 'email', 'hidden' => "<input type=\"$type\" id=\"$id\" name=\"$name\" class=\"$class\" $attrString" . ($required ? ' required' : '') . ">",
                'textarea' => "<textarea id=\"$id\" name=\"$name\" class=\"$class\" $attrString" . ($required ? ' required' : '') . "></textarea>",
                'checkbox' => "<input type=\"checkbox\" id=\"$id\" name=\"$name\" class=\"$class\" $attrString" . ($required ? ' required' : '') . ">",
                'select' => $this->buildSelect($id, $name, $class, $attrString, $input['option'], $required),
                'file' => $this->buildFileInput($id, $name, $class, $attrString, $input, $required),
                default => ''
            };

            if($type != 'hidden') {
                $fields .= "</div>";
            }
        }

        return $fields;
    }

    private function buildSelect(string $id, string $name, string $class, string $attrString, array $options, bool $required): string {
        $select = "<select id=\"$id\" name=\"{$name}\" class=\"$class\" $attrString" . ($required ? ' required' : '') . ">";
        foreach ($options as $value => $label) {
            $select .= "<option value=\"$value\">$label</option>";
        }
        $select .= "</select>";

        return $select;
    }

    private function buildFileInput(string $id, string $name, string $class, string $attrString, array $input, bool $required): string {
        $multiple = $input['multiple'] ?? false;
        $multipleAttr = $multiple ? 'multiple' : '';
        $name = $multiple ? "{$name}[]" : $name;
        $accept = isset($input['accept']) ? 'accept="' . implode(',', array_map(fn($ext) => ".$ext", $input['accept'])) . '"' : '';
        return "<input type=\"file\" id=\"$id\" name=\"$name\" class=\"$class\" $attrString $multipleAttr $accept" . ($required ? ' required' : '') . ">";
    }
}
