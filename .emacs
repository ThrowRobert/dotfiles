(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "htpps://elpa.gnu.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/elisp/")
(load "sass-mode")

(package-initialize)

(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(haml-indent-offset 4)
 '(inhibit-startup-screen t)
 '(sgml-basic-offset 4)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1d1f21" :foreground "#c5c8c6" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 101 :width normal :foundry "unknown" :family "Ubuntu Mono"))))
 '(custom-button ((t (:background "#353535" :foreground "lightgrey" :box (:line-width 1 :color "#888")))))
 '(custom-button-mouse ((t (:background "#353535" :foreground "lightgrey" :box (:line-width 1 :color "white")))))
 '(custom-button-pressed ((t (:inherit custom-button :background "#444"))))
 '(font-lock-variable-name-face ((t (:foreground "lightgreen"))))
 '(menu ((t (:background "black" :foreground "white"))))
 '(mode-line ((t (:background "#333333" :foreground "#eeeeee"))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#222" :foreground "#3d3d3d" :weight light))))
 '(variable-pitch ((t (:inherit default)))))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers" t)

(require 'unbound)
(require 'mpc)

;; buffer switching
; (iswitchb-mode t)
;; (global-set-key "\C-b" 'switch-to-buffer)

;; (evil-mode 1)

;; (global-set-key (kbd "C-d") 'backward-delete-char-untabify)
;; (global-set-key (kbd "M-d") 'delete-char)

;; (global-set-key (kbd "C-æ") 'evil-normal-state)
;; (global-set-key (kbd "C-ø") 'evil-normal-state)

;; (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;; (define-key evil-insert-state-map (kbd "C-h") 'backward-char)
;; (define-key evil-insert-state-map (kbd "C-j") 'next-line)
;; (define-key evil-insert-state-map (kbd "C-k") 'previous-line)
;; (define-key evil-insert-state-map (kbd "C-l") 'forward-char)

;; (define-key evil-normal-state-map (kbd "C-h") 'backward-char)
;; (define-key evil-normal-state-map (kbd "C-j") 'next-line)
;; (define-key evil-normal-state-map (kbd "C-k") 'previous-line)
;; (define-key evil-normal-state-map (kbd "C-l") 'forward-char)

;; (define-key evil-normal-state-map (kbd "C-e") 'end-of-line)
;; (define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
;; (define-key evil-visual-state-map (kbd "C-e") 'end-of-line)

;; (define-key evil-normal-state-map (kbd "M-D") 'backward-delete-char-untabify)
;; (define-key evil-insert-state-map (kbd "M-D") 'backward-delete-char-untabify)
;; (define-key evil-visual-state-map (kbd "M-D") 'backward-delete-char-untabify)

;; (define-key evil-normal-state-map (kbd "C-m") 'newline)
;; (define-key evil-insert-state-map (kbd "C-m") 'newline)
;; (define-key evil-visual-state-map (kbd "C-m") 'newline)

;; ;; (global-unset-key (kbd "<left>"))
;; ;; (global-unset-key (kbd "<right>"))
;; ;; (global-unset-key (kbd "<up>"))
;; ;; (global-unset-key (kbd "<down>"))

;; (define-key evil-normal-state-map (kbd "M-h") 'evil-window-left)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-z") 'ace-window)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "<f5>") 'dired-toggle)
(global-set-key (kbd "C-c C-f") 'helm-projectile)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)


(define-key dired-mode-map (kbd "C-c RET") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "C-x n s") 'dired-subtree-narrow)

(setq org-agenda-files (list "~/org/timeplan.org"
			     "~/org/notes.org"
			     "~/todo.org"))


(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(ido-mode 1)

(menu-bar-showhide-tool-bar-menu-customize-disable)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(require 'twittering-mode)
(setq twittering-use-master-password t)


;; auto save on focus out
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0)

  (setq c++-tab-always-indent t)

  (setq tabs-width 4)
  (setq indent-tabs-mode t)
  )
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(defun my-neotree-hook ()
  (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
  (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-r)
  (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
  (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
  )
(add-hook 'neotree-hook 'my-neotree-hook)


(defun my-xkcd-hook ()
  (define-key xkcd-mode-map (kbd "p") 'xkcd-prev)
  (define-key xkcd-mode-map (kbd "n") 'xkcd-next)
  (define-key xkcd-mode-map (kbd "M-g g") 'xkcd-get)
  )
(add-hook 'xkcd-mode-hook 'my-xkcd-hook)

;; (evil-set-initial-state 'gnus-article-mode 'normal)

(require 'gnus)

(defun gnus-demon-scan-news-3 ()
  (let ((win (current-window-configuration))
	(gnus-read-active-file 'some)
	(gnus-check-new-newsgroups nil)
	(gnus-verbose 2)
	(gnus-verbose-backends 5)
	(level 3)
	)
    ;; (message "check-mail: %s" (format-time-string "%H:%M:%S"))
    (while-no-input
      (unwind-protect
          (save-window-excursion
            (when (gnus-alive-p)
              (with-current-buffer gnus-group-buffer
                (gnus-group-get-new-news level))))
        (set-window-configuration win)))))

(setq gnus-demon-timestep 10)

(gnus-demon-add-handler 'gnus-demon-scan-news 2 t) ; this does a call to gnus-group-get-new-news

(defun my-gnus-group-list-subscribed-groups ()
  "List all subscribed groups with or without un-read messages"
  (interactive)
  (gnus-group-list-all-groups 5)
  )
(add-hook 'gnus-group-mode-hook
	  ;; list all the subscribed groups even they contain zero un-read messages
	  (lambda () (local-set-key "o" 'my-gnus-group-list-subscribed-groups ))
	  )
(setq gnus-use-cache t)

(setq gnus-summary-thread-gathering-function
      'gnus-gather-threads-by-subject)

(setq gnus-thread-hide-subtree t)
(setq gnus-thread-ignore-subject t)

;; (add-hook 'inferior-octave-mode-hook
	  ;; (lambda ()
	  ;;   (turn-on-font-lock)
	  ;;   (define-key inferior-octave-mode-map (kbd "C-k")
	  ;;     'comint-previous-input)
	  ;;   (define-key inferior-octave-mode-map (kbd "C-j")
	  ;;     'comint-next-input)))

(display-time-mode 1)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(global-set-key
 (kbd "M-s m")
 (defhydra hydra-move
   (:body-pre (next-line))
   "move"
   ("n" next-line)
   ("p" previous-line)
   ("f" forward-char)
   ("b" backward-char)
   ("a" beginning-of-line)
   ("e" move-end-of-line)
   ("v" scroll-up-command)
   ;; Converting M-v to V here by analogy.
   ("V" scroll-down-command)
   ("l" recenter-top-bottom)))
