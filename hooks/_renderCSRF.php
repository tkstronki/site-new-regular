<?php namespace ProcessWire;

/**
 * Render csrf key
 */

function _renderCSRF(HookEvent $event) {
    if(!setting('hxRequest')) return 'no HX request';
    return setting('csrfRenderInput');
}