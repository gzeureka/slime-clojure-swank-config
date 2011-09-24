(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "SystemWindow" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "outline" :family "Meslo LG M DZ")))))

; package.el
(add-to-list 'load-path "~/.emacs.d/")
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Enable line number
(require 'linum+)
(global-linum-mode)

;; Color theme
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)

;; Evil Vim emulation
(add-to-list 'load-path "~/.emacs.d/evil/")
(require 'evil)  
(evil-mode 1)

;; Load and configure SLIME
(add-to-list 'load-path "~/.emacs.d/slime/")
(require 'slime)
(eval-after-load 'slime '(setq slime-protocol-version 'ignore))
(setq slime-net-coding-system 'utf-8-unix)
(set-language-environment "utf-8")
(slime-setup '(slime-repl))

;; elein
(require 'elein)

;; Groovy mode
;;; turn on syntax hilighting
(global-font-lock-mode 1)
;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gvy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;; Maximized Window
(defun maximize-frame ()
  "Maximizes the active frame in Windows"
  (interactive)
  ;; Send a `WM_SYSCOMMAND' message to the active frame with the
  ;; `SC_MAXIMIZE' parameter.
  (when (eq system-type 'windows-nt)
    (w32-send-sys-command 61488)))
(add-hook 'window-setup-hook 'maximize-frame t)

;; set default directory
(cd "D:/work/cowboy/src/Misc/cowboy_clj/")
(setf (stream-external-format *standard-input*) :utf8)
