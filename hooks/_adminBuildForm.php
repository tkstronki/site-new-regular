<?php namespace ProcessWire;

/**
 * Show recent posts on home page
 * @link https://processwire.com/talk/topic/28967-related-pages-list-in-admin-area/#comment-235457
 */

function _adminBuildForm(HookEvent $event) {
    $form = $event->return;
    $page = $event->object->getPage();

    if ($page->template != 'home') return;

    $existingField = $form->get('title');

    $out = '';
    // $out = p(__('Last blog Posts'));
    $pages = pages()->find("limit=5, template=blog-post, sort=random");
    foreach ($pages as $p) {
        $out .= "<div><a href={$p->editUrl}>{$p->title}</a></div>";
    }

    $newField = [
        'type' => 'markup',
        'label' => __('Last Posts'),
        'icon' => 'check',
        'value' => $out,
    ];

    $form->insertAfter($newField, $existingField);
}