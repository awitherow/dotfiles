(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (doom-themes go-autocomplete go-eldoc go-guru go-mode multiple-cursors achievements ac-js2 abyss-theme js2-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; visual editor prettification
(global-linum-mode 1)
(setq linum-format "%d ")

;; load packages
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; prettier config
(require 'prettier-js)
(setq prettier-js-args '(
  "--trailing-comma" "all"
  "--single-quote" "true"
  "--print-width" "80"
  "--tab-width" "4"
  ))

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-d") 'mc/mark-all-like-this)

;; add hooks
(add-hook 'js2-mode-hook 'prettier-js-mode)

;; setup go stuff
;; go mode
(defun go-mode-setup ()
  (go-eldoc-setup))

(add-hook 'go-mode-hook 'go-mode-setup)

;; go fmt before save
(defun go-mode-setup ()
  (go-eldoc-setup)
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'go-mode-setup)

;; go imports
(defun go-mode-setup ()
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'go-mode-setup)
