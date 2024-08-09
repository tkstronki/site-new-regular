<?php namespace ProcessWire;

// Template file for pages using the “blog” template


// Template file for pages using the “blog” template
$items = page()->children("limit=12,sort=-published");
?>

<div id="content-body" >
    <?php
        foreach ($items as $item) {
            echo (new Blog)->post($item);
        }
        // pagination
        echo pagination($items);
    ?>
</div>