;; -*- mode: Emacs-Lisp -*-


;; display-buffer
(add-to-list 'display-buffer-alist
             '("\\*.*\\*"
               (display-buffer-reuse-window
                display-buffer-below-selected)
               (split-window-sensibly)
               (window-height   . 0.4)
               (reusable-frames . visible)))


(use-package shackle
  :ensure t
  :config
  (setq shackle-select-reused-windows nil  ; default nil
        shackle-inhibit-window-quit-on-same-windows nil ; default nil
        shackle-default-alignment 'below ; default below
        shackle-default-size 0.4) ; default 0.5
  (setq shackle-rules
        ;; CONDITION(:regexp)        :regexp    :select      :size+:align|:other     :inhibit-window-quit    :same|:popup
        '((compilation-mode                     :select nil                          )
          ("*Completions*"                                   :size 0.3  :align t     )
          ("*undo-tree*"             :regexp t               :size 0.15 :align left  )
          (occur-mode                           :select t    :size 0.4  :align t     )
          ;; ("*Help*"                             :select t    :size 0.3  :align t     :inhibit-window-quit nil )
          (flycheck-error-list-mode             :select nil  :size 0.3  :align t     )

          ;; ("*eshell*"                           :select t    :size 0.6  :align t     )
          ;; ("*Shell Command Output*"             :select nil                          )
          ;; ("\\*Async Shell.*\\*"     :regexp t  :ignore t                            )
          ;; ("\\*poporg.*\\*"          :regexp t  :select t    :other t                )
          ("*rg*"                               :select t                            :inhibit-window-quit t  :same t  )
          (deadgrep-mode                        :select t                            :inhibit-window-quit t  :same t  )
          ("*info*"                             :select t                            :inhibit-window-quit t  :same t  )
          ("\\*[Wo]*Man.*\\*"        :regexp t  :select t    :other t                :inhibit-window-quit t  )
          ("*Messages*"                         :select nil  :other t                :inhibit-window-quit t  )
          ))
  (shackle-mode 1))


(provide 'init-shackle)
