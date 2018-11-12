;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-projectile-other-window (:color teal)
  "projectile-other-window"
  ("f"  projectile-find-file-other-window        "file")
  ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ("d"  projectile-find-dir-other-window         "dir")
  ("b"  projectile-switch-to-buffer-other-window "buffer")
  ("q"  nil                                      "cancel" :color blue))

(defhydra hydra-projectile (:color teal :hint nil :idle .5)
  "
     PROJECTILE: %(projectile-project-root)

    Navigation          Search/Replace          Buffers                Cache
------------------------------------------------------------------------------------------
  _d_: dired           _s_: ripgrep           _i_: Ibuffer           _c_: cache clear
  _g_: file            _a_: ag                _b_: switch to buffer  _x_: remove known project
  _f_: file dwim       _o_: multi-occur       _K_: Kill buffers      _X_: cleanup non-existing
  _e_: recent file     _r_: replace                                ^^_z_: cache current

"
  ("="   list-packages "list packages")
  ("SPC" pyvenv-workon "python workon")

  ("p"   counsel-projectile-switch-project)
  ("O"   projectile-switch-open-project)
  ("d"   projectile-dired)
  ("g"   counsel-projectile-find-file)
  ("f"   counsel-projectile-find-file-dwim)
  ("e"   projectile-recentf)
  ("RET" projectile-run-eshell)

  ("a"   counsel-projectile-ag)
  ("s"   counsel-projectile-rg)
  ("r"   projectile-replace)
  ("o"   projectile-multi-occur)

  ("i"   projectile-ibuffer)
  ("b"   counsel-projectile-switch-to-buffer)
  ("K"   projectile-kill-buffers)

  ("c"   projectile-invalidate-cache)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)

  ("`"   hydra-projectile-other-window/body "other window")
  ("q"   nil "cancel" :color blue))


(provide 'hydra/hydra-projectile)
;;; hydra-projectile.el ends here
