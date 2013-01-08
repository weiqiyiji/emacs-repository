
(setq cabbage-bundles
      ;; The bundles listed here are enabled on emacs start.
      ;; Full list of bundles: https://github.com/senny/cabbage/wiki/Bundles

      '(
        accessibility
        autoinsert
        c
        cmake
        completion
        css
        common-lisp
        cucumber
        diff
        git
        gtags
        haml-and-sass
        html
        javascript
        lisp
        markdown
        org
        power-edit
        project
        protobuf
        python
        rainbow
        scheme
        snippets
        uniquify
        whitespace
        yaml

        ;; cabbage-developer
        ;; rails
        ;; latex
        ;; plone
        ;; eclim
        ;; eclim-auto-complete
        ;; eclim-company
        ;; maximize
        ;;java
        ;; coffee-script
        ;; less-css
        ))


;; Configure your favorite color theme.
;; Available themes: https://github.com/senny/theme-roller.el/tree/master/themes
(setq cabbage-theme 'color-theme-ir-black)
