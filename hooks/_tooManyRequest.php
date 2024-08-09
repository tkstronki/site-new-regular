<?php namespace ProcessWire;

/**
 * Too many request
 */

function _tooManyRequest(HookEvent $event) {
    if(!setting('hxRequest')) {
        http_response_code(429);
    }
    $remainingTime = input()->get('reminingTime');
    return Html::h1(sprintf(setting('strTooManyRequest'), $remainingTime), ['class' => 'error']);
}