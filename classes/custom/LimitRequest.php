<?php namespace ProcessWire;

/**
 * LimitRequest class
 * // Usage example
 *```php
 	$page = wire('page');
	$limitRequest = new LimitRequest($page, $limitPerMinutes = 60, $blockedTime = 60, $customPrefix = null);
	$limitRequest->checkRequestLimit();
 * ```
 * A class used to limit the number of requests per minute for a given user.
 */
class LimitRequest {

    private $prefix;
    private $limit;
    private $blockedTime;
    private $currentTime;
    private $session;
    private $log;
    private $page;
    private $sanitizer;
    private $redirectURL;

    /**
     * Constructor of the LimitRequest class
     *
     * @param Page $page - ProcessWire page object where the limit should be applied.
     * @param int $limit - Limit of requests per minute (default 50). Specifies the maximum number of requests a user can make in one minute.
     * @param int $blockedTime - Block time in minutes (default 60). Specifies how long a user will be blocked after exceeding the limit.
     * @param string|null $customPrefix - Custom prefix for session keys (default null). Used to distinguish different forms or sections on the page.
     */
    public function __construct(Page $page, $limit = 50, $blockedTime = 60, $customPrefix = null) {
        $this->session = wire('session');
        $this->log = wire('log');
        $this->page = $page;
        $this->sanitizer = wire('sanitizer');
        $this->currentTime = time();
        $this->prefix = $customPrefix ? "_$customPrefix" : "_{$page->template}";
        $this->limit = $limit;
        $this->blockedTime = $blockedTime;
        $this->redirectURL = "/many_request";

        if (!$this->session->get('request_times' . $this->prefix)) {
            $this->session->set('request_times' . $this->prefix, []);
        }
    }

    /**
     * Checks if the number of requests exceeds the limit and reacts accordingly.
     * If the limit is exceeded, the user will be blocked for a specified time.
     */
    public function checkRequestLimit() {
        $blockedUntil = $this->session->get('block_until' . $this->prefix);
        if ($blockedUntil && $blockedUntil > $this->currentTime) {
            $remainingTime = ceil(($blockedUntil - $this->currentTime) / 60);
            $this->session->redirect($this->redirectURL."?reminingTime=$remainingTime");
        }

        $requestTimes = $this->session->get('request_times' . $this->prefix);
        $requestTimes[] = $this->currentTime;
        $requestTimes = array_filter($requestTimes, fn($time) => $time > $this->currentTime - 60);
        $this->session->set('request_times' . $this->prefix, $requestTimes);

        if (count($requestTimes) > $this->limit) {
            $this->blockUser();
        }
    }

    /**
     * Blocks the user, logs the event, and redirects to a page with information about the block.
     */
    private function blockUser() {
        $blockUntil = $this->currentTime + ($this->blockedTime * 60);
        $this->session->set('block_until' . $this->prefix, $blockUntil);
        $remainingTime = ceil(($blockUntil - $this->currentTime) / 60);
        $ip = $this->session->getIP();
        $ipLogName = $this->sanitizer->snakeCase($ip);
        $logName = "limitRequest_{$this->prefix}_{$ipLogName}";
        $logContent = "Limit request: IP $ip / Page {$this->page->title} / Template {$this->page->template->name}";
        $this->log->save($logName, $logContent);
        $this->session->redirect($this->redirectURL."?reminingTime=$remainingTime");
    }
}
