;; Wanna use enter as newline and indent
(defun my-coding-config ()
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "<S-return>") 'newline)
  )

(mapc
 (lambda (language-mode-hook)
   (add-hook language-mode-hook 'my-coding-config))
 '(css-mode-hook
   emacs-lisp-mode-hook
   js2-mode-hook
   less-mode-hook
   html-mode-hook
   ))

(require 'smart-forward)

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

(require 'powerline)
(powerline-default-theme)

;; I prefer to read files side by side
(setq ediff-split-window-function (quote split-window-horizontally))

(add-to-list 'load-path "~/.emacs.d/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)

(defun my-tern-project-dir ()
  (and (not (buffer-file-name)) "")
  (let ((project-dir (file-name-directory (buffer-file-name))))
    (loop for cur = project-dir then (let ((shorter (file-name-directory (substring cur 0 (1- (length cur))))))
                                       (and (< (length shorter) (length cur)) shorter))
          while cur do
          (when (file-exists-p (expand-file-name ".tern-project" cur))
            (return (setf project-dir cur))))
    project-dir))

(defun delete-tern-port-file ()
  (interactive)
  (delete-file (expand-file-name ".tern-port" (my-tern-project-dir))))

(require 'project-explorer)

(setq fill-column 80)

(require 'projectile)
(projectile-global-mode)

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c p" "C-c r" "C-c m" "C-c !"))
(setq guide-key/recursive-key-sequence-flag t)

(guide-key-mode 1)

;; Don't save temporary files in same directory, please
(setq temporary-file-directory "~/.emacs.d/tmp/")

;; Change window quickly with S-left and S-right
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; EXTRACT THIS
(defun my-csarhp-mode-fn ()
  "function that runs when cshar-mode is initialized."
  (setq c-basic-offset 4)
  (use-local-map nil)
  (c-set-offset 'substatement-open 0))
(add-hook 'csharp-mode-hook 'my-csarhp-mode-fn t)

(provide 'my-misc)
