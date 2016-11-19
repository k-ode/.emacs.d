 ;; Opto v6

(defun kg-optov6-build ()
  (interactive)
  (compile "msbuild.exe c:/opto/Core/Code/OPTOV6Html5.sln //m //nologo //v:q"))

(defun kg-optov6-precheck ()
  (interactive)
  (compile "cd c:/opto/Core/Code/ && ./Release.WebIncludes.PreCheck.cmd"))

(defun kg-optov6-customizations-build ()
  (interactive)
  (compile "msbuild.exe c:/opto/Opto.Mods.ConrabOpto/Code/Mods.sln //m //nologo //v:q"))

(defun kg-optov6-clean-build ()
  (interactive)
  (compile "msbuild.exe c:/opto/Core/Code/OPTOV6Html5.sln //t:'Clean,Build' //m //nologo //v:q"))

(defun kg-optov6-restore-packages ()
  (interactive)
  (compile "cd c:/opto/Core/Code/ && ./nuget.exe restore"))

(defun kg-optov6-tests ()
  (interactive)
  (async-shell-command "cd c:/opto/Core/Code/ServerHtml5/Web && npm run test -- --watch" "*optov6-tests*"))

(defun kg-optov6-mobile ()
  (interactive)
  (async-shell-command "cd c:/opto/Core/Code/ServerHtml5/Web && npm run mobile" "*optov6-mobile*"))

(defun kg-optov6-iis-express ()
  (interactive)
  (async-shell-command "cd c:/home/bin/iisexpress && node index.js C:/opto/Core/Code/ServerHtml5/Web" "*optov6-iis-express*"))

(defun kg-optov6-gulp ()
  (interactive)
  (async-shell-command "cd c:/opto/Core/Code/ServerHtml5/Web && gulp" "*optov6-gulp*"))

(defun kg-optov6-run ()
  (interactive)
  (kg-optov6-gulp)
  (kg-optov6-iis-express))

;; Opto Website
(defun kg-opto-website-build ()
  (interactive)
  (compile "msbuild.exe c:/opto/ConrabInternalApplications/trunk/OptoWebsite/OptoWebsite/OptoWebsite.csproj //m //nologo //v:q"))

(defun kg-opto-website-iis-express ()
  (interactive)
  (async-shell-command "cd c:/home/bin/iisexpress && node index.js c:/opto/ConrabInternalApplications/trunk/OptoWebsite/OptoWebsite" "*opto-website-iis-express*"))

(defun kg-opto-website-gulp ()
  (interactive)
  (async-shell-command "cd c:/opto/ConrabInternalApplications/trunk/OptoWebsite/OptoWebsite/ && gulp" "*optov-website-gulp*"))

(defun kg-opto-website-run ()
  (interactive)
  (kg-opto-website-gulp)
  (kg-opto-website-iis-express))

;; Adrian Moddigård

(defun kg-adrian-start-mongodb ()
  (interactive)
  (async-shell-command "cd c:/home/bin/mongodb && mongod -dbpath C:/home/bin/mongodb" "*mongodb*"))

(provide 'project-mappings)
