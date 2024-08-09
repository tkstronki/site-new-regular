<?php namespace ProcessWire;

/**
 * comments stuff
 * @param array $t Comments tramslations
 */
class Comments {

    public function __construct(
        public string $formID = 'CommentForm',
        public string $commentListID = 'CommentList',
        public array $t = [], // translates
    ) {
        // translations
        $this->t = [
            // comment form
            'comment' => (new Translations)->render('comment'),
            'comments' => (new Translations)->render('comments'),
            'commentsList' => (new Translations)->render('commentsList'),
            'noComments' => (new Translations)->render('noComments'),
            'commentsClosed' => (new Translations)->render('commentsClosed'),
            'header' => (new Translations)->render('header'),
            'successMessage' => (new Translations)->render('successMessage'),
            'pendingMessage' => (new Translations)->render('pendingMessage'),
            'errorMessage' => (new Translations)->render('errorMessage'),
            'postComment' => (new Translations)->render('postComment'),
            'commentCite' => (new Translations)->render('commentCite'),
            'commentEmail' => (new Translations)->render('commentEmail'),
            'commentWebsite' => (new Translations)->render('commentWebsite'),
            'commentStars' => (new Translations)->render('commentStars'),
            'starsRequired' => (new Translations)->render('starsRequired'),
            'reply' => (new Translations)->render('reply'),
            'submit' => (new Translations)->render('submit'),
        ];
    }

    /**
     * render comments
     * @param CommentArray $comments - The comment array to render.
     */
    public function render($comments, $closed = null) {

        if(!$comments->count()){
            return '';
        }

        if((new Site)->disableComments == true) return '';

        if(!is_bool($closed)) {
            $closed = page()->cbox_1 ? true : false;
        }

        if($closed == true) {
            echo Html::h3($this->t['commentsClosed']);
        }

        // comments list with all options specified (these are the defaults)
        $commentList =  $comments->render(array(
            'commentHeader' => $this->t['header'],
            'dateFormat' => 'm/d/y g:ia',
            'encoding' => 'UTF-8',
            'headline' => Html::h3($this->t['commentsList'], ['class' => 'headline']),
            'admin' => false, // shows unapproved comments if true
        ));

        return Html::div($commentList, ['id'=> $this->commentListID]);
    }

    /**
     * render comment form
     * @param Page $page
     */
    public function form($page = '', $closed = null) {

        if(!$page->id) return '';

        if(!is_bool($closed)) {
            $closed = (new Site)->disableComments;
        }

        if($closed == true || $page->cbox_1 == 1) return '';

        $header = Html::h3($this->t['postComment']);

         // comments form with all options specified (these are the defaults)
        $commentForm = $page->comments->renderForm(array(
            'successMessage' => Html::p($this->t['successMessage'], ['class' => 'success']),
            'errorMessage' => Html::p($this->t['errorMessage'], ['class' => 'error margin-y-sm']),
            'pendingMessage' => Html::p($this->t['pendingMessage'], ['class' => 'pending margin-y-sm']),
            'processInput' => true,
            'encoding' => 'UTF-8',
            'attrs' => array(
                'id' => $this->formID,
                'action' => './',
                'method' => 'post',
                'class' => 'outline',
                'rows' => 5,
                'cols' => 50,
                ),
                'labels' => array(
                    'cite' => $this->t['commentCite'],    // Your Name
                    'email' => $this->t['commentEmail'],  // Your E-Mail
                    'website' => $this->t['commentWebsite'],// Website
                    'stars' => $this->t['commentStars'],  // Your Rating
                    'text' => $this->t['comment'],    // Comments
                    'submit' => $this->t['submit'], // Submit
                    'starsRequired' => $this->t['starsRequired'], // Please select a star rating
                ),
                'classes' => array(
                    'form' => 'formClass',
                    'wrapper' => '', // when specified, wrapper inside <form>...</form>
                    'label' => 'form-label',
                    'labelSpan' => '',
                    'cite' => 'CommentFormCite {id}_cite',
                    'citeInput' => 'required form-control',
                    'email' => 'CommentFormEmail {id}_email',
                    'emailInput' => 'required email form-control',
                    'text' => 'CommentFormText {id}_text',
                    'textInput' => 'required form-control',
                    'website' => 'CommentFormWebsite {id}_website',
                    'websiteInput' => 'website form-control',
                    'stars' => 'CommentFormStars {id}_stars',
                    'starsRequired' => 'CommentFormStarsRequired',
                    'honeypot' => 'CommentFormHP {id}_hp',
                    'notify' => 'CommentFormNotify',
                    'radioLabel' => '',
                    'radioInput' => '',
                    'submitButton' => 'CommentFormSubmit {id}_submit btn'
                ),
            // the name of a field that must be set (and have any non-blank value), typically set in Javascript to keep out spammers
            // to use it, YOU must set this with a <input hidden> field from your own javascript, somewhere in the form
            'requireSecurityField' => '', // not used by default
            ));

            return $header . $commentForm;
    }

    /**
     * Generate and return meta information for article comments.
     *
     * This function generates and returns meta information related to article comments. It takes a Page object,
     * a CommentArray object representing the comments, and an optional array of configuration options.
     *
     * @param Page $item - The Page object representing the article.
     * @param CommentArray $comments - The CommentArray containing the comments for the article.
     * @param mixed|null $opt - Optional configuration options for customizing the output (default: empty array).
     * @return string - The generated HTML content containing comments meta information.
     */
    public function meta($item, $comments, $opt = array()) {

        // set default link id
        $linkId = '#' . $this->commentListID;

        // Basic options
        $default = [
            'closedComments' => $item->cbox_1,
            'commentsCount' => 0
        ];

        // Merge configuration options with default options
        $opt = array_merge($default, $opt);

        // If comments are disabled, return empty string
        if ((new Site)->disableComments == true) {
            return '';
        }

        // If there are no comments, return an empty string
        if (!$comments) {
            return '';
        }

        // Define the default comment text and closed comments text
        $commentText = $this->t['noComments'];
        $closedText = $this->t['commentsClosed'] . " ( $opt[commentsCount] )";

        // If comments count is greater than zero, set the appropriate comment text
        if ($opt['commentsCount']) {
            $commentText = $opt['commentsCount'] . ' ' . _n($this->t['comment'], $this->t['comments'], $opt['commentsCount']);
        }

        // If comments are closed, display closed comments text
        $commentText = $opt['closedComments'] == 1 ? "<small>$closedText</small>" : $commentText;

        // set link id
        if( $opt['commentsCount'] == 0) {
            $linkId = '#'.$this->formID;
        }
        // set comment link
        $commentLink = $item->template == 'blog-post' ? $linkId : "{$item->url}{$linkId}";

        // return the comments meta information
        return <<<HTML
            <span class='comments'>
                <a class='link' href='{$commentLink}'>{$commentText}</a>
            </span>
        HTML;
    }

    /**
     * Styles for comments
     */
    public function style() {

        $style = <<<CSS
            .CommentList {
                margin: var(--sp-4xl) 0;

                .CommentGravatar {
                    max-width: 60px;
                }
                .CommentListItem {
                    margin: 0;
                    margin-bottom: var(--sp-md);
                    padding: var(--sp-md);
                    max-width: var(--width-sm);
                    background: var(--color-teal);
                    color: var(--color-white);
                    .CommentHeader {
                        color: var(--color-black)
                    }
                    .CommentActionReply {
                        color: var(--color-accent);
                        &:hover {
                            color: var(--color-white);
                        }
                    }

                    .CommentListReplies {
                        border-top: var(--sp-5xs) solid;
                    }
                }
            }

            .CommentForm_new {
                .CommentForm {
                    display: grid;
                    flex-direction: column;
                    p {
                        margin: 0;
                        &:label {
                            display: block;
                        }
                        &:textarea {
                            max-width: 100%;
                        }
                    }

                    .CommentFormSubmit {}

                    @media (min-width: 64rem) {
                        max-width: var(--width-md);
                    }
                }

                .success {
                    background: var(--color-success);
                    color: var(--color-white);
                    padding: var(--sp-md);
                }
                .pending {
                    background: var(--color-warning);
                    color: var(--color-white);
                    padding: var(--sp-md);
                }
                .error {
                    background: var(--color-error);
                    color: var(--color-white);
                    padding: var(--sp-md);
                }
            }
        CSS;

        return Html::styleTag($style);

    }

}
