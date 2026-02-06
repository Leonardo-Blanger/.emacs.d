(scroll-bar-mode -1)  ; Disable visible scrollbar
(tool-bar-mode -1)    ; Disable toolbar
(menu-bar-mode -1)    ; Disable the menu bar
(tooltip-mode -1)     ; Disable tooltip boxes (tips show on minibuffer)

;; Show line numbers everywhere
(global-display-line-numbers-mode t)

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

;; 10 lines of context overlap when scrolling forward
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

;; Dired listings are long, and use human readable sizes
(setq dired-listing-switches "-lh")

;; Dired asks before creating destination directories when copying files
(setq dired-create-destination-dirs 'ask)

;; Signal Dired to create a new directory
;; when a non-existent target file name ends in '/'
(setq dired-create-destination-dirs-on-trailing-dirsep t)

;; Dired listings show the amount of space taken up by files
;; in the directory
(setq dired-free-space 'separate)

;; Makes the Emacs Customize system dump its own code into another file,
;; instead of here
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (make-empty-file custom-file))
(load custom-file)

;; Remove the built-in Version Control information from the modeline.
;; We use Magit for version control instead.
(setq-default mode-line-format
              (delete '(vc-mode vc-mode) mode-line-format))

;; Where Emacs pulls packages from
(setq package-archives
      '(("nongnu" . "https://elpa.nongnu.org/nongnu/")
	("gnu" . "https://elpa.gnu.org/packages/")
	;; ("melpa-stable" . "https://stable.melpa.org/packages/")
	))

;; Initialize Emacs package management system
(require 'package)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Print startup time and number of garbage collections
;; in the minibuffer on launch.
(defun my/display-startup-time()
  (message "Emacs loaded in %s with %d garbage collections."
	   (format "%.2f seconds"
		   (float-time (time-subtract
				after-init-time before-init-time)))
	   gcs-done))
(add-hook 'emacs-startup-hook #'my/display-startup-time)

;; Make sure use-package is loaded
(require 'use-package)

;; Causes the next `use-package` calls to invoke the Emacs package
;; management to download the packages, if they are not already installed.
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; =========================================================================
;; External packages and their configurations from this point down

(use-package ef-themes
  :config
  (load-theme 'ef-elea-dark t))

(use-package ivy
  :config
  (setopt ivy-count-format "(%d/%d) ")
  (setq ivy-extra-directories nil)
  (ivy-mode 1))

(use-package counsel
  :config
  (counsel-mode 1))

(use-package swiper
  :bind
  (("C-s" . swiper)
   ("C-r" . swiper)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :config
  (setq which-key-idle-delay 1)
  (which-key-mode))

(use-package magit
  :config
  (setq magit-diff-refine-hunk t)
  (setq git-commit-cd-to-toplevel t))

(use-package company
  :hook
  prog-mode
  text-mode
  :bind
  (:map company-mode
	("M-/" . company-complete))
  :config
  (setq company-tooltip-offset-display 'lines)
  (setq company-format-margin-function 'company-text-icons-margin)
  (setq company-show-quick-access t))

(use-package ediff
  :config
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))
