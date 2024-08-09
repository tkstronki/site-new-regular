<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit96b896091ad2a899cbc1e227179fae75
{
    public static $prefixLengthsPsr4 = array (
        'E' => 
        array (
            'Embera\\' => 7,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Embera\\' => 
        array (
            0 => __DIR__ . '/..' . '/mpratt/embera/src/Embera',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit96b896091ad2a899cbc1e227179fae75::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit96b896091ad2a899cbc1e227179fae75::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit96b896091ad2a899cbc1e227179fae75::$classMap;

        }, null, ClassLoader::class);
    }
}