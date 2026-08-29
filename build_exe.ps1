$ErrorActionPreference = "Stop"
pyinstaller main.spec
Copy-Item -Path "conf", "frida-gadget", "frida-server", "platform-tools", "rel"  -Destination "dist\main" -Recurse
