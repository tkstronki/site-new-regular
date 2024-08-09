<?php namespace ProcessWire;


/**
 * Session messages
 */
class FlashMessage {


    private $sessionSuccess = '_successMessage';
    private $sessionError = '_errorMessage';
    private $logSuccess = '_logSuccess';

    /**
     * @param array $t Translation strings
     */
    public function __construct(
        public array $opt = [], // options
        public array $t = [], // translations
    ) {
        $this->opt = [
            'alertSuccesClass' => 'alert -success',
            'alertErrorClass' => 'alert -error',
            'redirectTo' => '',
        ];

        // translate
        $this->t = [
            'notValid' => __('File is not a valid SVG / %s'),
            'notExist' => __('The icon path does not exist / %s'),
        ];

        // set main options
        $this->opt = array_merge($this->opt, $opt);
        $this->t = array_merge($this->t, $t);
    }

    /**
     * Get session message
     * @return string The session message if any
     */
    public function render() {

        $icon = new Icon;

        $button = <<<HTML
            <button class='-icon' x-on:click="\$root.remove()" x-on:click.outside="\$root.remove()">
                {$icon->render('x')}
            </button>
        HTML;

        // get session mesages
        $success = session()->get($this->sessionSuccess);
        $error = session()->get($this->sessionError);

        // get class names
        $succesClass = $this->opt['alertSuccesClass'];
        $errorClass = $this->opt['alertErrorClass'];

        // set empty message
        $message = '';

        if($success) {
            $message = Html::p($success . $button,['class' => $succesClass]);
        }

        if($error) {
            $message = Html::p($error . $button,['class' => $errorClass]);
        }

        if(!$message) return '';

        return
            <<<HTML
                <div
                    x-data=''
                    class='flash-message'
                >
                    {$message}

                    <style>
                        .flash-message {
                            position: fixed;
                            top: 0;
                            margin: auto;
                            p {
                                display: flex;
                                justify-content: center;
                                align-items: center;

                                .-icon {
                                    color: var(--color-white);
                                }
                            }
                        }
                    </style>
                </div>
            HTML;

        // return Html::div($message,['class' => 'flash-message']);
    }

    /**
     * set session && redirect
     *
     * @param null|string $content
     * @param string $to / redirect to page
     * @param string $type
     * @param array $opt
     */
    public function sessionRedirect($content = '', $to = './', $type = '', $opt = array()) {

        if(!$content) return 'Set Flash message content';

        if($this->opt['redirectTo']) {
            $to = $this->opt['redirectTo'];
        }

        $default = [
            'log' => false
        ];
        $opt = array_merge($default, $opt);

        if($opt['log'] == true && $type == $this->sessionSuccess) {
            wire()->log->message($content);
        }

        if($opt['log'] == true && $type == $this->sessionError) {
            wire()->log->error($content);
        }

        session()->set($type, $content);
        session()->redirect($to);
    }

    /**
     * Set success sesssion
     *  @param string $to - Redirect to page
     * @param null|string $content
     */
    public function success($content = '', $to = './', $opt = array()) {
        return $this->sessionRedirect($content, $to, $this->sessionSuccess, $opt);
    }

    /** Set error sesssion */
    public function error($content = '', $to = './', $opt = array()) {
        return $this->sessionRedirect($content, $to, $this->sessionError, $opt);
    }

    public function remove() {
        session()->remove($this->sessionSuccess);
        session()->remove($this->sessionError);
    }

}

