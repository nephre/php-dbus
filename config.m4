dnl
dnl $ Id: dbus 1.0.1$
dnl

PHP_ARG_ENABLE(dbus, whether to enable dbus functions,
[  --enable-dbus[=DIR]       Enable dbus support], yes)

if test -z "$PHP_LIBXML_DIR"; then
  PHP_ARG_WITH(libxml-dir, libxml2 install dir,
  [  --with-libxml-dir=DIR     DBUS: libxml2 install prefix], no, no)
fi


if test "$PHP_DBUS" != "no"; then
  if test "$PHP_LIBXML" = "no"; then   
    AC_MSG_ERROR([DBUS extension requires LIBXML extension, add --enable-libxml])                
  fi

  AC_MSG_CHECKING(for pkg-config)
  if test ! -f "$PKG_CONFIG"; then
    PKG_CONFIG=`which pkg-config`
  fi
  if test -f "$PKG_CONFIG"; then
    AC_MSG_RESULT(found)

    AC_MSG_CHECKING(for dbus)
    if $PKG_CONFIG --exists dbus-1; then
      AC_MSG_RESULT(found)
      LDFLAGS="$LDFLAGS `$PKG_CONFIG --libs dbus-1`"
      CFLAGS="$CFLAGS `$PKG_CONFIG --cflags dbus-1`"
	  PHP_SETUP_LIBXML(DBUS_SHARED_LIBADD, [
        AC_DEFINE(HAVE_DBUS, 1, [whether dbus exists in the system])
        PHP_NEW_EXTENSION(dbus, dbus.c introspect.c, $ext_shared)
		PHP_EVAL_LIBLINE($LDFLAGS,DBUS_SHARED_LIBADD)
		PHP_SUBST(DBUS_SHARED_LIBADD)
	  ], [
		AC_MSG_ERROR([xml2-config not found. Please check your libxml2 installation.])
	  ])
    else
      AC_MSG_RESULT(not found)
      AC_MSG_ERROR(The DBUS-1 package was not detected on your system)
    fi
  else
    AC_MSG_RESULT(not found)
    AC_MSG_ERROR(pkg-config is not found)
  fi
fi
