<?php namespace ProcessWire;

/**
 * Alpine.js helpers
 */
class Alpine {

    public static function lightbox($label, $content, $el = 'button', $attr ='') {
        $class = strtolower(basename(__CLASS__) . '_'. basename(__FUNCTION__));
        $attr = $attr ? ' ' . $attr : '';
        $iconX = (new Icon)->render('x');
        $openedClass = 'lightbox-open';
        $zx = time();
        $content =
        <<<HTML
            <div x-data="{ open: false }">
                <{$el}{$attr} @click="open = true; document.body.classList.add('$openedClass')">$label</{$el}>
                <div class='{$class} overlay dn' x-show="open" x-transition>
                    <div class='{$class}-content'
                        @click.outside="document.body.classList.remove('$openedClass'); open = false;"
                    >
                        <button class='close -icon'
                            @click="document.body.classList.remove('$openedClass'); open = false;"
                        >$iconX</button>
                        $content
                    </div>
                </div>
            </div>
            HTML;

            $css = <<<CSS
            body.lightbox-open {
                overflow: hidden;
            }
            .lightbox-open .{$class} {
                background: color-mix(in srgb, var(--bg-color), transparent 8%);
                display: grid;
                justify-items: center;
                align-items: center;
                gap: var(--sp-xs);
                padding: var(--sp-4xl) var(--sp-md);
                box-sizing: border-box;
                overflow: auto;
                z-index: {$zx};
                .close {
                    position: relative;
                }
            }
            .{$class}-content {
                display: grid;
                justify-items: center;
                align-items: center;
                gap: var(--sp-2xl);
                max-width: var(--mw-lg);

                img {
                    max-width: var(--mw-md);
                }
            }
            CSS;

            // region css
            region($class, Html::styleTag($css));
            // return item
            return $content;
    }

}

