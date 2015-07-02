(require-package 'hydra)

(defhydra hydra-js2r (:color blue :hint nil)
  "
_ef_: (m) extract function      _wi_: wrap buffer in iife     _cu_: contract function   _uw_: unwrap     
_em_: (m) extract method        _ig_: inject global in iife   _eu_: expand function     _ea_: expand array                   
_ip_: (m) introduce parameter   _ag_: add to globals          _lt_: log this            _ti_: ternary to if
_lp_: localize-parameter        _ev_: (m) extract var         _dt_: debug this          _ca_: contract array
_eo_: expand object             _iv_: inline var              _sl_: forward slurp       _sv_: split var declaration 
_co_: contract object           _rv_: rename var              _ba_: forward barf        _ss_: split spring
_ao_: arguments to object       _vt_: var to this             _k_: kill                 
"
  ("ef" js2r-extract-function)
  ("ef" js2r-extract-function)
  ("em" js2r-extract-method)
  ("ip" js2r-introduce-parameter)
  ("lp" js2r-localize-parameter)
  ("eo" js2r-expand-object)
  ("co" js2r-contract-object)
  ("eu" js2r-expand-function)
  ("cu" js2r-contract-function)
  ("ea" js2r-expand-array)
  ("ca" js2r-contract-array)
  ("wi" js2r-wrap-buffer-in-iife)
  ("ig" js2r-inject-global-in-iife)
  ("ag" js2r-add-to-globals)
  ("ev" js2r-extract-var)
  ("iv" js2r-inline-var)
  ("rv" js2r-rename-var)
  ("vt" js2r-var-to-this)
  ("ao" js2r-arguments-to-object)
  ("ti" js2r-ternary-to-if)
  ("sv" js2r-split-var-declaration)
  ("ss" js2r-split-spring)
  ("uw" js2r-unwrap)
  ("lt" js2r-log-this)
  ("dt" js2r-debug-this)
  ("sl" js2r-forward-slurp)
  ("ba" js2r-forward-barf)
  ("k" js2r-kill)
  ("o" nil nil))
(global-set-key (kbd "C-c C-r") 'hydra-js2r/body)
(global-set-key (kbd "C-c r") 'hydra-js2r/body)

    
(defhydra hydra-rectangle (:body-pre (rectangle-mark-mode 1)
                                     :color pink
                                     :post (deactivate-mark))
  " 
  ^_k_^     _d_elete    _s_tring
_h_   _l_   _o_k        _y_ank
  ^_j_^     _n_ew-copy  _r_eset
^^^^        _e_xchange  _u_ndo
^^^^        ^ ^         _p_aste
"
  ("h" backward-char nil)
  ("l" forward-char nil)
  ("k" previous-line nil)
  ("j" next-line nil)
  ("e" exchange-point-and-mark nil)
  ("n" copy-rectangle-as-kill nil)
  ("d" delete-rectangle nil)
  ("r" (if (region-active-p)
           (deactivate-mark)
         (rectangle-mark-mode 1)) nil)
  ("y" yank-rectangle nil)
  ("u" undo nil)
  ("s" string-rectangle nil)
  ("p" kill-rectangle nil)
  ("o" nil nil))
(global-set-key (kbd "C-x SPC") 'hydra-rectangle/body)

(defhydra hydra-projectile (:color blue :hint nil)
        "
                                                                    ╭────────────┐
    Files             Search          Buffer             Do         │ Projectile │
  ╭─────────────────────────────────────────────────────────────────┴────────────╯
    [_f_] file          [_a_] ag          [_b_] switch         [_g_] magit
    [_l_] file dwim     [_A_] grep        [_v_] show all       [_p_] commander
    [_r_] recent file   [_s_] occur       [_V_] ibuffer        [_i_] info
    [_d_] dir           [_S_] replace     [_K_] kill all
    [_o_] other         [_t_] find tag
    [_u_] test file     [_T_] make tags
    [_h_] root         
  --------------------------------------------------------------------------------
        "
        ("q" nil "quit")
        ("a"   projectile-ag)
        ("A"   projectile-grep)
        ("b"   projectile-switch-to-buffer)
        ("B"   projectile-switch-to-buffer-other-window)
        ("c"   projectile-run-async-shell-command-in-root)
        ("C"   projectile-run-command-in-root)
        ("d"   projectile-find-dir)
        ("D"   projectile-find-dir-other-window)
        ("f"   projectile-find-file)
        ("F"   projectile-find-file-other-window)
        ("g"   projectile-vc)
        ("h"   projectile-dired)
        ("i"   projectile-project-info)
        ("kc"  projectile-invalidate-cache)
        ("kd"  projectile-remove-known-project)
        ("kk"  projectile-cache-current-file)
        ("K"   projectile-kill-buffers)
        ("ks"  projectile-cleanup-known-projects)
        ("l"   projectile-find-file-dwim)
        ("L"   projectile-find-file-dwim-other-window)
        ("m"   projectile-compile-project)
        ("o"   projectile-find-other-file)
        ("O"   projectile-find-other-file-other-window)
        ("p"   projectile-commander)
        ("r"   projectile-recentf)
        ("s"   projectile-multi-occur)
        ("S"   projectile-replace)
        ("t"   projectile-find-tag)
        ("T"   projectile-regenerate-tags)
        ("u"   projectile-find-test-file)
        ("U"   projectile-test-project)
        ("v"   projectile-display-buffer)
        ("V"   projectile-ibuffer))
(global-set-key (kbd "C-c C-p") 'hydra-projectile/body)

(provide 'init-hydra)
