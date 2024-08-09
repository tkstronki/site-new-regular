<?php namespace ProcessWire;

/**
 * @var Site $site
 * @var string $content
 * @var Translations $t
 */

$site = new Site;
$t = new Translations;

if(page()->id != $site->homePage->id) session()->redirect($site->homePage->url, 301);

//  Favicon
if($site->favicon) {
	$favicon = "<link rel='icon' type='image/{$site->favicon->ext}' href='{$site->favicon->url}'>
	<link rel='apple-touch-icon' type='image/{$site->favicon->ext}' href='{$site->favicon->url}'>\n";
}
// Logo
if($site->logo) {
	$logo = "<img width='70' height='70' title='$site->name' src='{$site->logo->url}'>";
}

// Set protocol
$protocol = 'HTTP/1.0';
if ( $_SERVER['SERVER_PROTOCOL'] === 'HTTP/1.1' ) {
	$protocol = 'HTTP/1.1';
}
// Set status
header( $protocol . ' 503 Service Unavailable', true, 503 );
header( 'Retry-After: 3600' );
?>

<!doctype html>
<html id='html' lang='<?= $strLang ?>'>
<head id='html-head'>
	<title><?= $t->render('disabled') ?></title>
	<?= $favicon ?>
	<style>
		html, body {
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
			font-size: 16px;
		}
		main {
			.branding {
				font-size: 2em;
				display: flex;
				flex-direction: column;
				align-items: center;
			}
		}
		p {
			font-size: 1.3em;
		}
		h1 {
			font-size: 1.7em;
		}
		h2 {
			font-size: 1.9em;
		}
		h3 {
			font-size: 1.9em;
		}
	</style>
</head>
<body id='body'>
	<main id='main'>
		<a class='branding' href='#'>
			<?= $logo ?>
			<?= $site?->name ?>
		</a>
		<h3><?= $t->render('maintenance') ?></h3>
		<?php if($content) echo $content; ?>
	</main>
</body>
</html>
