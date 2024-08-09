<?php namespace ProcessWire;

/**
 * Seo class for managing SEO meta tags
 *
 * This class handles the generation of SEO meta tags, including Open Graph tags,
 * canonical links, and other essential meta tags for better search engine optimization
 * and social media sharing.
 */
class Seo {

    /**
     * Constructor for the Seo class
     *
     * Initializes the SEO properties from settings and page input.
     *
     * @param ?Pageimage $img - The image to be used for Open Graph tags, is an null.
     * @param bool $noindexFollow - Whether to add noindex, follow meta tag, default is false.
     * @param string $siteName - The name of the site, default is an empty string.
     * @param string $ogLocale - The locale for Open Graph tags, default is an empty string.
     * @param string $title - The title of the page, default is an empty string.
     * @param string $description - The description of the page, default is an empty string.
     * @param string $pageUrl - The URL of the page, default is an empty string.
     * @param string $ogType - The Open Graph type, default is 'website'.
     * @param string $logo - The URL of the logo image, default is an empty string.
     */
    public function __construct(
        public bool $noindexFollow = false,
        public string $siteName = '',
        public string $ogLocale = '',
        public string $title = '',
        public string $description = '',
        public string $pageUrl = '',
        public string $ogType = 'website',
        public ?PageImage $img = null,
        public string $logo = ''
    ) {
        $this->noindexFollow = setting('noindexFollow') || input()->pageNum > 1 ? true : '';
        $this->siteName = setting('siteName') ?? $siteName;
        $this->ogLocale = (new Site)->ogLocale ?? $ogLocale;
        $this->title = page()->seo?->txt ?: page()->title;
        $this->description = page()->seo?->txtarea ?: $description;
        $this->pageUrl = page()->httpUrl ?: '';
        $this->ogType = setting('ogType') ?? $ogType;
        $this->img = page()?->images?->count ? page()->images->first : $this->img;
        $this->logo = (new Site)->logo?->url ?: $logo;
    }

    /**
     * Generate SEO meta tags for a page.
     *
     * This function generates SEO meta tags, including Open Graph tags, canonical link,
     * and other essential meta tags for better search engine optimization and social media sharing.
     *
     * @param Page $item - The Page object for which to generate SEO meta tags.
     * @link https://css-tricks.com/essential-meta-tags-social-media/
     * @link https://processwire.com/blog/posts/processwire-2.6.18-updates-pagination-and-seo/
     * @link https://weekly.pw/issue/222/
     * @return string - The HTML markup containing SEO meta tags.
     */
    public function render($item): string {

        if(!$item instanceof Page) return '';
        if (!$item->hasField('seo')) return '';

        $ogTags = '';
        $datePublished = date('c', $item->published);
        $dateModified = date('c', $item->modified);
        $space = "\t\t";

        $bTags = "<link rel='canonical' href='{$this->pageUrl}'>\n";
        $bTags .= config()->pagerHeadTags ? "\t" . config()->pagerHeadTags . "\n" : '';
        $bTags .= $this->noindexFollow ? "\t" . Html::meta('robots', 'noindex,follow') . "\n" : null;
        $bTags .= $space . Html::title($this->title) . "\n";
        $bTags .= $this->description ? "\t" . Html::meta('description', $this->description) . "\n" : null;

        $og = [
            'og:site_name' => $this->siteName,
            'og:locale' => $this->ogLocale,
            'og:title' => $this->title,
            'og:description' => $this->description,
            'og:url' => $this->pageUrl,
            'og:type' => $this->ogType,
        ];

        if ($og['og:type'] == 'article') {
            $og['article:published_time'] = $datePublished;
            $og['article:modified_time'] = $dateModified;
            $og['article:updated_time'] = $dateModified;
        }

        if ($this->img) {
            $img = $this->img;
            $imgDescription = $img->description ?: $this->title;
            $og['og:image'] = $img->httpUrl;
            $og['og:image:type'] = "image/{$img->ext}";
            $og['og:image:width'] = $img->width;
            $og['og:image:height'] = $img->height;
            $og['og:image:alt'] = $imgDescription;
            $ogTags .= $space . Html::meta('twitter:card', 'summary_large_image') . "\n";
            $ogTags .= $space . Html::meta('twitter:image:alt', $imgDescription) . "\n";
        }

        $og = array_filter($og);

        foreach ($og as $key => $value) {
            $ogTags .= $space . Html::meta($key, $value, ['property' => true]) . "\n";
        }

        $structuredData = $this->generateStructuredData($item);

        return "\n{$space}{$bTags}{$ogTags}\n{$structuredData}";
    }

    /**
     * Generate structured data (schema.org) for a page.
     *
     * This function generates structured data for the page to enhance search engine understanding
     * and support rich snippets in search results.
     *
     * @param Page $item - The Page object for which to generate structured data.
     * @return string - The JSON-LD structured data script.
     */
    private function generateStructuredData(Page $item): string {
        $structuredData = [
            "@context" => "https://schema.org",
            "@type" => $this->ogType === 'article' ? "Article" : "WebPage",
            "url" => $this->pageUrl,
            "name" => $this->title,
            "description" => $this->description,
            "inLanguage" => $this->ogLocale,
            "image" => $this->img ? $this->img->httpUrl : null,
            "datePublished" => date('c', $item->published),
            "dateModified" => date('c', $item->modified),
        ];

        if ($this->ogType == 'article') {
            $structuredData["articleSection"] = 'Blog';
            $structuredData["author"] = $item->createdUser->txt_1 ?? $item->createdUser->name;
            $structuredData["publisher"] = [
                "@type" => "Organization",
                "name" => $this->siteName,
                "logo" => [
                    "@type" => "ImageObject",
                    "url" => $this->logo,
                ]
            ];
        }

        $structuredData = array_filter($structuredData);

        return '<script type="application/ld+json">' . json_encode($structuredData, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE) . '</script>';
    }
}
