<?php namespace ProcessWire;

// Optional initialization file, called before rendering any template file.
// This is defined by $config->prependTemplateFile in /site/config.php.
// Use this to define shared variables, functions, classes, includes, etc.

// inportant main settings
setting([
	// Set HTML classes https://processwire.com/api/ref/functions/wire-array/
	'bodyClasses' => WireArray([
		'template-' . page()->template->name,
		'page-' . page()->id
	]),

	// SEO
	'noindexFollow' => false,
	'ogType' => 'website', // Open graph type https://ogp.me/,
]);

// include main functions
files()->include('./_func');

/**
 * Publish pages on date
 * https://processwire.com/docs/more/lazy-cron/
 */
wire()->addHook('LazyCron::every6Hours', function($e){
    $posts = $this->pages->find('template=blog-post,cbox=1,status=unpublished');
    foreach($posts as $post) {
        $publicationTime = wireDate('ts',$post->date);
        if($publicationTime <= time()) {
            $post->of(false);
            // https://processwire.com/api/ref/page/remove-status/
            $post->removeStatus('unpublished');
            $post->cbox = 0;
            $post->save();
            // set message
            wire()->log->save('published',"$post->title - $post->httpUrl");
        }
    }
});