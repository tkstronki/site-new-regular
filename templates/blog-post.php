<?php namespace ProcessWire;

// Template file for pages using the “blog-post” template

// Set Open Graph protocol to article
setting('ogType','article');

// fieldtype comments urs
$urlsComments = config()->urls->FieldtypeComments;

// link to the next blog post, if there is one
$nextPost = page()->next();

// set comments
$comments = new Comments;

// style for  comments
$commentStyle = $comments->style();

$blog = new Blog;
?>

<div id='hero' pw-remowe></div>

<div id='content-body'>

    <?= $blog->post(page()); ?>
    <?= pageBlocks(); // custom blocks ?>

    <?= pageLinks(page()) ?>

    <?php
        if($nextPost->id):
    ?>
		<p class='nextPost' <?= (new Htmx)->hxBoost(); ?>>
			<?= setting('strNext') . icon('caret-circle-right')?>
			<a href='<?= $nextPost->url; ?>'><?= $nextPost->title; ?></a>
		</p>
	<?php
        endif;
    ?>

    <div class='wrap-comments'>
        <?= $comments->render(page()->comments) ?>
    </div>

    <div class='wrap-form'>
        <?= $comments->form(page()) ?>
    </div>
</div>

<?php
// Set style
$style = <<<CSS
    .wrap-form, .wrap-comments {
        max-width: var(--mw-xs);
        margin: var(--sp-3xl) auto;
        h3 {
            margin: var(--sp-2xl) 0;
        }
    }
    .nextPost {
        display: flex;
        flex-wrap: wrap;
        gap: var(--sp-sm);
        justify-content: center;
        align-items: center;
    }
CSS;

$jQuery = Html::scriptSrcTag('https://code.jquery.com/jquery-3.6.3.min.js',[
    'integrity' => 'sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=',
    'crossorigin' => 'anonymous',
]);
$commentsJS = Html::scriptSrcTag("{$urlsComments}comments.min.js");

// set region
region('blogPostPage', Html::styleTag($style) . $commentStyle . $jQuery . $commentsJS);