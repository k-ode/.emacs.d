@IF EXIST "%~dp0\node.exe" (
  "%~dp0\node.exe"  "%~dp0\tern" %*
) ELSE (
  node  "%~dp0\tern" %*
)