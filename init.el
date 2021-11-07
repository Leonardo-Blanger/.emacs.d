(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; For switching windows directionally using S-<left>, S-<down>, etc...
(windmove-default-keybindings)

;; Ignore the annoying bell sound
(setq ring-bell-function 'ignore)

;; Needed in order to type portuguese characters.
(define-key key-translation-map [dead-tilde] (lookup-key key-translation-map "\C-x8~"))
(global-set-key (kbd "<dead-acute> c") (lambda () (interactive) (insert-string "ç")))

;; org-mode keybindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c h") 'org-toggle-heading)

;; List tabs keybinding
(global-set-key (kbd "C-x t l") 'tab-list)

;; Join the current line with the previous one, deleting any indentation space.
(global-set-key (kbd "M-\"") 'delete-indentation)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
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
 '(exwm-floating-border-color "#0f0823")
 '(fci-rule-color "#BA45A3")
 '(global-auto-revert-mode t)
 '(global-auto-revert-non-file-buffers nil)
 '(global-display-line-numbers-mode t)
 '(global-highlight-parentheses-mode nil)
 '(global-so-long-mode t)
 '(global-subword-mode t)
 '(highlight-tail-colors ((("#1b1e1f" "#1b1e1f") . 0) (("#111c36" "#111c36") . 20)))
 '(ido-enable-flex-matching t)
 '(ido-mode 'both nil (ido))
 '(jdee-db-active-breakpoint-face-colors (cons "#131033" "#1ea8fc"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#131033" "#a7da1e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#131033" "#546A90"))
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(next-screen-context-lines 10)
 '(objed-cursor-color "#e61f44")
 '(package-selected-packages
   '(flycheck neotree auctex elpy doom-themes org vterm highlight-operators highlight-numbers highlight-parentheses))
 '(pdf-view-midnight-colors (cons "#f2f3f7" "#0c0a20"))
 '(pos-tip-background-color "#2a2931")
 '(pos-tip-foreground-color "#d4d4d6")
 '(rustic-ansi-faces
   ["#0c0a20" "#e61f44" "#a7da1e" "#ffd400" "#1ea8fc" "#ff2afc" "#42c6ff" "#f2f3f7"])
 '(scroll-bar-mode nil)
 '(scroll-conservatively 101)
 '(show-paren-mode nil)
 '(size-indication-mode t)
 '(tab-bar-close-button-show nil)
 '(tab-bar-new-button-show nil)
 '(tab-bar-show 1)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#0c0a20")
 '(vc-annotate-color-map
   (list
    (cons 20 "#a7da1e")
    (cons 40 "#c4d814")
    (cons 60 "#e1d60a")
    (cons 80 "#ffd400")
    (cons 100 "#efa314")
    (cons 120 "#df7329")
    (cons 140 "#cf433e")
    (cons 160 "#df3a7d")
    (cons 180 "#ef32bc")
    (cons 200 "#ff2afc")
    (cons 220 "#f626be")
    (cons 240 "#ee2281")
    (cons 260 "#e61f44")
    (cons 280 "#c13157")
    (cons 300 "#9d4469")
    (cons 320 "#78577d")
    (cons 340 "#BA45A3")
    (cons 360 "#BA45A3")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "mononoki Nerd Font Mono" :foundry "UKWN" :slant normal :weight normal :height 113 :width normal))))
 '(info-xref-visited ((t (:inherit info-xref)))))

;; Elpy mode by default
(elpy-enable)

;; Hightlight matching parentheses in programming modes
(add-hook 'prog-mode-hook 'highlight-parentheses-mode)

;; Abbrev mode turned off by default on programming modes
(add-hook 'prog-mode-hook (lambda () (abbrev-mode -1)))
