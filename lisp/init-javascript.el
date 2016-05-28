(add-to-list 'auto-mode-alist '("\\.jshintrc$" . js-mode))
(add-hook 'js-mode-hook #'subword-mode)

(use-package json-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.json$" . json-mode)))

(use-package js2-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
    (add-hook 'js2-mode-hook #'subword-mode)

    (eval-after-load "js2-mode"
      '(defadvice js2-mode (after js2-rename-modeline activate)
         (setq mode-name "JS2")))
    
    (after-load 'js2-mode
      ;; Indendt case labels on extra level
      (setq-default js2-indent-switch-body t)
      ;; Globals
      (setq-default js2-global-externs '("module" "require" "jQuery" "$" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "console" "JSON" "angular" "moment" "opto" "op"))
      ;; Delay in seconds before re-parsing
      (setq-default js2-idle-timer-delay 0.1)
      ;; js2-line-break sets + at the end
      (setq-default js2-concat-multiline-strings 'eol)

      ;; Let flycheck handle parse errors
      (setq-default js2-allow-rhino-new-expr-initializer nil)
      (setq-default js2-strict-inconsistent-return-warning nil)
      (setq-default js2-mode-show-parse-errors nil)
      (setq-default js2-mode-show-strict-warnings nil)
      (setq-default js2-strict-missing-semi-warning nil)
      (setq-default js2-strict-trailing-comma-warning nil)

      ;; steal back alt-j
      (define-key js2-mode-map (kbd "M-j") '(lambda () (interactive)
                                              (join-line -1)
                                              (indent-for-tab-command)))
      (define-key js2-mode-map (kbd "M-n") '(lambda () (interactive) (js2-line-break)))

      (js2-imenu-extras-setup)

      )))

(use-package js2-refactor
  :ensure t
  :after js2-mode
  :defer t
  :config
  (progn
    (add-hook 'js2-mode-hook #'js2-refactor-mode)
    (define-key js2-mode-map (kbd "C-S-<down>") 'js2r-move-line-down)
    (define-key js2-mode-map (kbd "C-S-<up>") 'js2r-move-line-up)
    (define-key js2-refactor-mode-map (kbd "C-k") 'js2r-kill))

  (defhydra js2-refactor-menu (:color teal
                                            :hint nil)
    "
^Function^                   ^Object/Array/String^        ^Variable^            ^Misc                             ^Wrap 
^^^^^^^^-----------------------------------------------------------------------------------------------------------------------------
_ef_: extract function       _eo_: expand object          _ev_: extract var     _wi_: wrap buffer in iife         _uw_: unwrap
_em_: extract method         _co_: contract object        _iv_: inline var      _ig_: inject global in iife       _sl_: forward slurp
_ip_: introduce parameter    _ea_: expand array           _rv_: rename var      _ag_: add to globals annotation   _ba_: forward barf
_lp_: localize parameter     _ca_: contract array         _vt_: var to this     _ti_: converts ternary to if          
_eu_: expand function        _ss_: split string           _sv_: split var       _lt_: log this
_cu_: contract function      _ao_: arguments to object    ^ ^                   _dt_: debug this
"
    ("ef" js2r-extract-function)
    ("em" js2r-extract-method)
    ("ip" js2r-introduce-parameter)
    ("lp" js2r-localize-parameter)
    ("eu" js2r-expand-function)
    ("cu" js2r-contract-function)
    ("eo" js2r-expand-object)
    ("co" js2r-contract-object)
    ("ea" js2r-expand-array)
    ("ca" js2r-contract-array)
    ("ss" js2r-split-string)
    ("ao" js2r-arguments-to-object)
    ("ev" js2r-extract-var)
    ("iv" js2r-inline-var)
    ("rv" js2r-rename-var)
    ("vt" js2r-var-to-this)
    ("sv" js2r-split-var-declaration)
    ("wi" js2r-wrap-buffer-in-iife)
    ("ig" js2r-inject-global-in-iife)
    ("ag" js2r-add-to-globals-annotation)
    ("ti" js2r-ternary-to-if)
    ("lt" js2r-log-this)
    ("dt" js2r-debug-this)
    ("uw" js2r-unwrap)
    ("sl" js2r-forward-slurp)
    ("ba" js2r-forward-barf))

  (define-key js2-refactor-mode-map (kbd "C-c r") 'js2-refactor-menu/body)

  
  :diminish js2-refactor-mode)

(provide 'init-javascript)
