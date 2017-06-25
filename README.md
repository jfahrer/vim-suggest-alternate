# vim-suggest-alternate

Suggest a corresponding test / implementation file name for the current buffer.

Inspired by https://github.com/compactcode/alternate.vim

# Why

I use alternate.vim with open.vim to quickly find open the corresponding test / implementation file. However, I missed a quick way of creating them.

# Usage

```vimscript
:echo suggest_alternate#FileName()
```

Will output the suggest alternate filename for the current file. Currently only ruby is supported.

In my vimrc I use it as follows in combination with https://github.com/compactcode/open.vim
```vimscript
command! CA Open(suggest_alternate#FileName())
command! CAV OpenVertical(suggest_alternate#FileName())
```
