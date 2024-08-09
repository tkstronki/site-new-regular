<?php namespace ProcessWire;

/**
 * CookieConsent
 * @link https://cookieconsent.orestbida.com/
 */
class CookieConsent {

    /**
     * Constructor for the CookieConsent class.
     *
     * @param string $lang The language of the cookie consent messages.
     * @param array $t An array of translations for the messages.
     */
    public function __construct(
        public string $lang = '',
        public array $t = array()
    ) {
        // translations
        $this->t = [
                // contact Page
                'strContact' => __('Contact us'),

                // Cookies
                'strCookieManage' => __('Manage cookie preferences'),
                'strAcceptAll' => __('Accept all'),
                'strRejectAll' => __('Reject all'),

                'strConsentModal' => [
                    'title' => __('We use cookies'),
                    'description' => __('Cookie modal description'),
                    'showPreferencesBtn' => __('Manage Individual preferences'),
                ],

                // Preferences modal
                'strPreferencesModal' => [
                    'title' => __('Manage cookie preferences'),
                    'savePreferencesBtn' => __('Accept current selection'),
                    'closeIconLabel' => __('Close modal'),
                ],

                // modal sections
                'strFirstSection' => [
                    'title' => __('Somebody said ... cookies?'),
                    'description' => __('I want one!'),
                ],

                'strNecessarySection' => [
                    'title' => __('Strictly Necessary cookies'),
                    'description' => __('These cookies are essential for the proper functioning of the website and cannot be disabled.'),
                    // 'linkedCategory' => 'necessary',
                ],

                'strPerformanceSection' => [
                    'title' => __('Performance and Analytics'),
                    'description' => __('These cookies collect information about how you use our website. All of the data is anonymized and cannot be used to identify you.'),
                    // 'linkedCategory' => 'analytics',
                ],

                'strInformationSection' => [
                    'title' => __('More information'),
                    'description' => __('For any queries in relation to my policy on cookies and your choices, please'),
                ],

            ];
    }

    // render all
    public function render() {
        return $this->config($this->lang) . $this->style();
    }

    /**
     * Render cookie button
     * @param string @lang optional
     */
    public function renderBtn() {

        $itemClassName = 'btnCookie';
        $iconCookie = ( new Icon )->render('cookie');

        // content
        if(!input()->cookie->get('cc_cookie')) return '';

        $btn = <<<HTML
            <p class='{$itemClassName}'>
                <button id='cookieBtn' class='btn -small m-sm' type="button" data-cc="show-preferencesModal">
                    {$iconCookie}
                </button>
            </p>
        HTML;

        // return button
        return $btn;
    }

    public function config() {
        // get lang
        $lang = $this->lang;

        // get strings
        $strAcceptAll = $this->t['strAcceptAll'];
        $strRejectAll = $this->t['strRejectAll'];
        $strConsentModal = $this->t['strConsentModal'];
        $strPreferencesModal = $this->t['strPreferencesModal'];
        $strFirstSection = $this->t['strFirstSection'];
        $strNecessarySection = $this->t['strNecessarySection'];
        $strPerformanceSection = $this->t['strPerformanceSection'];
        $strInformationSection = $this->t['strInformationSection'];
        $strContact = $this->t['strContact'];

        // get contact page
        $contactUs = pages()->get("template=contact");

        // get js file
        $cookieConsentJS = 'https://cdn.jsdelivr.net/gh/orestbida/cookieconsent@3.0.1/dist/cookieconsent.umd.js';
        $cookieConsentJsPath = paths()->templates . 'assets/js/cookieconsent.umd.js';
        if(files()->exists($cookieConsentJsPath)) {
            $cookieConsentJS = pages()->get('/')->httpUrl.'site/templates/assets/js/cookieconsent.umd.js';
        }

        /**
        * All config. options available here:
        * https://cookieconsent.orestbida.com/reference/configuration-reference.html
        */
        $config = <<<JS
            CookieConsent.run({
                autoShow: true,
                categories: {
                    necessary: {
                        enabled: true,  // this category is enabled by default
                        readOnly: true  // this category cannot be disabled
                    },
                    analytics: {
                        enabled: true,
                    }
                },
                language: {
                    default: '{$lang}',
                    translations: {
                        {$lang}: {
                            consentModal: {
                                title: '{$strConsentModal['title']}',
                                description: '{$strConsentModal['description']}',
                                acceptAllBtn: '{$strAcceptAll}',
                                acceptNecessaryBtn: '{$strRejectAll}',
                                showPreferencesBtn: '{$strConsentModal['showPreferencesBtn']}'
                            },
                            preferencesModal: {
                                title: '{$strPreferencesModal['title']}',
                                acceptAllBtn: '{$strAcceptAll}',
                                acceptNecessaryBtn: '{$strRejectAll}',
                                savePreferencesBtn: '{$strPreferencesModal['savePreferencesBtn']}',
                                closeIconLabel: '{$strPreferencesModal['closeIconLabel']}',
                                sections: [
                                    {
                                        title: '{$strFirstSection['title']}',
                                        description: '{$strFirstSection['description']}'
                                    },
                                    {
                                        title: '{$strNecessarySection['title']}',
                                        description: '{$strNecessarySection['description']}',

                                        //this field will generate a toggle linked to the 'necessary' category
                                        linkedCategory: 'necessary'
                                    },
                                    {
                                        title: '{$strPerformanceSection['title']}',
                                        description: '{$strPerformanceSection['description']}',
                                        linkedCategory: 'analytics'
                                    },
                                    {
                                        title: '{$strInformationSection['title']}',
                                        description: '{$strInformationSection['description']} <a href="{$contactUs->url}">{$strContact}</a>'
                                    }
                                ]
                            }
                        }
                    }
                }
            });
        JS;

        // return all
        return Html::scriptTag(
            <<<JS
                import '{$cookieConsentJS}';
                $config
            JS
        ,['type' => 'module']);
    }

    public function style() {
        $cookieConsentStyle = 'https://cdn.jsdelivr.net/gh/orestbida/cookieconsent@3.0.1/dist/cookieconsent.css';
        $cookieConsentStylePath = paths()->templates . 'assets/css/cookieconsent.css';
        if(files()->exists($cookieConsentStylePath)) {
            $cookieConsentStyle = urls()->templates . 'assets/css/cookieconsent.css';
        }
        return "<link rel='stylesheet' href='$cookieConsentStyle'>";
    }
}
