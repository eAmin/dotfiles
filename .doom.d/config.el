;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(add-to-list 'major-mode-remap-alist '(typescript-mode . typescript-ts-mode))
(add-to-list 'major-mode-remap-alist '(js-mode . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'"  . typescript-ts-mode))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(after! treesit
  (setq treesit-language-source-alist
        (append treesit-language-source-alist
                '((bash       "https://github.com/tree-sitter/tree-sitter-bash")
                  (css        "https://github.com/tree-sitter/tree-sitter-css")
                  (dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")
                  (go         "https://github.com/tree-sitter/tree-sitter-go")
                  (html       "https://github.com/tree-sitter/tree-sitter-html")
                  (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
                  (json       "https://github.com/tree-sitter/tree-sitter-json")
                  (tsx        "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
                  (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
                  )))
  )

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! lsp-mode
  (setq lsp-enable-symbol-highlighting t)
  (setq lsp-lens-enable t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-completion-provider :company))

;;(after! tree-sitter
;;(add-to-list 'tree-sitter-major-mode-language-alist '(rjsx-mode . jsx))
;; (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-tsx-mode . tsx)))

(set-formatter! 'oxfmt
  '("oxfmt" "--stdin" "--stdin-filepath" "%B")
  :modes '(tsx-ts-mode
           typescript-ts-mode
           js-ts-mode
           js-mode
           typescript-mode
           ))

;;(add-to-list 'apheleia-mode-alist '(javascript-mode . oxfmt))
;;(add-to-list 'apheleia-mode-alist '(js-mode . oxfmt))
;;(add-to-list 'apheleia-mode-alist '(js-ts-mode . oxfmt))
;;(add-to-list 'apheleia-mode-alist '(rjsx-mode . oxfmt))
;;(add-to-list 'apheleia-mode-alist '(typescript-mode . oxfmt))
;;(add-to-list 'apheleia-mode-alist '(typescript-ts-mode . oxfmt))
;;(add-to-list 'apheleia-mode-alist '(typescript-tsx-mode . oxfmt))
;;(add-to-list 'apheleia-mode-alist '(json-mode . oxfmt)))
;;(setf (alist-get 'tsx-ts-mode apheleia-mode-alist) 'oxfmt)
;;(setf (alist-get 'typescript-ts-mode apheleia-mode-alist) 'oxfmt)
;;(setf (alist-get 'js-ts-mode apheleia-mode-alist) 'oxfmt)
;;(setf (alist-get 'js-mode apheleia-mode-alist) 'oxfmt)
;;(setf (alist-get 'typescript-mode apheleia-mode-alist) 'oxfmt)
;; (setf (alist-get 'web-mode apheleia-mode-alist) 'oxfmt)
;; (setf (alist-get 'vue-mode apheleia-mode-alist) 'oxfmt)
;; )

(after! flycheck
  (flycheck-define-checker oxlint
    "A checker using oxlint"
    :command ("oxlint" source-inplace)
    :error-patterns
    ((error line-start (file-name) ":" line ":" column ": error: " (message) line-end)
     (warning line-start (file-name) ":" line ":" column ": warning: " (message) line-end))
    :modes (javascript-mode js-mode js-ts-mode rjsx-mode typescript-mode typescript-ts-mode typescript-tsx-mode))

  (add-to-list 'flycheck-checkers 'oxlint)
  (flycheck-add-mode 'oxlint 'javascript-mode)
  (flycheck-add-mode 'oxlint 'typescript-mode)
  (setq flycheck-disabled-checkers '(javascript-eslint typescript-eslint)))

(map! :leader
      :desc "Format buffer" "c f" #'apheleia-format-buffer
      :desc "LSP rename" "c r" #'lsp-rename
      :desc "Find references" "c R" #'lsp-find-references
      :desc "Git status" "g s" #'magit-status
      :desc "Treemacs" "o p" #'treemacs)

(setq gc-cons-threshold (* 100 1024 1024))
(setq read-process-output-max (* 1024 1024))
