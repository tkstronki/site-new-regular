<?php namespace ProcessWire;

// Template file for “home” template used by the homepage
// ------------------------------------------------------
// The #content div in this file will replace the #content div in _main.php
// when the Markup Regions feature is enabled, as it is by default.
// You can also append to (or prepend to) the #content div, and much more.
// See the Markup Regions documentation:
// https://processwire.com/docs/front-end/output/markup-regions/

$blog = pages()->get("template=blog");
$lastPost = $blog->child();
?>

<div id="content" pw-append>

<?php // files()->include('inc/_examples'); ?>

    <h3 class='title' x-intersect="animate($el, 'slide-up')">
        <a href='<?= $blog->url ?>'>
            <?= t('latest') ?>
        </a>
    </h3>
    <?= (new Blog)->post($lastPost) ?>

</div>

<?php
// https://www.php.net/manual/en/language.types.string.php#example-48
$script = <<<'JS'
    highlightRandomWord('h1', 'random outline');
    function highlightRandomWord(querySelector, wordClass) {
        const textElement = document.querySelector(querySelector);
        if (!textElement) {
            // console.error(`Selector item not found: ${querySelector}`);
            return;
        }
        const text = textElement.innerHTML;
        const textArray = text.split(" ");
        const randomIndex = Math.floor(Math.random() * textArray.length);
        const randomWord = textArray[randomIndex];
        const spanStyle = wordClass ? ` class="${wordClass}"` : '';
        const highlightedText = `${textArray.slice(0, randomIndex).join(" ")} <span${spanStyle}>${randomWord}</span> ${textArray.slice(randomIndex + 1).join(" ")}`;
        textElement.innerHTML = highlightedText;
    }
JS;

region('homePage', Html::scriptTag($script));
