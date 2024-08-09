<?php namespace ProcessWire;

/**
 *
 * https://processwire.com/blog/posts/pw-3.0.173/
 */

 /** Simple named arguments
  * Below is how we could add a hook with an argument named {planet} and also how we could use it in our hook function:
 */

// wire()->addHook('/hello/{planet}', function($event) {
//     return "Hello " . $event->arguments('planet');
// });

// Since you've specifically named the argument, you can also just access it directly from $event if you prefer:

// wire()->addHook('/hello/{planet}', function($event) {
//     return "Hello " . $event->planet;
// });

// wire()->addHook('/hello/{planet}', function($event) {
//     if($event->planet === 'earth' || $event->planet === 'mars') {
//       return "Hello " . $event->planet;
//     } else {
//       return false; // return 404
//     }
// });

// One simple named argument will match at most one URL segment at a time. But it can also match a partial URL segment.
// If we only wanted to match URLs having a planet name that started with "great-",
// like "great-earth" and only return the portion after "great-" to the hook function (i.e. "earth"), then we could do so like this:

// wire()->addHook('/hello/great-{planet}', function($event) {
//     return "Hello " . $event->planet; // i.e. "Hello earth", etc.
// });

// The named argument pattern above ensures that only the URLs /hello/earth/, /hello/mars/ or /hello/jupiter/ will call our hook function.
// Since you've specifically named the argument, you can also just access it directly from $event if you prefer:

// wire()->addHook('/hello/(planet:earth|mars|jupiter)', function($event) {
//     return "Hello " . $event->planet;
// });


/** Pattern matching named arguments
 * Pattern matching named arguments will match specific values or a regular expression.
 * You can use any regular expression
*/

// wire()->addHook('/hello/(planet:earth|mars|jupiter)', function($event) {
//     return "Hello " . $event->arguments('planet');
// });


// Making short URLs of all blog posts

// wire()->addHook('/([0-9]+)', function($event) {
//     $id = $event->arguments(1);
//     $post = $event->pages->findOne("template=blog-post, id=$id");
//     if($post->viewable()) return $post;
// });

// Or maybe you want to instead redirect to the actual post:

// wire()->addHook('/([0-9]+)', function($event) {
//   $id = $event->arguments(1);
//   $post = $event->pages->findOne("template=blog-post, id=$id");
//   if($post->viewable()) $event->session->redirect($post->url);
// });


/** Handle specific URLs only when a POST request is present, or when AJAX is expected */

// if($input->is('POST')) {
//     wire()->addHook('/foo/bar/', function($e) {

//      });
//   }

//   if($config->ajax) {
//     wire()->addHook('/foo/bar/', function($e) {

//      });
//   }


/** Handling pagination */

// wire()->addHook('/foo/bar/{pageNum}', function($event) {
//     return "You are on page $event->pageNum";
// });


/** Outputting JSON data about any page when the last part of the URL is "json"
 * For instance, /about/history/json/ could be the JSON output for the /about/history/ URL.
*/

// wire()->addHook('(/.*)/json', function($event) {
//     $page = $event->pages->findOne($event->arguments(1));
//     if($page->viewable()) return [
//       'id' => $page->id,
//       'url' => $page->url,
//       'title' => $page->title,
//       'summary' => $page->summary
//     ];
//   });