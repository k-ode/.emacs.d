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

(require-package 'discover)
(global-discover-mode 1)

(require-package 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c p" "C-c C-m" "C-c !"))
(setq guide-key/recursive-key-sequence-flag t)

(guide-key-mode 1)

;; Don't save temporary files in same directory, please
(setq temporary-file-directory "~/.emacs.d/tmp/")

(provide 'init-misc)
