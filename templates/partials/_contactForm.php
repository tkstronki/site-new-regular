<?php namespace ProcessWire;

/**
 * Name _contactForm
 * @var Site $site
 * @var string $formID
 *
 */

// site options
$site = new Site;

// check enable/disable contact form
if($site->disableContactForm == true) return '';

// set translations
$t = function($t) {
    return (new Translations)->render($t);
};

// set form id, email
$formID = 'formID';

// get email
$email = $site->email;

// personal data
$personalData = $site->personalDataPage;
$personalLink = (new Htmx)->getOneModal($personalData->id,'body', (new Icon)->render('arrow-square-in'),['class' => '-icon -link']);

// options for uploaded files
$acceptFileFormats = ['pdf','doc','docx','xls','xlsx','gif','jpg','jpeg','png'];
$minFiles = 1;
$maxFiles = 30;
$maxFileSize = 1.5; // 1.5MB
$minFileSize = 0.01; // 10kb
$filesInfo = sprintf($t('fileInfo'), $maxFiles, $maxFileSize, implode(", ", $acceptFileFormats));

// redirect url
$redirectURL = input()->post("fromPage_{$formID}",'int');
$redirectURL = $redirectURL ? pages()->get($redirectURL)->httpUrl : $site->contactPage->httpUrl;

// set form inputs
$inputs = [
    'name' => [
        'type' => 'text',
        'label' => $t('name'),
        'attr' => page()->template != 'contact' ? ['autofocus' => ''] : null
    ],
    'email' => [
        'type' => 'email',
        'label' => $t('email'),
    ],
    'message' => [
        'type' => 'textarea',
        'label' => $t('message'),
    ],
    // 'files' => [
    //     'type' => 'file',
    //     'label' => $t('files') . Html::p($filesInfo,['style' => 'font-size: var(--fs-xs)']),
    //     'multiple' => true,
    //     'accept' => $acceptFileFormats,
    //     // 'hideIf' => isset($_GET['name']) && $_GET['name'] == 'allo'
    // ],
    'personalData' => [
        'type' => 'checkbox',
        'label' => $t('personalDataAccept') . " $personalLink",
    ],
];

// Process the Form
$process = new ProcessForm($formID, $email, $inputs,[
    'validExtensions' => $acceptFileFormats,
    'maxFiles' => $maxFiles,
    'maxFileSize' => $maxFileSize,
    'redirectTo' => $redirectURL,
]);
$process->init();

echo (new Form($formID, $email,[
    'method' => 'post',
    'multipart' => true,
    'action' => Helper::partialURL('_contactForm'), // get partial url
    // 'class' => 'outline'
]))->render($inputs);

// load validator
echo JustValidate::init($formID)
->field('name')
    ->rule('required', $t('fillName'))
    ->rule('minLength', 3, $t('toShort'))
->field('email')
    ->rule('email', $t('fillEmail'))
    ->rule('required', $t('setEmail'))
    ->rule('minLength', 3, $t('toShort'))
->field('message')
    ->rule('required', $t('fillMessage'))
    ->rule('minLength', 3, $t('toShort'))
->field('personalData')
    ->rule('required', $t('acceptPersonal'))
// ->field('files')
//     ->rule('minFilesCount', $minFiles, sprintf($t('minFiles'), $minFiles))
//     ->rule('maxFilesCount', $maxFiles, sprintf($t('maxFiles'), $maxFiles))
//     ->ruleFiles([
//         'extensions' => $acceptFileFormats,
//         'maxSize' => $maxFileSize, // 2 MB
//         'minSize' => $minFileSize,   // 10 KB (optional)
//         'errorMessage' => $t('invalid'),
//     ])
->render();
