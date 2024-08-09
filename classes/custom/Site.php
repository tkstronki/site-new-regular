<?php namespace ProcessWire;

/**
 * class for manage site settings
 */
class Site {

    private const personalDataPageID = '1051';

    public function __construct(
        public ?Page $homePage = null,
        public ?Page $contactPage = null,
        public ?Page $personalDataPage = null,
        public ?FieldsetPage $contactInfo = null,
        public ?FieldsetPage $opt = null,
        public ?PageArray $moreOptions = null,

        public string $name = '',
        public string $tagline = '',
        public string $email = '',
        public string $phone = '',
        public string $address = '',
        public string $map = '',
        public string $copyright = '',
        public string $gvCode = '',
        public string $gaCode = '',
        public string $url = '',
        public string $httpUrl = '',
        public string $hostUrl = '',
        public string $lang = '',
        public string $ogLocale = '',

        public ?PageImage $logo = null,
        public ?PageImage $favicon = null,

        public ?PageArray $socialProfiles = null,
        public ?PageArray $internalLinks = null,
        public ?PageArray $friendlyLinks = null,

        public bool $isHome = false,
        public bool $hasLanguageSupport = false,
        public string $csrfInput = '',
        public bool $csrfValid = false,

        public ?bool $hxRequest = null,
        public ?bool $hxBoosted = null,
        public ?bool $hxPushUrl = null,

        public bool $disableComments = false,
        public bool $disableContactForm = false,


    ) {
        $this->homePage = pages()->get('/');
        $this->contactPage = pages()->get("template=contact");
        $this->personalDataPage = pages()->get(self::personalDataPageID);
        $this->opt = $this->homePage->opt;
        $this->contactInfo = $this->opt->contactInfo;
        $this->moreOptions = $this->opt->moreOptions;

        $this->name = $this->opt->txt;
        $this->tagline = $this->opt->txtarea;
        $this->email = $this->contactInfo->email;
        $this->phone = $this->contactInfo->txt;
        $this->address = $this->contactInfo->txt_1;
        $this->map = $this->contactInfo->txtarea;
        $this->copyright = $this->moreOptions->get("name=copyright_info")->txt ?? '';
        $this->gvCode = $this->moreOptions->get("name=gv_code")->txt ?? '';
        $this->gaCode = $this->moreOptions->get("name=ga_code")->txt ?? '';
        $this->url = $this->homePage->url;
        $this->httpUrl = $this->homePage->httpUrl;
        $this->hostUrl = input()->httpHostUrl();
        $this->lang = $this->getLang('langCode');
        $this->ogLocale = $this->getLang('ogCode');

        $this->logo = $this->opt->images->getTag('logo');
        $this->favicon = $this->opt->images->getTag('favicon');

        $this->socialProfiles = $this->opt->socialProfiles;
        $this->internalLinks = $this->opt->internalLinks;
        $this->friendlyLinks = $this->opt->friendlyLinks;

        $this->isHome = wire()->page->id == 1 ? true : false;
        $this->hasLanguageSupport = page()->getLanguages() && modules()->isInstalled("LanguageSupportPageNames");
        $this->csrfInput = session()->CSRF->renderInput();
        $this->csrfValid = session()->CSRF->hasValidToken();

        $this->hxRequest = array_key_exists('HTTP_HX_REQUEST', $_SERVER);
        $this->hxBoosted = array_key_exists('HTTP_HX_BOOSTED', $_SERVER);
        $this->hxPushUrl = array_key_exists('HTTP_HX_PUSH_URL', $_SERVER);

        $this->disableComments =  $this->moreOptions->get("name=d_c") ? true : false;
        $this->disableContactForm =  $this->moreOptions->get("name=d_cf") ? true : false;
    }

    public function socialProfiles() {
        $itemsSocial = '';
        $socialProf = $this->socialProfiles;
        if($socialProf->count) {
            $socialProfLabel = $this->opt->getField('socialProfiles')->label;
            foreach ($socialProf as $item) {
                $icon = (new Icon)->render($item->name.'-logo');
                if($item->URL) {
                    $itemsSocial .= Html::li(Html::a($item->URL, $icon . ' - ' . $item->title, [
                        'class' => "social-{$item->name}",
                        'blank' => true
                    ]));
                }
            }
            $itemsSocial = Html::ul($itemsSocial);
        }
        return Html::div(Html::h3($socialProfLabel,['class' => 'title','x-intersect' => "animate(\$el, 'fade-slide-left')"]) . $itemsSocial, ['class' => __FUNCTION__]);
    }

    public function internalLinks() {
        $itemsRef = '';
        $internalLinks = $this->opt->internalLinks;
        if($internalLinks->count) {
            $internalLinksLabel = $this->opt->getField('internalLinks')->label;
            foreach ($internalLinks as $item) {
                $itemsRef .= Html::li(Html::a($item->url, $item->title, ['class' => "page-{$item->name}"]));
            }
            $itemsRef = Html::ul($itemsRef);
        }
        return Html::div(Html::h3($internalLinksLabel,['class' => 'title','x-intersect' => "animate(\$el, 'fade-slide-down')"]) . $itemsRef, ['class' => __FUNCTION__]);
    }


    public function friendlyLinks() {
        $itemsLink = '';
        $friendlyLinks = $this->opt->friendlyLinks;
        if($friendlyLinks->count) {
            $friendlyLinksLabel = $this->opt->getField('friendlyLinks')->label;
            foreach ($friendlyLinks as $item) {
                $itemsLink .= Html::li(Html::a($item->URL, $item->txt,[
                    'class' => "item-{$item->name}",
                    'blank' => $item->cbox ? true : null
                ]));
            }
            $itemsLink = Html::ul($itemsLink,['class' => 'internal']);
        }
        return Html::div(Html::h3($friendlyLinksLabel,['class' => 'title','x-intersect' => "animate(\$el, 'fade-slide-up')"]) . $itemsLink, ['class' => __FUNCTION__]);
    }


    public function map() {
        return 'Render Map';
    }


    /**
     * return contact info
     */
    public function contactInfo() {
        $pageID = page()->id;
        $class = __FUNCTION__;
        $cinfoLabel = $this->opt->getField('contactInfo')->label;
        $list = Html::li($this->contactInfo->getField('email')->label . ': ' . $this->email);
        $list .= Html::li($this->contactInfo->getField('txt')->label . ': ' . $this->phone);
        $list .= Html::li($this->contactInfo->getField('txt_1')->label . ': ' . $this->address);
        $list = $list;
        // $map = $this->contactInfo->getField('txtarea')->label . ': ' . $this->map;
        $map = (new Htmx)->getPartialModal('_companyMap', (new Icon)->render('map-pin') ,[
            'class' => 'btn -small',
            'title' => $this->contactInfo->getField('txtarea')->label
        ],['requestVariable' => 'lozad=false']);

        $contact = (new Htmx)->getPartialModal('_contactForm', (new Icon)->render('envelope') ,[
            'class' => 'btn -small',
            'title' => $this->contactInfo->getField('txtarea')->label
        ],['requestVariable' => "pageID=$pageID"]);

        if((new Site)->disableContactForm == true) {
            $contact = '';
        }

        if(wire()->page->id == $this->contactPage->id) {
            $map = $contact = '';
        }

        return
        <<<HTML
            <div class='{$class}'>
                <h3 class='title' x-intersect="animate(\$el, 'fade-slide-left')">$cinfoLabel</h3>
                <ul>$list</ul>
                <div>
                    $map
                    $contact
                </div>
            </div>
        HTML;
    }

    /**
     * get lang code
     */
    public function getLang($part) {

        $text = $this->opt->txt_1;

        // Break up text into an array using a comma
        $parts = explode(',', $text);

        // Remove whitespace from each element of the array
        $parts = array_map('trim', $parts);

        // Extract the first part (before the comma)
        $langCode = $parts[0] ?? null;

        // Extract the second part (decimal point)
        $opCode = $parts[1] ?? null;

        // If opCode does not exist, set it to langCode in uppercase format
        if ($opCode === null && $langCode !== null) {
            $opCode = $langCode .'_'. strtoupper($langCode);
        }

        // Use match to return the appropriate part
        return match ($part) {
            'langCode' => $langCode,
            'ogCode' => $opCode,
            default => null, // or you can throw an exception depending on your needs
        };
    }

}
