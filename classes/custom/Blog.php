<?php namespace ProcessWire;

/**
 * Class for blog post
 */
class Blog {

    public function __construct(
        public array $t = [],
    ) {
        $this->t = [
            'readMore' => (new Translations)->render('readMore'),
            'nextParts' => (new Translations)->render('nextParts'),
            'lastMod' => (new Translations)->render('lastMod'),
            'published' => (new Translations)->render('published'),
            'by' => (new Translations)->render('by'),
            'lastPost' => (new Translations)->render('strLastPost'),
            'share' => (new Translations)->render('strShare'),
            'entryNotFound' => (new Translations)->render('strEntryNotFound')
        ];

    }

    /**
     * Return content for a blog post.
     *
     * This function generates content for a blog post based on the provided item and options.
     *
     * @param Page $item - The Page representing the blog post.
     * @param array $opt - Options to modify the default behavior of blog post rendering:
     *
     * @return string - The HTML markup for the blog post content.
     */
    public function post($item) {

        /** @var HelperOembed $embera */
        $embera = modules()->get('HelperOembed');

        // check item
        $single = page()->template == 'blog-post' ? true : false;

        $img = Html::img($item->images->first,[
            'description' => $item->title,
            'class' => 'responsive outline',
            'lozad' => true,
            'width' => 640,
            'height' => 420,
            'fitCover' => true,
        ]);
        $title = $single ? Html::h3($item->title) : Html::h3($item->title);
        $metaSingle = $this->meta($item);
        $metaMulti = html::small(sprintf($this->t['by'], $item->createdUser->txt ?: $item->createdUser->name) . ' / ' . wireDate('Y-m-d | g:i', $item->modified));
        $categories = $item->categories->each(function($child) {
            return "<li> - <a href='$child->url'>$child->title</a></li>";
        });
        $categories = Html::ul('<li>#</li> '. $categories, ['class' => 'list-none categories']);

        $bodySingle = Html::div($embera->embed($item->body,['filters' => true]), ['class' => 'body']);
        $bodyMulti = Html::p(sanitizer()->truncate($item->body, ['maxLength' => 250]),['class' => 'body']);

        $nextParts = $item->hasChildren() ? Html::listLinks($item->children(), ['heading' => Html::h3('&#10095; ' . $this->t['nextParts'])]) : '';
        $share = component('_sharerJs',['item' => $item, 'hideTitle' => true]);

        $metaTitle =  $item->if('seo.txt', Html::h1("{seo.txt}",['class' => 'title']));
        $metaDescription = $item->if('seo.txtarea', Html::h2("{seo.txtarea}"));


        // link to single post
        $link = Html::a($item->url, $this->t['readMore'], [
            'class' => 'read-more btn ',
            'title' => $this->t['readMore'],
            'hx-boost' => setting('hxBoost') ? 'true' : 'false',
        ]);
        $link = Html::p($link);

        // set content
        $contentSingle =
        <<<HTML
            <article id='post_{$item->id}' class='contentSingle item-{$item->id}'>
                <div class='_topt-area'>
                    <div class='post-hero'>
                        {$metaTitle}
                        {$metaDescription}
                    </div>
                </div>
                <div class='_content-area'>
                    {$metaSingle}
                    <p class='thumb' x-intersect="animate(\$el, 'fade-slide-down')">
                        {$img}
                    </p>
                    {$share}
                    {$categories}
                    {$bodySingle}
                    {$nextParts}
                </div>
            </article>
        HTML;

        $contentMulti =
        <<<HTML
            <article id='post_{$item->id}' class='contentMulti item-{$item->id}'>
                <div class='_top-area'>
                    <p class='thumb' x-intersect="animate(\$el, 'fade-slide-down')">
                        {$img}
                    </p>
                </div>
                <div class='_content-area'>
                    {$title}
                    {$metaMulti}
                    {$bodyMulti}
                    {$categories}
                    {$share}
                    {$link}
                </div>
            </article>
        HTML;

    // Set stylesheet
        $css = <<<CSS
            /* all */
            ul.categories {
                display: flex;
                flex-wrap: wrap;
                align-items: center;
                margin: 0;
            }

            /* single */
            .template-blog-post {
                .breadcrumbs .actual-page {
                    font-size: var(--fs-3xl);
                }
                .post-hero {
                    word-break: break-word;
                    hyphens: auto;
                }
            }
            .contentSingle {
                .thumb {
                    margin: var(--sp-4xl) 0;
                    display: flex;
                    justify-content: center;
                    gap: var(--sp-xl);
                    img {
                        max-width: var(--mw-sm);
                        object-fit: cover;
                    }
                }
                .body {
                    &::first-letter {
                        font-size: 1.2lh;
                    }
                }
            }

            /* multi */
            .contentMulti {
                margin: auto;
                margin-bottom: var(--sp-xl);
                display: flex;
                flex-direction: column;
                align-items: center;
                max-width: var(--mw-md);
                .thumb {
                    max-width:  var(--mw-3xs);
                }
            }
        CSS;

        // Set css region
        region(basename(__CLASS__), Html::styleTag($css));

        // return content
        if(!$single) {
            return $contentMulti;
        }

        // return content
        return $contentSingle;
    }


    /**
     * Generate meta information for a post.
     *
     * This function generates meta information for a post based on the provided item and options.
     *
     * @param Page $item - The Page representing the post.
     * @param array $opt - Options to modify the default behavior of meta information rendering:
     *   - 'closedComments' (bool): Whether comments are closed.
     *
     * @return string - The HTML markup for the meta information section.
     */
    public function meta($item, $opt = array()) {

        // Set default attributes
        $default = [
            'closedComments' => false
        ];
        // Merge options with default attributes
        $opt = array_merge($default, $opt);

        // Get published date
        $datePublished = wireDate('Y-m-d | g:i', $item->published);
        $iso8601Published = gmdate("c", $item->published);

        // Get modification date
        $dateModified = ($item->modified > $item->published) ? wireDate('Y-m-d | g:i', $item->modified) : '';
        $iso8601Modified = ($dateModified) ? gmdate("c", $item->modified) : '';

        $strLastModified = $this->t['lastMod'];
        $strPublished = $this->t['published'];
        // set modification date time tag for meta
        $dateModified = $dateModified ? "<br><time datetime='$iso8601Modified' itemprop='dateModified'>{$strLastModified}: $dateModified</time>" : '';
        // User slug
        $createdUserText = sprintf($this->t['by'], $item->createdUser->txt ?: $item->createdUser->name);
        // Comments
        $commentsMeta = (new Comments)->meta($item, $item->comments, [
            'closedComments' => $opt['closedComments'],
            'commentsCount' => $item->comments->count()
        ]);

        // return content
        return <<<HTML
            <small class='_meta {$item}__meta'>
                <time datetime="{$iso8601Published}" itemprop="datePublished">
                    {$strPublished}: {$datePublished}
                </time>
                <span>{$createdUserText}</span>
                {$dateModified}
                <br>{$commentsMeta}
            </small>
        HTML;
    }

}
