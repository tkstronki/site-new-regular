<?php namespace ProcessWire;

/**
 * Site translations
 */
class Translations {

    public function __construct(
        public string $key = '',
        public array $t = []
    ) {
        // Strings to translate
        $this->t = [
            'next' => __('next'),
            'prev' => __('prev'),
            'alsoLike' => __('You may also like'),
            'edit' => __('Edit'),
            'visitMore' => __('Visit more pages'),
            'share' => __('Share this'),
            'copyright' => __('Made by %s - is simply the one :)'),
            'copyrightReserved' => __("%s. All rights reserved."),
            'latest' => __('latest on the blog'),
            'seeMore' => __('See more'),
            'backTo' => __('Back to'),

            // fonts
            'manageFonts' => __('Manage Fonts'),

            // form labels
            'formLegend' => __('Contact form'),
            'name' => __('Name'),
            'email' => __('Email'),
            'message' => __('Message'),
            'files' => __('Select Files'),
            // 'personalData' => __('Personal Data'),
            'personalDataAccept' => __('Accept Personal Data'),
            'submit' => __('Submit'),

            // color mode
            'lightTheme' => __('Light'),
            'cyberPunkTheme' => __('Cyberpunk'),
            'darkTheme' => __('Dark'),
            'selectColor' => __('Select a site color'),

            // just validate
            'fillName' => __('Fill name'),
            'fillEmail' => __('Fill property email'),
            'fillMessage' => __('Fill message'),
            'setEmail' => __('Set email address'),
            'toShort' => __('Field is too short'),
            'acceptPersonal' => __('Accept personal data'),
            'minFiles' => __('Minimum %s file/s'),
            'maxFiles' => __('Maximum %s file/s'),
            'invalid' => ('Invalid file format or size'),
            'fileInfo' => __('The maximum files is %s, max file size is %sMB and the allowed extensions are: %s'),

            // blog
            'readMore' => __('Read more'),
            'nextParts' => __('The next part of the post'),
            'lastMod' => __('Last modified'),
            'published' => __('Published'),
            'by' => __('by %s'),
            'lastPost' => __('Last post'),
            'share' => __('Share this'),
            'entryNotFound' => __('Entry not found'),

            // comment form
            'comment' => __('Comment'),
            'comments' => __('Comments'),
            'commentsList' => __('Comments List'),
            'noComments' => __('No comments'),
            'commentsClosed' => __('Comments are closed'),
            'header' => __('Posted by {cite} on {created}'),
            'successMessage' => __('Thank you, your comment has been posted.'),
            'pendingMessage' => __('Your comment has been submitted and will appear once approved by the moderator.'),
            'errorMessage' => __('Your comment was not saved due to one or more errors. Please check that you have completed all fields before submitting again.'),
            'postComment' => __('Post a comment'),
            'commentCite' => __('Your Name'),
            'commentEmail' => __('Your E-Mail'),
            'commentWebsite' => __('Website'),
            'commentStars' => __('Your Rating'),
            'starsRequired' => __('Please select a star rating'),
            'reply' => __('Reply'),

            // user zone
            'notPremissions' => __('You not have premissions to view this page'),
            'deleteTodo' => __('Delete todo'),
            'errorCreating' => __('Some problems with creating new Page'),
            'createNew' => __('Create new todo'),
            'update' => __('Update'),
            'delete' => __('Delete'),

            // search
            'search' => __('Search'),
            'searchResults' => __('Search results for: %s'),
            'noResults' => __('Sorry, no results were found.'),

            // RSS
            'latestUpdates' => __('Latest updates'),
            'mostUpdates' => __('See the latest articles that have been updated on our site'),

            // Maintenance mode
            'disabled' => __('Our site is currently disabled.'),
            'maintenance' => __('Maintenance Mode.'),

            // Hooks
            'pagePublished' => __('The page will be published in %s'),
            'pageAlreadyPublished' => __('Page is already published %s'),
        ];
    }

    public function render(string $key): string {
        return $this->t[$key] ?? '';
    }
}
