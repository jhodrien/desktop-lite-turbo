#!/bin/sh
set -e

echo "The value of PROMPT is: ${PROMPT}"
echo "The value of RESIZE is: ${RESIZE}"

cd /usr/local/novnc/noVNC-1.2.0/app
patch << EOB
--- ui.js.orig  2024-10-22 12:07:54.793037162 +0000
+++ ui.js       2024-10-22 12:07:24.257035993 +0000
@@ -106,7 +106,7 @@

         document.documentElement.classList.remove("noVNC_loading");

-        let autoconnect = WebUtil.getConfigVar('autoconnect', false);
+        let autoconnect = WebUtil.getConfigVar('autoconnect', true);
         if (autoconnect === 'true' || autoconnect == '1') {
             autoconnect = true;
             UI.connect();
EOB

patch << EOB
--- ui.js.orig	2024-10-22 12:50:44.520322126 +0000
+++ ui.js	2024-10-22 12:50:32.816322227 +0000
@@ -160,7 +160,7 @@
         UI.initSetting('port', port);
         UI.initSetting('encrypt', (window.location.protocol === "https:"));
         UI.initSetting('view_clip', false);
-        UI.initSetting('resize', 'none');
+        UI.initSetting('resize', 'remote');
         UI.initSetting('quality', 6);
         UI.initSetting('compression', 2);
         UI.initSetting('shared', true);
EOB
