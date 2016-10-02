(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(use-package helm                       ; Powerful minibuffer input framework
  :ensure t
  :bind  (
          ;; Replace built-in commands with more powerful Helm variants
          ([remap find-file] . helm-find-files)
          ([remap switch-to-buffer] . helm-mini)
          ([remap execute-extended-command] . helm-M-x)
          ([remap apropos-command] . helm-apropos)
          ([remap occur] . helm-occur)
          ("C-c f r" . helm-recentf)
          ("C-x f" . helm-recentf))
  :init (progn (helm-mode 1)
          (with-eval-after-load 'helm-config
            (warn "`helm-config' loaded! Get rid of it ASAP!")))
  :config
  (setq
   helm-truncate-lines t
   helm-echo-input-in-header-line t
   helm-split-window-in-side-p t
   ;; Ignore case
   helm-case-fold-search t
   helm-autoresize-max-height 0
   helm-autoresize-min-height 25
   ;; Fuzzy matching
   helm-buffers-fuzzy-matching t
   helm-recentf-fuzzy-match t
   helm-imenu-fuzzy-match t
   ;; Use recentf to manage file name history
   helm-ff-file-name-history-use-recentf t)
  (add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)
  (helm-autoresize-mode 1)
  :diminish helm-mode)

(defun css-imenu-keys ()
  (local-set-key (kbd "C-x i") 'helm-css-scss)
  (local-set-key (kbd "C-x C-i") 'helm-css-scss-multi)
  (local-set-key (kbd "C-c j c") 'helm-css-scss)
  (local-set-key (kbd "C-c j m") 'helm-css-scss-multi))

(use-package helm-css-scss
  :ensure t
  :defer t
  :config
  (setq helm-css-scss-split-window-function #'helm-default-display-buffer)
  ;; Set local keybind map for css-mode / scss-mode / less-css-mode
  (add-hook 'css-mode-hook 'css-imenu-keys)
  (add-hook 'less-css-mode-hook 'css-imenu-keys)
  (add-hook 'scss-mode-hook 'css-imenu-keys))

(use-package helm-imenu                 ; Helm frontend for imenu
  :ensure helm
  :bind (("C-c j a" . helm-imenu-in-all-buffers)
         ("C-c j t" . helm-imenu)
         ("C-x i" . helm-imenu)
         ("C-x C-i" . helm-imenu-in-all-buffers))
  :config (setq helm-imenu-fuzzy-match t
                ;; Don't automatically jump to candidate if only one match,
                ;; because it makes the behaviour of this command unpredictable,
                ;; and prevents me from getting an overview over the buffer if
                ;; point is on a matching symbol.
                helm-imenu-execute-action-at-once-if-one nil))

(use-package helm-ring                  ; Helm commands for rings
  :ensure helm
  :bind (("C-x C-y" . helm-show-kill-ring)
         ([remap insert-register] . helm-register)))

(use-package helm-swoop                 ; Powerful buffer search for Emacs
  :ensure t
  :after helm
  :bind (("C-c s w" . helm-swoop)
         ("C-c s W" . helm-multi-swoop)
         ("C-c s C-w" . helm-multi-swoop-all))
  :config
  (setq helm-swoop-speed-or-color t     ; Colour over speed 8)
        ;; Split window like Helm does
        helm-swoop-split-window-function #'helm-default-display-buffer))

(use-package helm-flycheck
  :ensure t
  :after helm
  :config
  (define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

(provide 'init-helm)
