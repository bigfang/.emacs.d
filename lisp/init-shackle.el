;; -*- mode: Emacs-Lisp -*-


;; display-buffer
(add-to-list 'display-buffer-alist
             '("\\*.*\\*"
               (display-buffer-reuse-window
                display-buffer-below-selected)
               (split-window-sensibly)
               (window-height   . 0.3)
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
          ("*Help*"                             :select t    :size 0.3  :align t     :inhibit-window-quit nil )
          (helpful-mode                         :select t    :size 0.4  :align t     )
          (flycheck-error-list-mode             :select nil  :size 0.3  :align t     )

          ;; ("*eshell*"                           :select t    :size 0.6  :align t     )
          ;; ("*Shell Command Output*"             :select nil                          )
          ;; ("\\*Async Shell.*\\*"     :regexp t  :ignore t                            )
          ;; ("\\*poporg.*\\*"          :regexp t  :select t    :other t                )
          ;; (deadgrep-mode                        :select t    :size 0.6  :align t     :inhibit-window-quit t  )
          ("*info*"                             :select t                            :inhibit-window-quit t  :same t  )
          ("\\*[Wo]*Man.*\\*"        :regexp t  :select t    :other t                :inhibit-window-quit t  )
          ("*Messages*"                         :select nil  :other t                :inhibit-window-quit t  )
          ))
  (shackle-mode 1))


(provide 'init-shackle)


;; Elements of the `shackle-rules' alist:
;;
;; |-----------+------------------------+--------------------------------------------------|
;; | CONDITION | symbol                 | Major mode of the buffer to match                |
;; |           | string                 | Name of the buffer                               |
;; |           |                        | - which can be turned into regexp matching       |
;; |           |                        | by using the :regexp key with a value of t       |
;; |           |                        | in the key-value part                            |
;; |           | list of either         | a list groups either symbols or strings          |
;; |           | symbol or string       | (as described earlier) while requiring at        |
;; |           |                        | least one element to match                       |
;; |           | t                      | t as the fallback rule to follow when no         |
;; |           |                        | other match succeeds.                            |
;; |           |                        | If you set up a fallback rule, make sure         |
;; |           |                        | it's the last rule in shackle-rules,             |
;; |           |                        | otherwise it will always be used.                |
;; |-----------+------------------------+--------------------------------------------------|
;; | KEY-VALUE | :select t              | Select the popped up window. The                 |
;; |           |                        | `shackle-select-reused-windows' option makes     |
;; |           |                        | this the default for windows already             |
;; |           |                        | displaying the buffer.                           |
;; |-----------+------------------------+--------------------------------------------------|
;; |           | :inhibit-window-quit t | Special buffers usually have `q' bound to        |
;; |           |                        | `quit-window' which commonly buries the buffer   |
;; |           |                        | and deletes the window. This option inhibits the |
;; |           |                        | latter which is especially useful in combination |
;; |           |                        | with :same, but can also be used with other keys |
;; |           |                        | like :other as well.                             |
;; |-----------+------------------------+--------------------------------------------------|
;; |           | :ignore t              | Skip handling the display of the buffer in       |
;; |           |                        | question. Keep in mind that while this avoids    |
;; |           |                        | switching buffers, popping up windows and        |
;; |           |                        | displaying frames, it does not inhibit what may  |
;; |           |                        | have preceded this command, such as the          |
;; |           |                        | creation/update of the buffer to be displayed.   |
;; |-----------+------------------------+--------------------------------------------------|
;; |           | :same t                | Display buffer in the current window.            |
;; |           | :popup t               | Pop up a new window instead of displaying        |
;; |           | *mutually exclusive*   | the buffer in the current one.                   |
;; |-----------+------------------------+--------------------------------------------------|
;; |           | :other t               | Reuse the window `other-window' would select if  |
;; |           | *must not be used      | there's more than one window open, otherwise pop |
;; |           | with :align, :size*    | up a new window. When used in combination with   |
;; |           |                        | the :frame key, do the equivalent to             |
;; |           |                        | other-frame or a new frame                       |
;; |-----------+------------------------+--------------------------------------------------|
;; |           | :align                 | Align a new window at the respective side of     |
;; |           | 'above, 'below,        | the current frame or with the default alignment  |
;; |           | 'left, 'right,         | (customizable with `shackle-default-alignment')  |
;; |           | or t (default)         | by deleting every other window than the          |
;; |           |                        | currently selected one, then wait for the window |
;; |           |                        | to be "dealt" with. This can either happen by    |
;; |           |                        | burying its buffer with q or by deleting its     |
;; |           |                        | window with C-x 0.                               |
;; |           | :size                  | Aligned window use a default ratio of 0.5 to     |
;; |           | a floating point       | split up the original window in half             |
;; |           | value between 0 and 1  | (customizable with `shackle-default-size'), the  |
;; |           | is interpreted as a    | size can be changed on a per-case basis by       |
;; |           | ratio. An integer >=1  | providing a different floating point value like  |
;; |           | is interpreted as a    | 0.33 to make it occupy a third of the original   |
;; |           | number of lines.       | window's size.                                   |
;; |-----------+------------------------+--------------------------------------------------|
;; |           | :frame t               | Pop buffer to a frame instead of a window.       |
;; |-----------+------------------------+--------------------------------------------------|
;;
;; http://emacs.stackexchange.com/a/13687/115
;; Don't show Async Shell Command buffers
