;; -*- mode: Emacs-Lisp -*-


(defhydra hydra:adapter-default (:color teal :hint nil :columns 3)
  "default adapter"
   ("o" list-packages "list packages")
   ("j" ffap "ffap")
   ("z" fzf-directory "fzf-directory")
   ("." (browse-url ".") "current directory")
   ("q" nil :color blue))

(defun hydra:adapter ()
  "adapter"
  (interactive)
  (cond
   ((eq major-mode 'org-mode) (hydra:org/body))
   ((eq major-mode 'python-mode) (hydra:python/body))
   ((eq major-mode 'json-mode) (hydra:json/body))
   ((eq major-mode 'markdown-mode) (hydra:markdown/body))
   ((eq major-mode 'csv-mode) (hydra:csv/body))
   ((bound-and-true-p alchemist-mode) (hydra:alchemist/body))
   (t (hydra:adapter-default/body))))


(provide 'hydra-adapter)
