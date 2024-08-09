<?php namespace ProcessWire;

/**
 * Set the publication status when the field date on the post page changes
 */

function _publicationDate(HookEvent $event) {

    // set page object
    $page = $event->arguments(0);

    $publishedText = (new Translations)->render('pagePublished');
    $alreadyPublishedText = (new Translations)->render('pageAlreadyPublished');

    if($page->template != 'blog-post') return '';

    if($page->cbox != 1) return '';

    $publicationTime = wireDate('ts', $page->date);
    $publicationDate = wireDate('d-m-Y h:i', $page->date);

    if(!$page->hasStatus('unpublished') && $publicationTime > time()) {
        $page->setStatus('unpublished');
        $page->save();
        wire()->message(sprintf($publishedText,$publicationDate));
    }

    if($publicationTime < time()) {
        $page->cbox = 0;
        $page->save();
        wire()->message(sprintf($alreadyPublishedText,$publicationDate));
    }

}