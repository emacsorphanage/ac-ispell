# ac-ispell.el

## Introduction

`ac-ispell.el` is ispell/aspell completion source for [auto-complete](https://github.com/auto-complete/auto-complete).


## Screenshot

![ac-ispell](image/ac-ispell.png)


## Requirements

- Emacs 23 or higher
- [auto-complete](https://github.com/auto-complete/auto-complete)


## Commands

#### `ac-ispell-setup`

Setup auto-complete source for ispell/aspell. This command must be called at the beginning.


## Customize Variables

#### `ac-ispell-requires`(Default `3`)

Required number of characters of this source completion.
You should change this value before calling `ac-ispell-setup`.

I recommend to use `custom-set-variable` for setting this value.


## Sample Configuration

```elisp
(custom-set-variable
  '(ac-ispell-requires 4))

(eval-after-load "auto-complete"
  '(progn
      (ac-ispell-setup)))

(defun my/git-commit-mode-hook ()
  (add-to-list 'ac-sources 'ac-source-ispell))

(add-hook 'git-commit-mode-hook 'my/git-commit-mode-hook)

```
