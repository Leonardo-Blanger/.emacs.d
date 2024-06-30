(scroll-bar-mode -1)  ; Disable visible scrollbar
(tool-bar-mode -1)    ; Disable toolbar
(menu-bar-mode -1)    ; Disable the menu bar
(tooltip-mode -1)     ; Disable tooltip boxes (tips show on minibuffer)

;; Show line numbers everywhere, except for terminal style buffers
(global-display-line-numbers-mode t)
(dolist (mode '(term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Show column numbers, next to line numbers, in the modeline
(column-number-mode)

;; When typing with an active region, replace the region
(delete-selection-mode t)

;; Auto close open parenthesis, brakets, etc
(electric-pair-mode t)

;; Recognizes individual words on CammelCase names
(global-subword-mode t)

;; For switching windows directionally
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)

;; Better bindings for shrinking and enlarging the current window
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Scroll one line at a time when the pointer goes beyond the limits,
;; instead of bringing the pointer to the center of the screen.
(setq scroll-conservatively 101)

;; 10 lines of context overlap when scorlling forward
;; (`scroll-up-command` "C-v"), or backward (`scroll-down-command` "M-v")
(setq next-screen-context-lines 10)

;; Ignore the annoying bell sound
(setq ring-bell-function 'ignore)

;; Prevent Emacs from creating backup files (ending in ~)
(setq make-backup-files nil)

;; Do not auto save files
(setq auto-save-default nil)

;; Send files to the trash bin instead of permanentely deleting them
(setq delete-by-moving-to-trash t)

;; Dired listings are long, show hidden files, and use human readable sizes
(setq dired-listing-switches "-lh")

;; Makes the Emacs Customize system dump its own code into another file,
;; instead of here
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (make-empty-file custom-file))
(load custom-file)

;; Add melpa (stable) to the list of package archives
(setq package-archives
      '(("melpa-stable" . "https://stable.melpa.org/packages/")
	("nongnu" . "https://elpa.nongnu.org/nongnu/")
	("gnu" . "https://elpa.gnu.org/packages/")))

;; Initialize Emacs package management system
(require 'package)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Make sure use-package is loaded
(require 'use-package)

;; Causes the next `use-package` calls to invoke the Emacs package
;; management to download the packages, if they are not already installed.
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; =========================================================================
;; External packages and their configurations from this point down

(use-package modus-themes
  :config
  (load-theme 'modus-vivendi t))

(use-package ivy
  :config
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-extra-directories nil)
  (ivy-mode 1))

(use-package counsel
  :config
  (counsel-mode 1))

(use-package swiper
  :bind
  (("C-s" . swiper)
   ("C-r" . swiper)))

(use-package ivy-rich
  :after (ivy counsel swiper)
  :config
  (ivy-rich-mode 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :config
  (setq which-key-idle-delay 1)
  (which-key-mode))

(use-package helpful
  :after counsel
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))  

(use-package projectile
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :after
  ivy
  :init
  (setq projectile-auto-discover nil)
  :custom
  ((projectile-completion-system 'ivy))
  :config
  (projectile-mode 1))

(use-package counsel-projectile
  :config
  (counsel-projectile-mode 1))

(use-package magit
  :config
  (setq magit-diff-refine-hunk 'all))

(use-package company
  :hook
  (prog-mode . company-mode)
  :bind
  (:map company-mode
	("M-/" . company-complete))
  ;; (:map company-active-map
  ;; 	(("C-n" . nil)
  ;; 	 ("C-p" . nil)))
  :config
  (setq company-tooltip-offset-display 'lines)
  (setq company-format-margin-function 'company-text-icons-margin)
  (setq company-show-quick-access t))

(use-package treemacs
  :commands
  (treemacs)
  :bind
  ("C-c t" . treemacs)
  :config
  (treemacs-project-follow-mode t)
  (treemacs-indent-guide-mode t))


;; (defun my/lsp-mode-setup()
;;   (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbos))
;;   (lsp-headerline-breadcrumb-mode))

;; (use-package lsp-mode
;;   :commands
;;   (lsp lsp-deferred)
;;   :hook
;;   (lsp-mode . my/lsp-mode-setup)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   :config
;;   (lsp-enable-which-key-integration t))

;; (use-package company
;;   :after lsp-mode
;;   :hook (prog-mode . company-mode)
;;   :bind
;;   (:map company-active-map
;; 	("<tab>" . company-complete-selection))
;;   (:map lsp-mode-map
;; 	("<tab>" . company-indent-or-complete-common))
;;   :custom
;;   (company-minimum-prefix-length 1)
;;   (company-idle-delay 0.0))

;; (use-package company-box
;;   :hook (company-mode . company-box-mode))

;; (use-package lsp-ui
;;   :hook (lsp-mode . lsp-ui-mode)
;;   :custom
;;   (setq lsp-ui-doc-position 'bottom))

;; (use-package lsp-treemacs
;;   :after lsp)

;; (use-package lsp-ivy
;;   :after lsp)

;; (use-package evil-nerd-commenter)

;; (use-package eat)

;; (use-package lsp-mode
;;   :commands
;;   (lsp lsp-deferred)
;;   ;; :hook
;;   ;; (prog-mode . lsp-deferred)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   :config
;;   (lsp-enable-which-key-integration t)
;;   (setq lsp-idle-delay 0.500)
;;   ; For performance improvements
;;   (setq read-process-output-max (* 1024 1024)) ; 1mb
;;   (setq gc-cons-threshold 100000000))

;; (use-package lsp-ui
;;   :after lsp-mode
;;   :config
;;   (setq lsp-ui-sideline-show-hover t)
;;   (setq lsp-ui-sideline-show-code-actions t)
;;   (setq lsp-ui-doc-show-with-cursor t)
;;   :bind
;;   (:map lsp-ui-mode
;; 	([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
;; 	([remap xref-find-references] . lsp-ui-peek-find-references)))

;; ;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
;; ;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; ;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; ;; optionally if you want to use debugger
;; (use-package dap-mode)
;; ;; (use-package dap-LANGUAGE) to load the dap adapter for your language

