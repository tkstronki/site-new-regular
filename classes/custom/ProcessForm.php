<?php namespace ProcessWire;

/**
 * process the form
 *
 * // Basic Usage
 * ```php
 // site options
$site = (new Site);

// set form email, id
$email = $site->email;
$formID = 'formID';

// personal data
$personalData = $site->personalDataPage;
$personalLink = (new Htmx)->getOne($personalData->id,'body', (new Icon)->render('arrow-square-in'),['class' => '-icon -primary',],['modal' => true]);

// set form inputs
$inputs = [
    'name' => [
        'type' => 'text',
        'label' => __('Name'),
    ],
    'email' => [
        'type' => 'email',
        'label' => __('E-mail Address'),
        // 'attr' => ['hello' => 'world']
    ],
    'message' => [
        'type' => 'textarea',
        'label' => __('Message'),
    ],
    'files' => [
        'type' => 'file',
        'label' => __('Send files'),
        'required' => false,
        'multiple' => true,
        'accept' => ['pdf','doc','docx','xls','xlsx','gif','jpg','jpeg','png'],
        'hideIf' => isset($_GET['name']) && $_GET['name'] == 'allo'
    ],
    'personalData' => [
        'type' => 'checkbox',
        'label' => __('Accept Personal Data') . " $personalLink",
    ],
];
$process = new ProcessForm($formID, $email, $inputs);
$process->init();

// render form
echo (new Form($formID, $email, [
        'method' => 'post',
        'multipart' => true,
        // 'legend' => 'hello form',
        // 'attr' => ['hxBoost' => 'true']
]))->render($inputs);
*```
*/
class ProcessForm {

    public function __construct(
        public string $formID, // form id
        public string $companyEmail, // company email
        public array $inputs = [], // Form fields
        public array $opt = [], // default options
        public array $t = [], // main translations
        public string $ip = '',
    ) {

        // default options
        $opt = [
            'uploadFiles' => true,
            'filesRequired' => false,
            'saveMessage' => true,
            'validExtensions' => ['pdf','doc','docx','xls','xlsx','gif','jpg','jpeg','png'],
            'maxFiles' => 6, // count of max files
            'maxFileSize' => 6, // 6MB
            'blackList' => null, // null|array
            'sendMessageToRecipient' => true,
            // options to save page
            'parentTemplate' => 'contact',
            'storedTemplate' => 'contact-item',
            'savedPageAsUnpublished' => true,
            'savedPageAsHidden' => true,
            'redirectTo' => '',
        ];

        // translates
        $t = [
            'succesMessage' => __('Form submitted successfully.'),
            'errorMessage' => __('The form was not submitted correctly.'),
            'thanksMesage' => __('Thanks for your message, we will try to reply to you as soon as possible. Below is the content of your message:'),

            // Upload Files
            'errorUpload' => __('The maximum files is %s, max file size is %sMB and the allowed extensions are: %s'),

            // errors
            'csrfError' => __('Invalid CSRF token'),
            'companyError' => __('Set property company E-mail adress'),
            'blackList' => __('You are on a blacklist `%s` of users and you cannot send us a message via the form :('),
            'isHumanError' => __("You're not human?."),
            'formErrorID' => __('this is the wrong form'),
            'emailError' => __('No valid email found.'),

            // message for the user
            'sendMessageToRecipient' => __('Send the content of the message to me as well'),
            'subjectToRecipient' => __('Thank you for being with us!!!'),

            // Mail content
            'subject' => __('Welcome user in this page'),
            'fillFieldCorrectly' => __('Fill field correctly:'),

            // Submit Error
            'submitError' => __('The form was not submitted correctly..'),
            'errorSave' => __('Page not save correctly..'),
        ];

        // get ip adress
        $this->ip = session()->getIP();

        // sanitize company email
        $companyEmail = sanitizer()->removeWhitespace($this->companyEmail);
        $this->companyEmail = sanitizer()->email($companyEmail);

        // sanitize form id
        $formID = sanitizer()->removeWhitespace($this->formID);
        $this->formID = sanitizer()->string($formID);

        // set main options
        $this->opt = array_merge($opt, $this->opt);
        $this->t = array_merge($t, $this->t);

        // set default
        $inputs = [];

        $this->inputs = $this->inputs ?: $inputs;
    }

    /**
     * Process Form
     */
    public function init() {

        if (!input()->post($this->formID)) return '';

        $flashMessage = new FlashMessage(['redirectTo' => $this->opt['redirectTo']]);

        if (!input()->post($this->formID)) {
            $flashMessage->error($this->t['formErrorID']);
        }

        if (!session()->CSRF->hasValidToken()) {
            $flashMessage->error($this->t['csrfError']);
        }

        if(!$this->companyEmail) {
            $flashMessage->error($this->t['companyError']);
        }

        // set temorary directory
        $tempDir = files()->tempDir();
        $temporaryDirectory = $tempDir->get();

        // reset variables
        $fillFieldCorrectly = $fileRequired = $labelFile = $labelInputName = $label = '';
        $message = [];
        $fileData = [];
        foreach ($this->inputs as $input => $inputOptions) {
            $inputType = $inputOptions['type'];
            $required = isset($inputOptions['required']) ? $inputOptions['required'] : true;
            $inputName = "{$this->formID}_{$input}";

            $data[$input] = match ($inputType) {
                'text' => input()->post($inputName,'text,entities'),
                'textarea' => input()->post($inputName,'textarea,entities'),
                'email' => input()->post($inputName,'email'),
                'checkbox' => input()->post($inputName,'checkbox') ? 'checked' : '',
                'select' => input()->post($inputName, 'text,entities'),
                'file' => $this->handleFileUpload($inputName,$temporaryDirectory),
                'hidden' => input()->post($inputName,'text,entities'),
                default => '',
            };

            // set label
            if( isset($inputOptions['label']) ) {
                $label = strip_tags($inputOptions['label']);
                $label = str_replace("\n","",$label);
            }

            // chek input file
            if(is_array($data[$input])) {
                $fileData[$input] = $data[$input];
                $fileRequired = $required;
                $labelFile = $label;
                $labelInputName = $inputName;
                unset($data[$input]);
            } else {
                $message[$label] = $data[$input];
                if (empty($data[$input]) && $required == true) {

                    $style = Html::styleTag(
                    <<<CSS
                        label[for={$inputName}]{
                            background: var(--color-red);
                            color: var(--color-white);
                        }
                    CSS);
                    $fillFieldCorrectly .= $this->t['fillFieldCorrectly'] . ' ' . $label . "{$style}<br>";
                }
            }
        }

        // filter file data
        $fileData = array_filter($fileData);

        // get recipient email adress from data
        $filtered = array_filter($message, function($value) {
            return filter_var($value, FILTER_VALIDATE_EMAIL);
        });
        $email = array_values($filtered)[0] ?? null;
        if ($email == null) {
            $flashMessage->error($this->t['emailError']);
        }

        // bd($message,'Mesage'); bd($fileData, 'Files Datas'); bd($email, 'E-mail'); die();

        // check blacklist
        $resultBlack = $this->isBlacklisted($email, $this->ip, $this->opt['blackList']);
        if($resultBlack) {
            $flashMessage->error(sprintf($this->t['blackList'],$email));
        }

        // check if files its required
        if($fileRequired && empty($fileData)) {
            $style = Html::styleTag(
            <<<CSS
                label[for={$labelInputName}]{
                    background: var(--color-red);
                    color: var(--color-white);
                }
            CSS);
            $validExtensions = $this->opt['validExtensions'];
            $maxFiles = $this->opt['maxFiles'];
            $maxFileSize = $this->opt['maxFileSize'];
            $validExt = implode(',',$validExtensions);
            $fillFieldCorrectly .= $this->t['fillFieldCorrectly'] . " $labelFile. <br> " .
            Html::small(sprintf($this->t['errorUpload'],$maxFiles, $maxFileSize, $validExt)) . $style;
        }

        // check missing fields
        if($fillFieldCorrectly) {
            $flashMessage->error($fillFieldCorrectly);
        }

        // set content for email message
        $message = function() use($message) {
            $out = '';
            foreach ($message as $key => $value) {
                $out .= "<li>{$key}: $value</li>";
            }
            return $out;
        };
        $message = Html::ul($message());
        // bd($message); die();

        // save message
        if($this->opt['saveMessage']) {
            $this->saveMessage($email, $message, $fileData, $temporaryDirectory);
        }

        // Send mail to your company
        $this->send(
            $this->companyEmail, // to
            $email, // from
            $this->t['subject'],
            $message,
            $fileData,
            $temporaryDirectory
        );

        // Send mail to recipient
        if($this->opt['sendMessageToRecipient']) {
            $this->send(
                $email, // to
                $this->companyEmail, // from
                $this->t['subjectToRecipient'],
                $this->t['thanksMesage'] . '<br> ' . $message,
                $fileData,
                $temporaryDirectory
            );
        }

        // if ok set success message
        $flashMessage->success($this->t['succesMessage']);
    }


    /**
     * Send mail with form data
     *
     * @param string $to The recipient's email address
     * @param string $from The sender's email address
     * @param string $subject The subject of the email
     * @param string $body The body of the email
     * @param array|null $files The uploaded files
     * @param string $temporaryDirectory The path to the uploaded files
     * @return void
     */
    public function send($to, $from, $subject, $body, $files, $temporaryDirectory) {

        $m = wireMail()
            ->to($to)
            ->from($from)
            ->subject($subject)
            ->body(strip_tags($body))
            ->bodyHTML("<html><body><p>$body</p></body></html>");

        if(!empty($files) && is_array($files)) {
            foreach($files as $filename) {
                if(is_array($filename)) {
                    foreach ($filename as $item) {
                        $m->attachment($temporaryDirectory . $item);
                    }
                } else {
                    $m->attachment($temporaryDirectory . $filename);
                }
            }
        }

        $numSent = $m->send();

        // if mail sending problems
        if(!$numSent) {
            (new FlashMessage(['redirectTo' => $this->opt['redirectTo']]))->error($this->t['errorMessage']);
        }
    }

    /**
     * Handle file uploads
     *
     * @param string $input The name of the file input
     * @param string $temporaryDirectory The path to save the uploaded files
     * @param array $opt Optional parameters for file upload restrictions
     * @return array The uploaded files
     */
    public function handleFileUpload($input, $temporaryDirectory) {

        if(!isset($_FILES[$input])) {
            // bd('No found files input');
            return '';
        }

        $errorMessage = '';
        $maxFiles = $this->opt['maxFiles'];
        $maxFileSize = $this->opt['maxFileSize'];
        $validExtensions = $this->opt['validExtensions'];

        // new wire upload
        $u = new WireUpload($input);
        $u->setMaxFiles($maxFiles);
        $u->setMaxFileSize(Helper::convertFileSize($maxFileSize,false));
        $u->setOverwrite(false);
        $u->setDestinationPath($temporaryDirectory);
        $u->setValidExtensions($validExtensions);

        // execute upload and check for errors
        $files = $u->execute();

        if($u->getErrors()) {
            if(user()->isSuperuser()) {
                foreach($u->getErrors() as $error) {
                    $errorMessage .= "Error: $error<br>";
                }
            } else {
                $errorMessage = sprintf($this->t['errorUpload'],$maxFiles, $maxFileSize, implode(',',$validExtensions));
            }

            (new FlashMessage(['redirectTo' => $this->opt['redirectTo']]))->error($errorMessage);
        }

        return $files;
    }

    /**
     * Save the message data as a new page
     *
     * @param string $email The sender's email address
     * @param string $messsage The message content
     * @param array|null $files The uploaded files
     * @param string $temporaryDirectory The path to the uploaded files
     * @return void
     */
    public function saveMessage($email, $messsage, $files, $temporaryDirectory) {

        try {
            // create the new page to add the images
            $p = new Page();
            $p->parent = pages()->get("template={$this->opt['parentTemplate']}");
            $p->template = $this->opt['storedTemplate'];
            $p->title = "{$email} - " . date('Y-m-d H:i:s');
            $p->txt = $this->ip;
            $p->email = $email;
            $p->body = $messsage;

            // Initialize status
            $status = 0;
            // set status hidden
            if ($this->opt['savedPageAsHidden'] == true) {
                $status |= Page::statusHidden;
            }
            // set status unpublished
            if ($this->opt['savedPageAsUnpublished'] == true) {
                $status |= Page::statusUnpublished;
            }
            // Apply the status
            $p->status = $status;

            // save page
            $p->save();

            // save files
            if(!empty($files) && is_array($files)) {
                // add images upload
                foreach($files as $filename) {
                    // if multiple fields
                    if(is_array($filename)) {
                        foreach ($filename as $item) {
                            $p->files->add($temporaryDirectory . $item);
                        }
                    } else {
                        $p->files->add($temporaryDirectory . $filename);
                    }
                }
                // save page
                $p->save();
            }

        } catch (WireException $e) {
            // An error occurred while creating the page
            $message = $this->t['errorSave'] . ': ' . $e->getMessage();
            // save error log
            wire()->log->error($message);
            // Show error
            if(user()->isSuperuser()) {
                return "<h1>$message</h1>";
            }
        }
    }

    /**
     * Check if an email or IP address is blacklisted.
     * @param string $email Email address to check.
     * @param string $ip IP address to check.
     * @param array $blacklist Blacklist containing email addresses and IP addresses.
     * @return bool True if email or IP is blacklisted, false otherwise.
     */
    public function isBlacklisted($email = '', $ip = '', $blacklist = array()) {
        if(!is_array($blacklist)) return false;

        // set default blacklist
        $defaults = [
            // 'test@gmail.com',
            // '192.168.0.1',
        ];

        // merge defaults with provided blacklist
        $blacklist = array_merge($defaults, $blacklist);

        // check if email or IP is in the blacklist
        $isEmailBlacklisted = in_array($email, $blacklist);
        $isIpBlacklisted = in_array($ip, $blacklist);

        return $isEmailBlacklisted || $isIpBlacklisted;
    }

}