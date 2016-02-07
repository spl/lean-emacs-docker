;; Set up package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Install packages for lean-mode
(defvar lean-mode-required-packages
  '(company dash dash-functional flycheck f
            fill-column-indicator s lua-mode mmm-mode))
(let ((need-to-refresh t))
  (dolist (p lean-mode-required-packages)
    (when (not (package-installed-p p))
      (when need-to-refresh
        (package-refresh-contents)
        (setq need-to-refresh nil))
      (package-install p))))

;; Set up lean-mode
(setq lean-rootdir "/usr/local")
(setq-local lean-emacs-path
            (concat (file-name-as-directory lean-rootdir)
                    "share/emacs/site-lisp/lean"))
(add-to-list 'load-path (expand-file-name lean-emacs-path))
(require 'lean-mode)
