<?php namespace ProcessWire;

// Template file for pages using the “basic-page” template
?>

<div id="content" pw-append>
    <?php
        if($page->hasChildren) {
            Html::ul($page->children->each("<li><a href='{url}'>{title}</a></li>"));
        }
    ?>
</div>