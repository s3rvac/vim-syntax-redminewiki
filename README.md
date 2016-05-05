Redmine Wiki Syntax For Vim
===========================

A Vim syntax-highlighting file for the [Redmine](http://www.redmine.org/) wiki.

Installation
============

If you use [pathogen](https://github.com/tpope/vim-pathogen), simply go into
the `bundle` directory and clone the repository in there:
```
cd ~/.vim/bundle
git clone https://github.com/s3rvac/vim-syntax-redminewiki.git
```
You can also install the plugin manually by copying the
[`syntax/redminewiki.vim`](https://raw.githubusercontent.com/s3rvac/vim-syntax-redminewiki/master/syntax/redminewiki.vim)
file to your `~/.vim/syntax` directory. If that directory does not exist,
create it.

Usage
=====

When you edit a Redmine wiki page in Vim, execute `:set ft=redminewiki` to
select the Redmine wiki highlighting (make sure that you have enabled syntax
highlighting). Alternatively, you can put the following autocommand to your
`.vimrc`:
```
" Consider all .redmine files as Redmine wiki files.
au BufNewFile,BufRead *.redmine set filetype=redminewiki
```
where `redmine` is the suffix of your Redmine wiki files.

If you use the [It's All Text](https://github.com/docwhat/itsalltext) Firefox
plugin to edit textareas in Vim, you can add something along these lines to
your `.vimrc`:
```
let s:opened_file_path = expand('%:p')
if s:opened_file_path =~ '\.mozilla/firefox/.*redmine'
    au BufRead,BufNewFile *.txt set filetype=redminewiki
endif
```
Then, when you launch Vim to edit a Redmine page (e.g. wiki or issue), a proper
file type will be selected automatically. Of course, this can be set up also
for other browser plugins, such as
[Vimperator](http://www.vimperator.org/vimperator). You just need to adjust the
regular expression matching `s:opened_file_path`.

Credits
=======

This syntax file is heavily based on the
[textile.vim](http://rubychan.de/share/textile.vim) syntax file by Kornelius
Kalnbach <korny@cYcnus.de>, 2006.
