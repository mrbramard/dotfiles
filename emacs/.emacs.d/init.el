(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 '(package-selected-packages '(lsp-mode magit org)))
(custom-set-faces)

(setq inhibit-startup-message t)

(defun nuit ()
  (interactive)
  (load-theme 'gruvbox-dark-medium t))

(defun jour ()
  (interactive)
  (load-theme gruvbox-soft-medium t))

(nuit)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 0)

(display-line-numbers-mode t)

(setq visible-bell 1)

(set-frame-font "Cascadia Code 11" nil)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups" user-emacs-directory))))

(make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)

(setq auto-save-list-file-prefix (expand-file-name "tmp/auto-saves/sessions/" user-emacs-directory)
      auto-save-file-name-transform `((".*" ,(expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))

(setq create-lockfiles nil)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-log-done 'time)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-agenda-files (list "~/.emacs.d/org/work.org"))
(setq org-default-notes-file "~/.emacs.d/org/work.org")

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package yasnippet
  :ensure t
  :config
  (with-eval-after-load 'yasnippet
    (setq yas-snippet-dirs '(yasnippet-snippets-dir)))
  (yas-reload-all)
  (yas-global-mode))

(use-package yasnippet-snippets
  :ensure t)

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))
