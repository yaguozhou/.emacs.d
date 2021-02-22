;; my custom configuration

;; neotree
(require-package 'neotree)
(require 'neotree)
(setq neo-create-file-auto-open t)
(setq neo-show-hidden-files t)
(setq neo-smart-open t)
(setq neo-autorefresh t)
(setq projectile-switch-project-action 'neotree-projectile-action)
(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))
(global-set-key [f8] 'neotree-toggle)

;; yasnippet
(require-package 'yasnippet)
(require-package 'yasnippet-snippets)
(require 'yasnippet)
(yas-global-mode 1)

;;
(toggle-truncate-lines t)

;; xclip
(require-package 'xclip)
(xclip-mode 1)

(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                              "xelatex -interaction nonstopmode %f"))

;; ansible
(require-package 'ansible)
(add-hook 'yaml-mode-hook '(lambda () (ansible 1)))


(provide 'init-preload-local)
