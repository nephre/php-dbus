PHP-DBus bindings
=================
The author of this extension is [Derick Rethans](http://derickrethans.nl/).

I've just created this unofficial repository, moving it from [PECL](http://pecl.php.net/rest/r/dbus/) to github, because I've stubmled into some problems installing it as a PEAR and SVN type composer dependency.

This is version 0.1.1, as package.xml from PEAR states.

Installation
-----------
Below installation instructions are usable only, if you're installing it as a pure PHP extension.

```bash
phpize
configure
make
sudo make install
```

TODO
----
* If this package name is added as `require` or `require-dev` section in composer.json, it will be downloaded and placed in vendor-dir. I need to prepare install scripts.

Notes
-----
My other [project](../../../skypebot) contains some [stub class](../../../skypebot/blob/master/src/Skypebot/Dbus.php) for code completion (if you use PhpStorm, NetBeans, or whatever supports `@method` annotation).

Please have in mind, that it's in rather slow development, and I'm not familiar with C language enough to debug extension and write all the docs at once.
