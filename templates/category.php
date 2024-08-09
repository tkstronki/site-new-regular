<?php namespace ProcessWire;

// Template file for pages using the “category” template

// Get items
$items = pages()->get("template=blog")->children("categories=$page,limit=12")->sort('-numReferences');
?>

<div id='content-body' class='category-content' pw-append>
    <?php
        // items
        foreach ($items as $item) {
            echo (new Blog)->post($item);
        }
        // pagination
        echo pagination($items);
    ?>
</div>