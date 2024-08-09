<?php namespace ProcessWire;

// load partials
function _loadPartial(HookEvent $event) {
    return Helper::loadHook($event, 'partial');
}


// load partials
function _loadComponent(HookEvent $event) {
    return Helper::loadHook($event, 'component');
}

// find one
function _findOne(HookEvent $event) {
    return Helper::loadHook($event, 'findOne');
}
