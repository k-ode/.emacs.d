(setq markdown-command "pandoc")

(prodigy-define-service
  :name "OptoWebsite Gulp"
  :command "gulp"
  :cwd "c:/opto/ConrabInternalApplications/trunk/OptoWebsite/OptoWebsite"
  :tags '(work)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "OptoV6 Webpack"
  :command "npm"
  :args '("run" "dev")
  :cwd "c:/opto/Core/Code/ServerHtml5/Web"
  :tags '(work)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Mongodb"
  :command "mongod"
  :args '("-dbpath" "C:/home/bin/mongodb")
  :cwd "C:\home\bin\mongodb"
  :tags '(work)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(setq ag-highlight-search t)

(defun comment-box-fill (b e)
  "Draw a box comment around the region but arrange for the region
to extend to at least the fill column. Place the point after the
comment box."
  (interactive "r")
  (let ((e (copy-marker e t)))
    (goto-char b)
    (end-of-line)
    (insert-char ?  (- fill-column (current-column)))
    (comment-box b e 1)
    (goto-char e)
    (set-marker e nil)))
 
(setq electric-indent-mode nil)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Answering just y or n is enough
(defalias 'yes-or-no-p 'y-or-n-p)

(setq web-mode-indent-style 4)
(define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)

(require 'wgrep)

(setq debug-on-error nil)

;; Wanna use enter as newline and indent
(defun my-coding-config ()
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "<S-return>") 'newline))

(mapc
 (lambda (language-mode-hook)
   (add-hook language-mode-hook 'my-coding-config))
 '(css-mode-hook
   emacs-lisp-mode-hook
   js2-mode-hook
   less-mode-hook
   html-mode-hook
   csharp-mode-hook))

(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              filename-and-process)))


;; I prefer to read files side by side
(setq ediff-split-window-function (quote split-window-horizontally))

(setq fill-column 80)

;; Don't save temporary files in same directory, please
(setq temporary-file-directory "~/.emacs.d/tmp/")

(provide 'init-misc)
