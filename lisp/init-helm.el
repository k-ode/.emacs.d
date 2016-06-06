(use-package helm                       ; Powerful minibuffer input framework
  :ensure t
  :bind  (
          ;; Replace built-in commands with more powerful Helm variants
          ([remap find-file] . helm-find-files)
          ([remap switch-to-buffer] . helm-mini)
          ([remap execute-extended-command] . helm-M-x)
          ([remap yank-pop]        . helm-show-kill-ring)
          ([remap insert-register] . helm-register)
          ([remap apropos-command] . helm-apropos)
          ([remap occur] . helm-occur)
          ("C-c f r" . helm-recentf)
          ("C-x f" . helm-recentf))
  :init (progn (helm-mode 1)
          (with-eval-after-load 'helm-config
            (warn "`helm-config' loaded! Get rid of it ASAP!")))
  :config
  (setq helm-split-window-in-side-p t
        ;; Ignore case
        helm-case-fold-search t
        ;; Fuzzy matching
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-imenu-fuzzy-match t
        ;; Use recentf to manage file name history
        helm-ff-file-name-history-use-recentf t)
  :diminish helm-mode)

(use-package helm-css-scss
  :ensure t
  :defer t
  :config
  (progn
    (setq helm-css-scss-split-direction 'split-window-vertically)))

(use-package helm-imenu                 ; Helm frontend for imenu
  :ensure helm
  :bind (("C-c j a" . helm-imenu-in-all-buffers)
         ("C-c j t" . helm-imenu)
         ("C-x i" . helm-imenu))
  :config (setq helm-imenu-fuzzy-match t
                ;; Don't automatically jump to candidate if only one match,
                ;; because it makes the behaviour of this command unpredictable,
                ;; and prevents me from getting an overview over the buffer if
                ;; point is on a matching symbol.
                helm-imenu-execute-action-at-once-if-one nil))

(use-package helm-ring                  ; Helm commands for rings
  :ensure helm
  :bind (([remap yank-pop]        . helm-show-kill-ring)
         ([remap insert-register] . helm-register)))

(use-package helm-swoop                 ; Powerful buffer search for Emacs
  :ensure t
  :after helm
  :bind (("C-c s s" . helm-swoop)
         ("C-c s S" . helm-multi-swoop)
         ("C-c s C-s" . helm-multi-swoop-all))
  :config
  (setq helm-swoop-speed-or-color t     ; Colour over speed 8)
        ;; Split window like Helm does
        helm-swoop-split-window-function #'helm-default-display-buffer))

(provide 'init-helm)
