<?php namespace ProcessWire;

/**
 * Render Markup RSS
 */

function _markupRSS(HookEvent $event) {
    // retrieve the RSS module

    /** @var MarkupRSS $rss */
    $rss = modules()->get("MarkupRSS");

    // configure the feed. see the actual module file for more optional config options.

    $rss->title = (new Translations)->render('latestUpdates');

    $rss->description = (new Translations)->render('mostUpdates');

    $rss->url = pages()->get("template=blog")->httpUrl;

    // find the pages you want to appear in the feed.

    // this can be any group of pages returned by $pages->find() or $page->children(), etc.

    $items = pages()->find("template='blog-post',limit=10,status!=hidden,sort=-modified");

    // send the output of the RSS feed, and you are done

    return $rss->render($items);
}
