<?php namespace ProcessWire;

/** @var Site $site  */
$site = new Site;
?>

<div id='info-contact' pw-remove></div>

<div id="content" pw-append>

    <div class='contact-us'>
        <?= partial('_contactForm') ?>
        <div class='more'>
            <?= $site->contactInfo(); ?>
            <?= partial('_companyMap') ?>
        </div>
    </div>

</div>

<?php
$style =
<<<CSS
    @media (min-width: 64rem) {
        grid-template-columns: 5fr 6fr;
        justify-content: center;
        align-items: center;
        gap: var(--sp-5xl);
        max-width: var(--mw-lg);
        margin: auto;
    }
CSS;

if($site->disableContactForm == true) {
    $style =
    <<<CSS
        margin: auto;
        max-width: var(--mw-md);
    CSS;
}

$style =
<<<CSS
    .contact-us {
        display: grid;
        gap: var(--sp-xl);
        {$style}
        form {
            margin: var(--sp-xl) auto;
        }
        .more {
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: var(--sp-4xl);
        }
    }
CSS;

// set css region
region('contactInfo', Html::styleTag($style));