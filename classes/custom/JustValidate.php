<?php namespace ProcessWire;

/**
 * Example usage of JustValidate for form validation.
 * This code demonstrates how to configure validation for different form fields
 * with various validation rules such as required fields, minimum length,
 * and file validation.
 *
 * @link https://just-validate.dev/docs/intro
 * @link https://just-validate.dev/docs/category/rules
 *
 * ```php
    $formID = 'FormID';
    echo JustValidate::init($formID)
    ->field('name')
        ->rule('required', 'Fill name')
        ->rule('minLength', 3, 'Field is too short')
    ->field('email')
        ->rule('email', 'Fill property email')
        ->rule('required', 'Set email address')
        ->rule('minLength', 3, 'Field is too short')
    ->field('files')
        ->rule('maxFilesCount', 2, 'Set maximum 2 files')
        ->rule('minFilesCount', 1, 'Minimum 1 files')
        ->ruleFiles([
            'extensions' => ['jpeg', 'jpg', 'png'],
            'maxSize' => 1.5, // 1.5MB
            'minSize' => 0.01, // 10kb
            'errorMessage' => 'Invalid file format or size',
        ])
    ->render();
 * ```
 */

class JustValidate {
    private $fields = [];
    private $currentField;

    public function __construct(private string $formID) {}

    public static function init($formID) {
        return new self($formID);
    }

    public function field($fieldName) {
        $fieldId = "{$this->formID}_{$fieldName}";
        if (!isset($this->fields[$fieldId])) {
            $this->fields[$fieldId] = [];
        }

        $this->currentField = $fieldId;
        return $this; // We return a JustValidate object to enable chaining of method calls
    }

    public function rule($rule = '', $value = '', $message = '') {
        if ($rule == 'required' || $rule == 'email') {
            $message = $value;
            $value = '';
        }
        $this->fields[$this->currentField][] = [
            'rule' => $rule,
            'message' => $message,
            'value' => $value,
        ];
        return $this; // We return a JustValidate object to enable chaining of method calls
    }

    public function ruleFiles($rules) {

        $this->fields[$this->currentField][] = [
            'rule' => 'files',
            'message' => $rules['errorMessage'],
            'value' => [
                'files' => [
                    'extensions' => $rules['extensions'],
                    'maxSize' => isset($rules['maxSize']) ? intval(Helper::convertFileSize($rules['maxSize'],false)) : null, // bytes
                    'minSize' => isset($rules['minSize']) ? intval(Helper::convertFileSize($rules['minSize'],false)) : null, // optional
                    'types' => isset($rules['types']) ? $rules['types'] : null, // optional
                ],
            ],
        ];
        return $this; // We return a JustValidate object to enable chaining of method calls
    }

    public function addRule($fieldId, $rule, $message, $value) {
        $this->fields[$fieldId][] = [
            'rule' => $rule,
            'message' => $message,
            'value' => $value,
        ];
    }

    public function render() {
        $validateRules = '';
        foreach ($this->fields as $fieldId => $rules) {
            $validateRules .= ".addField('#{$fieldId}', [\n";
            foreach ($rules as $rule) {
                $value = '';
                if (isset($rule['value']) && is_array($rule['value'])) {
                    $value = "\t value: " . json_encode($rule['value']) . ",\n";
                } elseif (isset($rule['value']) && $rule['value'] !== '') {
                    $value = "\t value: " . json_encode($rule['value']) . ",\n";
                }
                $validateRules .= "  { \n \t rule: '{$rule['rule']}', \n \t errorMessage: '{$rule['message']}', \n {$value} },\n";
            }
            $validateRules .= "])\n";
        }

        $script = <<<HTML
        <script type='module'>
            const addScript = async src => new Promise((resolve, reject) => {
                const el = document.createElement('script');
                el.src = src;
                el.addEventListener('load', resolve);
                el.addEventListener('error', reject);
                document.body.append(el);
            });

            try {
                await addScript('https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js');
                // do something after it was loaded
                initializeJustValidte();
            } catch (e) {
                console.log(e);
            }

            function initializeJustValidte() {
                let validateForm = document.getElementById('$this->formID');
                if (validateForm != null) {
                    const validator = new JustValidate('#{$this->formID}');
                    validator
                    {$validateRules}
                    .onSuccess((event) => {
                        event.currentTarget.submit();
                    });
                }
            }
        </script>
    HTML;

    return $script;
    }
}
