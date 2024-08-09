# ProcessWire Site Profile

This repository contains a custom site profile for the [ProcessWire CMS](https://processwire.com/). It includes a variety of components, modules, and utilities that streamline the development process and enhance the functionality of your ProcessWire installation.

## Features

- **HelperOembed Integration**: Easily embed multimedia content from various providers like YouTube using the `HelperOembed` module.
- **Dynamic Component and Partial Generation**: Automatically generate and manage components and partials within the site, simplifying content management.
- **Htmx Integration**: Load content dynamically with Htmx, including modals, components, and partials, with support for custom triggers and filters.
- **Alpine.js**: Use Alpine.js for interactive and reactive UI elements, like lightboxes, directly within the CMS.
- **Custom Site Class**: A `Site` class is provided to manage essential site information, internal links, social profiles, and more.
- **Icon Management**: Easily manage and render SVG icons using the `Icon` class, with support for [Phosphor Icons](https://phosphoricons.com/).

## Installation

1. Download or clone this repository into the `site` directory of your ProcessWire installation.
2. Run `composer install` to install the necessary dependencies.
3. Update the site configuration as needed.

## Usage

### Embedding Content with HelperOembed

The `HelperOembed` module allows you to embed multimedia content directly into your templates.

```php
/** @var HelperOembed $embera */
$embera = modules()->get('HelperOembed');

echo $embera->embed('<h1>The BEST WAY to Combine Arrays in PHP</h1>
https://youtube.com/shorts/RabnpQnelNQ?si=DWdFKiBi-rAAebME
<h1>ProcessWire Love Story @ PHP Meetup Vienna 2023</h1>
https://youtu.be/ncS36UqaBvc?si=I-aFjEZrM6sf_G4X');

// With custom filters (load via htmx)
echo $embera->embed('https://youtube.com/shorts/RabnpQnelNQ?si=DWdFKiBi-rAAebME
https://youtu.be/ncS36UqaBvc?si=I-aFjEZrM6sf_G4X', ['filters' => true]);
```

### Dynamic Components and Partials

To auto-generate components and partials, simply uncomment the relevant code and refresh the page:

```php
// Components
echo component('_myFirstComponent');
echo component('myfolder/_mayLastComponent');

// Partials
echo partial('_myFirstPartial');
echo partial('myfolder/_mayLastPartial');
```

These will be generated in the respective `components` or `partials` directories if `$config->debug == true`.

### Htmx Usage

Use the `Htmx` class to dynamically load content with support for modals and components:

```php
/** @var Htmx $htmx */
$htmx = new Htmx;

echo $htmx->getPartial("_helloWorld","Load the Hello World Partial from the file partials/_helloWorld.php.<br>",
[
    'class' => 'btn -primary',
    'hx-swap' => 'afterend',
    'hx-trigger' => 'click once'
]) . '<br>';

echo $htmx->getComponent("_helloWorld", "Load the Hello World Component...");

echo $htmx->getOneModal(1022, 'body', 'Click me to get field body from Contact Page');
```

### Site Class

The `Site` class provides a centralized way to access important site information and configuration, usually retrieves data from the home page `opt` field:

```php
$site = new Site();

// Retrieve the title of important pages
echo $site->homePage->title . '<br>';          // Outputs the title of the home page
echo $site->contactPage->title . '<br>';       // Outputs the title of the contact page
echo $site->personalDataPage->title . '<br>';  // Outputs the title of the personal data page

// Access basic site information
echo $site->name . '<br>';               // Outputs the site name
echo $site->tagline . '<br>';            // Outputs the site tagline
echo $site->email . '<br>';              // Outputs the site's contact email
echo $site->phone . '<br>';              // Outputs the site's contact phone number
echo $site->address . '<br>';            // Outputs the site's physical address
echo sanitizer()->unentities($site->map) . '<br>'; // Outputs the site's map (sanitized)
echo $site->logo?->url . '<br>';         // Outputs the URL of the site's logo
echo $site->favicon?->url . '<br>';      // Outputs the URL of the site's favicon
echo $site->gaCode . '<br>';             // Outputs the Google Analytics tracking code
echo $site->gvCode . '<br>';             // Outputs the Google Verification code
echo $site->copyright . '<br>';          // Outputs the site's copyright information
echo $site->url . '<br>';                // Outputs the full URL of the site
echo $site->httpUrl . '<br>';            // Outputs the HTTP URL of the site
echo $site->hostUrl . '<br>';            // Outputs the host URL of the site
echo $site->lang . '<br>';               // Outputs the site's language code
echo $site->ogLocale . '<br>';           // Outputs the Open Graph locale
echo $site->csrfInput . '<br>';          // Outputs the CSRF protection input field

// Loop through social profiles and display them as links
foreach ($site->socialProfiles as $item) {
    echo Html::a($item->URL, $item->title, ['targetBlank' => true]) . '<br>';
}

// Loop through internal links and display them as links
foreach ($site->internalLinks as $item) {
    echo Html::a($item->url, $item->title) . '<br>';
}

// Loop through friendly links (external) and display them as links
foreach ($site->friendlyLinks as $item) {
    echo Html::a($item->URL, $item->txt) . '<br>';
}

// All Links in One Go
// If you need to display all types of links at once, the Site class provides methods to output them:
echo $site->contactInfo();       // Outputs contact information links
echo $site->socialProfiles();    // Outputs all social profile links
echo $site->internalLinks();     // Outputs all internal links
echo $site->friendlyLinks();     // Outputs all friendly (external) links

// Language and Security
// The Site class includes properties and methods for checking language support and security measures like CSRF protection.
bd($site->hasLanguageSupport); // bool: true if multiple languages are supported
bd($site->csrfValid);          // bool: true if the CSRF token is valid

// Htmx Integration
// You can also check if the current request is an Htmx request and whether it has specific Htmx properties.
bd($site->hxRequest);  // bool: true if the request is an Htmx request
bd($site->hxBoosted);  // bool: true if the Htmx request is boosted
bd($site->hxPushUrl);  // bool: true if the Htmx request should push a new URL

// Other Site Checks
// Finally, the Site class includes various other utility checks:
bd($site->isHome);              // bool: true if the current page is the home page
bd($site->disableComments);     // bool: true if comments are disabled
bd($site->disableContactForm);  // bool: true if the contact form is disabled
```

### Icon Management

Render SVG icons with ease using the `Icon` class:

```php
echo (new Icon)->render('star');
echo (new Icon)->render('star',['size' => '3xl']);
```

Icons are sourced from [Phosphor Icons](https://phosphoricons.com/).

## Assets

`customAssets()`
In main.php, the `customAssets()` function is responsible for managing the inclusion of external CSS, JavaScript, and other asset files. It typically pulls these assets from CDNs or other external sources, ensuring that your web page incorporates third-party resources as needed. This function allows you to dynamically load and manage assets that are not hosted on your own server, which can help in optimizing loading times and leveraging the performance benefits of external CDNs.

`siteAssets()`
In main.php, the `siteAssets()` function handles the inclusion of internal CSS, JavaScript, and other assets specific to your site. It ensures that all required resources are correctly loaded and optimizes the performance and functionality of your site.

## Rendering Regions

The `renderRegions()` function in `main.php` is responsible for managing and outputting different regions defined using the ProcessWire `region()` function. This includes handling various components, partials, and ensuring that the associated CSS and JavaScript files are loaded efficiently.

The `renderRegions()` function collects and renders the content defined for each region, optimizing the inclusion of styles and scripts based on the specific requirements of the regions.

Example Usage
In a template like `home.php`, you can define a region as follows:

```php
<?php 
    region('homeCSS', "<style>body { background: red; }</style>");
?>
```

# Template Helper Functions

This repository includes several helper functions to streamline the rendering of components and partials in your ProcessWire templates. These functions ensure that your code remains clean, modular, and easy to maintain.

## Rendering Components

### `component($name, $componentOptions = [], $opt = [])`

The `component()` function is used to render a reusable component within your template. Components encapsulate specific functionality or layout sections that you may want to use across different parts of your site.

- **$name**: The name of the component to be rendered.
- **$componentOptions**: An associative array of options to modify the behavior of the component. Some key options include:
  - **baseName**: The base name for the component, typically derived from the function name. This option is crucial as it forms the basis for other component names and paths.
  - **componentFolderName**: The name of the folder containing the component.
  - **filePath**: The file path of the component.
  - **name**: The name of the component.
  - **itemClassName**: CSS class name for the component.
  - **id**: The ID attribute for the component.
  - **class**: Additional CSS classes for the component.
  - **content**: The content of the component.
  - **generate**: Whether to auto-generate the component if it does not exist.
  - **showID**: Show the component only if this ID is not equal to the current page ID.
  - **hideID**: Hide the component if this ID is equal to the current page ID.
  - **cspNonce**: Content-Security-Policy nonce, retrieved from the session.
  - **hxBoost**: HTMX boost attribute.
- **$opt**: Render options, similar to those used in `WireFileTools::render()`.

The `componentOptions` array can be used to pass custom variables to the component's view, allowing you to dynamically change the content or behavior of the component based on your needs. The default variable `content` is especially important as it allows you to define the primary content of the component, which can be further extended with additional content as needed.

**Example Usage:**

```php
// load component
echo component('_myFirstComponent', [
    'content' => 'Main content here',
    'additionalVar' => 'Custom value'
]);

// this will generate component ( only if config->debug  == true ) inside => components/_myFirstComponent.php
<?php namespace ProcessWire;

/**
* Name _myFirstComponent
* @var string $id
* @var string $type
* @var string $name
* @var string $class
* @var string $itemClassName
* @var string $content
* @var string $filePath
* @var string $hxBoost
*/

// content
echo <<<HTML
<div id='{$id}' class='{$class}'>

    <h3>{$type} {$name}</h3>

    {$content}

    <p>{$type} path -> <code>{$filePath}</code></p>
    <p>{$type} id -> <code>{$id}</code></p>
    <p>{$type} CSS Class Name -> <code>{$itemClassName}</code></p>
    <p>Load {$type} CSS / JS -> <code>echo region('$itemClassName');</code></p>

    <!-- You must add the additional variable ($additionalVar) to the component yourself -->
    <blockquote>{$additionalVar}</blockquote>
</div>
HTML;

// CSS
$style = <<<CSS
    .{$itemClassName} {
        background: var(--color-navy);
        color: var(--color-teal);
        padding: var(--sp-md);

        p {
            color: var(--color-white);
        }

        h1,h2,h3 {
            color: var(--color-orange);
        }

        code {
            color: var(--color-purple);
        }
    }
CSS;

// JS
$script = <<<JS
    console.log('{$itemClassName}');
JS;

// set region for css js
region($itemClassName, Html::styleTag($style) . Html::scriptTag($script));
```
The component is rendered using `ProcesssWire` `files()->render()` method `files()->render($componentOptions['filePath'], $componentOptions, $opt);`, which allows you to pass variables directly to the view.

Auto-Creation in Debug Mode
If the $config->debug setting is true, components will be automatically generated if they do not already exist. When you refresh the page, a new component file will be created in the `/components/` directory with the specified name:

`component('_myFirstComponent')` will create `/components/_myFirstComponent.php`.

You can also create components within subdirectories, e.g., `component('myfolder/_myNestedComponent')` will create `/components/myfolder/_myNestedComponent.php`.

If you include a prefix like -JS or -CSS in the component name, the function will automatically create the component in the corresponding js or css subdirectory:

`component('_customScript-JS')` will create `/components/js/_customScript-JS.php`.
`component('_customStyles-CSS')` will create `/components/css/_customStyles-CSS.php`.

## Rendering Partials
`partial($name, $partialOptions = [], $opt = [])`
The `partial()` function is similar to the `component()` function but is typically used for rendering smaller, reusable parts of a template, such as headers, footers, or specific sections of a page.

**Example Usage:**
```php
echo partial('_myFirstPartial', [
    'content' => 'Primary content here',
    'additionalVar' => 'Another custom value'
]);
```

## Dependencies

- **Alpine.js**: Lightweight framework for creating interactive UIs.
- **Htmx**: A powerful tool for dynamically loading HTML into your page.
- **Lozad.js**: Lazy loading library to improve site performance.
- **Macy.js**: A lightweight library for creating grid layouts.

### Composer Dependencies

- **Embera**: A PHP library for consuming oEmbed APIs, used in the `HelperOembed` module.

### Installed Modules
[FileValidatorSvgSanitizer](https://github.com/ryancramerdesign/FileValidatorSvgSanitizer)

[LoginRegister](https://github.com/ryancramerdesign/LoginRegister)

[PageListCustomChildren](https://github.com/ryancramerdesign/PageListCustomChildren)

[TracyDebugger](https://github.com/adrianbj/TracyDebugger)

## Configuration

### `$config->liveReload`

Set `$config->liveReload = false;` to disable live reloading during development. This is useful when you want to prevent automatic page refreshes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for details.
