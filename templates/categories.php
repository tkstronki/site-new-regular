<?php namespace ProcessWire;

// Template file for pages using the “categories” template

// Get categries ( https://processwire.com/talk/topic/23466-page-references-sort-by-references/ )
$items = page()->children("limit=12")->sort('-numReferences');
?>

<div id='content' pw-append>
    <?php
        // items
        echo Html::refItems($items,[
            'heading' => ' ',
            'listClass' => 'categories list-none',
            'linkClass' => 'btn -md',
        ]);
        // pagination
        echo pagination($items);
    ?>
</div>

<?php
region('categoriesPage', Html::styleTag(
    <<<CSS
        .categories {
            display: flex;
            flex-wrap: wrap;
            gap: var(--sp-xs);
        }
    CSS
));