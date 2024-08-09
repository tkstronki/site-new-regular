<?php namespace ProcessWire;

/**
 * Watch the site files for changes
 */

function _watchFiles(HookEvent $event) {

	$watchedDirectory = config()->paths->site;

	getFiles( $watchedDirectory );


	if( !session()->get('lastModifiedTime') ) {
		$lastModifiedTime = getFiles($watchedDirectory);
		$lastModifiedTime = session()->set('lastModifiedTime', $lastModifiedTime);
	}

	if( session()->get('lastModifiedTime') ) {
		$lastModifiedTime = session()->get('lastModifiedTime');

		if($lastModifiedTime != getFiles($watchedDirectory)) {
			session()->remove('lastModifiedTime');
			http_response_code(205);
			return '';
		}
	}

	http_response_code(200);
	return '';
}

function getFiles( $watchedDirectory ) {

	$watchedDirectory = realpath($watchedDirectory);
	// $scanDir = scandir($watchedDirectory);
	$scanDir = files()->find($watchedDirectory,['excludeDirNames' => ['vendor','cache','backups','logs','sessions','files','phosphor-icons']]);

	if(!is_array($scanDir)) return '';
	// $scanDir = array_diff($scanDir, ['.', '..','cache','backups']); // Remove empty directory
	$scanDir = array_diff($scanDir, ['.', '..']); // Remove empty directory
	$lastModifiedTime = '';
	// $files = '';
	foreach ($scanDir as $file) {
		// if( str_contains($file, 'sess_') ) continue;
		// if( str_contains($file, 'LICENSE') ) continue;
		$ext = pathinfo($file, PATHINFO_EXTENSION);

		if(!$ext) {
			$lastModifiedTime .= getFiles($file);
		} else {
			$lastModifiedTime .= filemtime($file);
		}
	}

	return $lastModifiedTime;
}