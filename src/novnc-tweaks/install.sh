#!/bin/sh
set -e

echo "The value of PROMPT is: ${PROMPT}"

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
cd -
