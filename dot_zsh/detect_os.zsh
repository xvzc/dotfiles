export CUR_OS=$(uname)

if [ "$CUR_OS" = "Darwin" ]; then
  function _is_darwin() { return 0 }
else
  function _is_darwin() { return 1 }
fi

if [ "$CUR_OS" = "Linux" ]; then
  function _is_linux() { return 0 }
else
  function _is_linux() { return 1 }
fi

