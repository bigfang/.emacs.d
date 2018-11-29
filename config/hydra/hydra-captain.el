;; -*- mode: Emacs-Lisp -*-


(defhydra hydra-browse (:color teal :hint nil :columns 1)
  "visit website"
  ("g" (browse-url "https://github.com") "GitHub")
  ("r" (browse-url "https://www.reddit.com") "Reddit")
  ("s" (browse-url "https://bbs.saraba1st.com/2b/forum-75-1.html") "Stage1st")
  ("t" (browse-url "http://club.tgfcer.com/forum-25-1.html") "TGFC")
  ("x" (browse-url "https://xueqiu.com") "xueqiu")
  ("z" (browse-url "https://zhihu.com") "zhihu")
  ("q" nil :color blue))


(defhydra hydra-captain (:color teal :exit t :hint nil :columns 3)
  "      --- Hydra Captain ---    "
  ("." xref-find-definitions "xref find def")
  (";" xref-find-references "xref find ref")
  ("'" xref-find-apropos "xref find apropos")

  ("/" swiper "swiper")
  ("a" swiper-all "swiper-all")
  ("j" ffap)
  ("f" ido-find-file "ido file")

  ("t" google-translate-smooth-translate "google translate")
  ("g" google-this "google this")
  ("RET" google-this-search "google search")

  ("b" hydra-browse/body "visit website")

  ("<escape>" nil :color blue)
  ("q" nil :color blue))


(provide 'hydra/hydra-captain)
