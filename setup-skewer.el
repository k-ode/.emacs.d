(require 'skewer-mode)
(require 'skewer-repl)
(require 'skewer-html)
(require 'skewer-css)

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(defun skewer-start ()
  (interactive)
  (let ((httpd-port 8023))
    (httpd-start)
    (message "Ready to skewer the browser. Now jack in with the bookmarklet.")))

;; Need to configure this to run on windows/cygwin
;;(defun skewer-demo ()
;;  (interactive)
;;  (let ((httpd-port 8024))
;;    (run-skewer)
;;    (skewer-repl)))

;;(require 'mouse-slider-mode)

;;(add-to-list 'mouse-slider-mode-eval-funcs
;;             '(js2-mode . skewer-eval-defun))

(provide 'setup-skewer)
