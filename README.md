Redmine Wiki Syntax For Vim
===========================

A Vim syntax-highlighting file for the [Redmine](http://www.redmine.org/) wiki.

Installation
============

If you use [pathogen](https://github.com/tpope/vim-pathogen), simply go into
the `bundle` directory and clone the repository in there:
```
cd ~/.vim/bundle
git clone git://github.com/s3rvac/vim-syntax-redminewiki.git
```
If you do not want to use pathogen, you can install the syntax file manually by
copying the `syntax/redminewiki.vim` file to your `~/.vim/syntax` directory (if
that directory does not exist, create it).

Usage
=====

When you edit a Redmine wiki page in Vim, use `:set ft=redminewiki` to select
the Redmine wiki highlighting (make sure that you have enabled syntax
highlighting). Alternatively, you can put something like this into your
`.vimrc`:
```
" Consider all .redmine files as Redmine wiki files.
au BufNewFile,BufRead *.redmine set ft=redminewiki
```
where `redmine` is the suffix of your Redmine wiki files.

Credits
=======

This syntax file is heavily based on the
[textile.vim](http://rubychan.de/share/textile.vim) syntax file by Kornelius
Kalnbach <korny@cYcnus.de>, 2006.
