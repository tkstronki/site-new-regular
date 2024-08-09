<?php namespace ProcessWire;

/**
 * Debug site elements
 */
class InfoDebug {


    public function render() {

        if(config()->debug == false) return '';

        // set region
        region(basename(__CLASS__), Html::styleTag($this->style()) . Html::scriptTag($this->script()));

        return <<<HTML
            <!-- Modal Alert -->
            <div id="alertModal" class="alert-modal" style="display:none;">
                <div class="alert-content">
                    <button id="copyIdButton" style="display:none;">Copy ID</button>
                    <button id="copyClassButton" style="display:none;">Copy Class</button>
                    <button id="closeAlertButton">Close</button>
                </div>
            </div>
        HTML;
    }

    /**
     * set style
     */
    public function style() {

        // CSS
        return <<<CSS
            /* Tooltip */
            .tooltip {
                position: fixed;
                background-color: var(--color-black);
                color: var(--color-white);
                text-align: center;
                padding: 5px;
                border-radius: 5px;
                z-index: 2200 !important;
                visibility: hidden;
                white-space: nowrap;
                pointer-events: none;
                transform: translate(-50%, 170%);
                transition: transform 0.2s ease-in-out;
            }

            /* Border styling */
            .highlight {
                outline: 2px solid blue;
            }

            /* Modal background */
            .alert-modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 2100 !important;
            }

            /* Modal content */
            .alert-content {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: var(--bg-color);
                color: var(--color-white);
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                z-index: 2100 !important;
            }

            /* Close button */
            #closeAlertButton {
                margin-top: 10px;
            }

            /* Z index for cookie consent */
            #cc-main {
                z-index: 1199;
            }
            CSS;
    }

    /**
     * set script
     */
    public function script() {
            return <<<'JS'
                document.addEventListener('DOMContentLoaded', () => {
                const tooltip = document.createElement('div');
                tooltip.classList.add('tooltip');
                document.body.appendChild(tooltip);

                const alertModal = document.getElementById('alertModal');
                const closeAlertButton = document.getElementById('closeAlertButton');
                const copyIdButton = document.getElementById('copyIdButton');
                const copyClassButton = document.getElementById('copyClassButton');
                let currentElement = null;
                let isAlertActive = false;

                // Function to show modal
                function showModal(id, className) {
                    // Hide tooltip
                    tooltip.style.visibility = 'hidden';

                    // Disable tooltip functionality
                    isAlertActive = true;
                    tooltip.style.pointerEvents = 'none';

                    // Show modal
                    alertModal.style.display = 'block';

                    // Hide buttons if no ID or class
                    copyIdButton.style.display = id ? 'inline-block' : 'none';
                    copyClassButton.style.display = className ? 'inline-block' : 'none';

                    // Handle button clicks
                    copyIdButton.onclick = () => {
                        if (id) {
                            copyToClipboard(`#${id}`);
                            closeModal(); // Close modal after copying
                        }
                    };

                    copyClassButton.onclick = () => {
                        if (className) {
                            copyToClipboard(convertClassNameToCSS(className));
                            closeModal(); // Close modal after copying
                        }
                    };
                }

                // Function to copy to clipboard
                function copyToClipboard(text) {
                    if (navigator.clipboard && navigator.clipboard.writeText) {
                        navigator.clipboard.writeText(text).catch(err => {
                            console.error('Error copying text: ', err);
                        });
                    } else {
                        // Fallback for older browsers
                        const textarea = document.createElement('textarea');
                        textarea.value = text;
                        document.body.appendChild(textarea);
                        textarea.select();
                        document.execCommand('copy');
                        document.body.removeChild(textarea);
                    }
                }

                // Function to convert class names to CSS format
                function convertClassNameToCSS(className) {
                    return className.split(' ')
                        .filter(cls => cls !== 'highlight')
                        .map(cls => `.${cls}`)
                        .join(' ');
                }

                // Handle background clicks to close modal
                alertModal.onclick = (event) => {
                    if (event.target === alertModal) {
                        closeModal();
                    }
                };

                // Handle close button click
                closeAlertButton.onclick = () => {
                    closeModal();
                };

                // Function to close modal
                function closeModal() {
                    alertModal.style.display = 'none';
                    isAlertActive = false;
                    tooltip.style.pointerEvents = 'auto'; // Restore tooltip functionality
                }

                // Function to handle tooltip position
                function handleTooltipPosition(event) {
                    if (isAlertActive) return; // Don't update tooltip if alert is active

                    // Ensure tooltip can leverage the high z-index
                    tooltip.style.zIndex = 999;

                    const padding = 10;
                    let tooltipX = event.clientX + padding;
                    let tooltipY = event.clientY + padding;
                    const tooltipRect = tooltip.getBoundingClientRect();
                    const viewportWidth = window.innerWidth;
                    const viewportHeight = window.innerHeight;

                    // Check for overflow on the right edge
                    if (tooltipX + tooltipRect.width > viewportWidth) {
                        tooltipX = viewportWidth - tooltipRect.width - padding;
                    }

                    // Check for overflow on the left edge
                    if (tooltipX < padding) {
                        tooltipX = padding;
                    }

                    // Check for overflow on the bottom edge
                    if (tooltipY + tooltipRect.height > viewportHeight) {
                        tooltipY = viewportHeight - tooltipRect.height - padding;
                    }

                    // Check for overflow on the top edge
                    if (tooltipY < padding) {
                        tooltipY = padding;
                    }

                    // Apply the calculated positions
                    tooltip.style.top = tooltipY + 'px';
                    tooltip.style.left = tooltipX + 'px';

                    // Adjust the transform based on tooltip position
                    let offsetX = (tooltipX < viewportWidth / 2) ? 0 : -50;
                    let offsetY = (tooltipY < viewportHeight / 2) ? 0 : -150;

                    tooltip.style.transform = `translate(${offsetX}%, ${offsetY}%)`;
                }

                // Display tooltip and handle double-click to show modal
                document.addEventListener('mouseover', (event) => {
                    if (isAlertActive) return; // Don't show tooltip if alert is active

                    const target = event.target.closest('[id], [class]');
                    if (target && target !== currentElement) {
                        if (currentElement) {
                            currentElement.classList.remove('highlight');
                        }
                        currentElement = target;
                        let descriptionText = '';
                        const id = target.id ? `ID: #${target.id}` : '';
                        const className = target.className ? `Class: ${target.className}` : '';

                        descriptionText = [id, className].filter(Boolean).join(', ');

                        if (descriptionText) {
                            tooltip.textContent = descriptionText;
                            tooltip.style.visibility = 'visible';
                            target.classList.add('highlight');
                        }
                    }
                });

                // Handle double-click to show modal
                document.addEventListener('dblclick', (event) => {
                    if (isAlertActive) return;

                    const target = event.target.closest('[id], [class]');
                    if (target) {
                        showModal(target.id, target.className);
                    }
                });

                document.addEventListener('mousemove', handleTooltipPosition);

                document.addEventListener('mouseout', () => {
                    if (currentElement) {
                        currentElement.classList.remove('highlight');
                        currentElement = null;
                    }
                    tooltip.style.visibility = 'hidden';
                });
            });
        JS;
    }
}