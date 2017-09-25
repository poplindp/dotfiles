### awesome dotfiles configuration

awesome_copycats is used as submodule

to be able to make modifications to rc.lua and keep them tracked by the parent repository a copy of rc.lua.template is made in parent directory.  Then a symbolic link is make inside awesome_copycats but this is ignored.

To update changes a diff between rc.lua and rc.lua.template is to be done after each update.
