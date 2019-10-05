;; file downloaded from @daniellawrence's dot-files repository
;; link:
;; https://raw.githubusercontent.com/daniellawrence/dot-files/master/dot-emacs

(toggle-scroll-bar -1)
(tool-bar-mode -1)

(require 'package)
:(package-initialize)
 (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
 (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
 (add-to-list 'package-archives '("melpa" . "https://melpa.milkbox.net/packages/"))
 (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(package-refresh-contents)

;; check if the packages is installed; if not, install it.
(mapc
 (lambda (package)
   (or (package-installed-p package)
	   (package-install package)))
 '(
   dired+
   rainbow-mode
   jedi helm
   yaml-mode ace-jump-mode
   monokai-theme
   web-mode
   markdown-mode dockerfile-mode
   gitlab
   dash dash-functional
   git-gutter+ magit git-gutter-fringe
   linum
   ack ag
   projectile
   flycheck
   json-mode
   nyan-mode
   virtualenvwrapper
   git-timemachine
   go-mode
   nginx-mode
   ))

(nyan-mode)

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; Display line and column numbers
(setq line-number-mode    t)
(setq column-number-mode  t)


(require 'virtualenvwrapper)
;; (setq jedi:setup-keys t)

(setq venv-location "~/.virtualenvs/")
(setq python-shell-virtualenv-path "~/.virtualenvs/emacs")
(setq python-environment-directory venv-location)

(venv-initialize-eshell) ;; if you want eshell support
(venv-initialize-interactive-shells) ;; if you want intera`ctive shell support

;; magit love
(global-set-key (kbd "C-c z") 'magit-status)


;; Prevent the cursor from blinking
(blink-cursor-mode 0)
;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; Don't let Emacs hurt your ears
(setq visible-bell t)

;; ~/.emacs
(add-to-list 'auto-mode-alist '("dot-emacs" . lisp-mode))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)

(global-set-key (kbd "C-x C-f") 'helm-find-files)


(add-hook 'emacs-startup-hook (lambda ()
                                (let ((default-directory (getenv "HOME")))
                                  (command-execute 'eshell)
                                  (bury-buffer))))

(global-set-key (kbd "C-x C-a") 'helm-do-grep-ag)

(setq enable-recursive-minibuffers t)

(setq helm-grep-default-command
      "ack-grep -Hn --smart-case --no-group %e %p %f"
      helm-grep-default-recurse-command
      "ack-grep -H --smart-case --no-group %e %p %f")

(global-git-gutter-mode +1)

(load-theme 'monokai t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (flycheck-pyflakes nginx-mode go-mode git-timemachine virtualenvwrapper nyan-mode json-mode projectile ag ack git-gutter-fringe magit git-gutter+ dash-functional gitlab dockerfile-mode markdown-mode web-mode monokai-theme ace-jump-mode yaml-mode helm jedi rainbow-mode dired+))))

(global-set-key (kbd "C-c p s") 'helm-projectile-ack)
(global-set-key (kbd "C-c p z") 'magit-status)
(global-set-key (kbd "C-c p f") 'helm-projectile-find-file)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
;; (helm-projectile-on)

(server-mode)


(global-auto-complete-mode)

;; (add-hook 'python-mode-hook
;;	  (lambda ()
;;	    (setq comint-process-echoes t)
;;	    (jedi:setup)
;;	    ))

;; (setq jedi:setup-keys t)
;; (setq jedi:complete-on-dot nil)

;; use flake8 for checking
(setq python-check-command "flake8")

;; set the default virtualenv so that jedi can at least load
(setq python-shell-virtualenv-path "~/.virtualenvs/emacs")

;; setup virtualenvwrapper
(setq venv-location "~/.virtualenvs/")
(venv-initialize-eshell)
(venv-initialize-interactive-shells)

(autoload 'ssh-config-mode "ssh-config-mode" t)
(add-to-list 'auto-mode-alist '(".ssh/config\\'"       . ssh-config-mode))
(add-to-list 'auto-mode-alist '("sshd?_config\\'"      . ssh-config-mode))
(add-to-list 'auto-mode-alist '("known_hosts\\'"       . ssh-known-hosts-mode))
(add-to-list 'auto-mode-alist '("authorized_keys2?\\'" . ssh-authorized-keys-mode))
(add-hook 'ssh-config-mode-hook 'turn-on-font-lock)

(flycheck-mode)


;; jump to line
(global-set-key (kbd "C-;") 'goto-line)
(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;
(setq ring-bell-function 'ignore)


(global-set-key (kbd "C-c o") 
                (lambda () (interactive) (find-file "~/organizer.org")))
(set-register ?o (cons 'file "~/organizer.org"))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/organizer.org")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(setq create-lockfiles nil) 
(set-keyboard-coding-system nil)
