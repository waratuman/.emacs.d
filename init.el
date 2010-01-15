;;; init.el

;; Much of this is from the emacs-starter-kit by technomancy. 
;; Just wanted my own customizations.

;; Remove GUI items.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load Path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;; ELPA
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; Items to be loaded on every session.
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)

(require 'waratuman-bindings)
(require 'waratuman-misc)
(require 'waratuman-defuns)

;; Load system and user specific customizations.
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-directory (concat dotfiles-dir user-login-name))

(add-to-list 'load-path user-specific-directory)
(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-directory)
    (mapc #'load (directory-files user-specific-directory nil ".*el")))
