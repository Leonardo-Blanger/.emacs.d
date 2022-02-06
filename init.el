(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)


(use-package auto-complete
  :init (progn
	  (ac-config-default)
	  (global-auto-complete-mode t)))

(use-package flycheck)

(use-package modern-cpp-font-lock)

(use-package magit)

(use-package neotree)

(use-package auctex
  :defer t)

(use-package elpy)

(use-package doom-themes)

(use-package org)

(use-package vterm)

(use-package highlight-operators)

(use-package highlight-numbers)

(use-package highlight-parentheses)

(use-package highlight-indent-guides)


;; For switching windows directionally using S-<left>, S-<down>, etc...
(windmove-default-keybindings)

;; Ignore the annoying bell sound
(setq ring-bell-function 'ignore)

;; Needed in order to type portuguese characters.
(define-key key-translation-map [dead-tilde] (lookup-key key-translation-map "\C-x8~"))
(global-set-key (kbd "<dead-acute> c") (lambda () (interactive) (insert-string "ç")))

;; List tabs keybinding
(global-set-key (kbd "C-x t l") 'tab-list)

;; Join the current line with the previous one, deleting any indentation space.
(global-set-key (kbd "M-\"") 'delete-indentation)

;; Elpy mode by default
(elpy-enable)

;; Hightlight matching parentheses in programming modes
(add-hook 'prog-mode-hook 'highlight-parentheses-mode)

;; Abbrev mode turned off by default on programming modes
(add-hook 'prog-mode-hook (lambda () (abbrev-mode -1)))

;; Modern C++ Font Lock
(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)

;; Highlight indentation on programming modes
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; Highlight current line on programming modes
(add-hook 'prog-mode-hook 'hl-line-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-revert-avoid-polling nil)
 '(auto-revert-use-notify t)
 '(auto-save-default nil)
 '(column-number-mode t)
 '(custom-enabled-themes '(doom-dark+))
 '(custom-safe-themes
   '("1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" default))
 '(delete-by-moving-to-trash t)
 '(delete-selection-mode t)
 '(dired-listing-switches "-lh")
 '(electric-pair-mode t)
 '(global-auto-revert-mode t)
 '(global-auto-revert-non-file-buffers nil)
 '(global-display-line-numbers-mode t)
 '(global-highlight-parentheses-mode nil)
 '(global-so-long-mode t)
 '(global-subword-mode t)
 '(highlight-indent-guides-method 'bitmap)
 '(ido-enable-flex-matching t)
 '(ido-mode 'both nil (ido))
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(mode-line-percent-position '(-3 "%o"))
 '(next-screen-context-lines 10)
 '(package-selected-packages
   '(hightlight-parentheses hightlight-numbers yasnippet-snippets which-key vterm use-package try neotree modern-cpp-font-lock magit highlight-parentheses highlight-operators highlight-numbers flycheck elpy doom-themes auto-complete auctex))
 '(pos-tip-background-color "#2a2931")
 '(pos-tip-foreground-color "#d4d4d6")
 '(scroll-bar-mode nil)
 '(scroll-conservatively 101)
 '(show-paren-mode nil)
 '(size-indication-mode t)
 '(tab-bar-close-button-show nil)
 '(tab-bar-new-button-show nil)
 '(tab-bar-show 1)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(info-xref-visited ((t (:inherit info-xref)))))
