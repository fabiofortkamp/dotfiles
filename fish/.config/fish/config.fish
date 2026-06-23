# Certain applications, such as Emacs and Matlab, seem to spawn shells
# that then complain about missing key bindings
# this is to bypass that and only have this setup on interactive shells
# see: https://github.com/fish-shell/fish-shell/issues/5372

# Load local (non-version-controlled) secrets, if present.
set -l fish_secrets "$__fish_config_dir/secrets.fish"
if test -f "$fish_secrets"
    source "$fish_secrets"
end

if status is-interactive
    # set up homebrew path

    if test (uname) = Darwin
        # add homebrew paths
        if test -d /opt/homebrew/bin
            fish_add_path -gP /opt/homebrew/bin
            fish_add_path -gP /opt/homebrew/sbin
        end
    end
    if test (uname) = Linux
        # add homebrew paths
        if test -d /home/linuxbrew/.linuxbrew/bin
            fish_add_path -gP /home/linuxbrew/.linuxbrew/bin
            fish_add_path -gP /home/linuxbrew/.linuxbrew/sbin
        end
    end

    fish_add_path -gP "$HOME/.local/bin"
    # create local dotfiles scripts dir
    fish_add_path -gP "$HOME/dotfiles/bin"

    # set vi keybindings
    set -g fish_key_bindings fish_vi_key_bindings

    # set up tmux-sessionizer keybindings
    bind \cs -M default "$HOME/dotfiles/bin/tmux-sessionizer"
    bind \cs -M insert "$HOME/dotfiles/bin/tmux-sessionizer"

    # zoxide config
    zoxide init fish | source

    # Set up fzf key bindings
    fzf --fish | source
    # and set up options for the fifc plugin, which overrides the tab key binding
    # to complete with fzf
    set -U fifc_fd_opts --hidden

    # Set up atuin
    atuin init fish --disable-up-arrow | source

    # add MATLAB and COMSOL to PATH
    # only macOS supported for not
    function add_to_path_if_exists
        for file in $argv
            if test -e $file
                fish_add_path -gP $file
            end
        end
    end

    add_to_path_if_exists /Applications/COMSOL63/Multiphysics/bin
    add_to_path_if_exists "/Applications/MATLAB_R2024b.app/bin"
    add_to_path_if_exists "/Applications/Blender.app/Contents/MacOS"


    # common variables
    set -gx XDG_CONFIG_HOME "$HOME/.config"
    set -gx XDG_DATA_HOME "$HOME/.local/share/"
    set -gx XDG_CACHE_HOME "$HOME/.cache/"
    set -gx TMP /tmp
    set -gx PYTEST_DEBUG_TEMPROOT /tmp
    set -gx XDG_RUNTIME_DIR "$TMP/run/$USER"
    mkdir -p $XDG_RUNTIME_DIR

    mise activate fish | source
    starship init fish | source

    set -gx EDITOR nvim

    # command overrides (alias preferred over abbr — these shadow existing commands)
    alias eza="eza --icons=automatic"
    alias ls="eza"
    alias l="eza -la"
    alias tree="eza --tree"

    # git abbreviations
    # stolen from the Oh-My-Zsh git plugin
    # https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
    # I've filtered out things that depended on functions
    abbr --add g 'git'
    abbr --add ga 'git add'
    abbr --add gaa 'git add --all'
    abbr --add gapa 'git add --patch'
    abbr --add gau 'git add --update'
    abbr --add gav 'git add --verbose'
    abbr --add gam 'git am'
    abbr --add gama 'git am --abort'
    abbr --add gamc 'git am --continue'
    abbr --add gamscp 'git am --show-current-patch'
    abbr --add gams 'git am --skip'
    abbr --add gap 'git apply'
    abbr --add gapt 'git apply --3way'
    abbr --add gbs 'git bisect'
    abbr --add gbsb 'git bisect bad'
    abbr --add gbsg 'git bisect good'
    abbr --add gbsn 'git bisect new'
    abbr --add gbso 'git bisect old'
    abbr --add gbsr 'git bisect reset'
    abbr --add gbss 'git bisect start'
    abbr --add gbl 'git blame -w'
    abbr --add gb 'git branch'
    abbr --add gba 'git branch --all'
    abbr --add gbd 'git branch --delete'
    abbr --add gbD 'git branch --delete --force'
    abbr --add gbm 'git branch --move'
    abbr --add gbnm 'git branch --no-merged'
    abbr --add gbr 'git branch --remote'
    abbr --add gco 'git checkout'
    abbr --add gcor 'git checkout --recurse-submodules'
    abbr --add gcb 'git checkout -b'
    abbr --add gcB 'git checkout -B'
    abbr --add gcp 'git cherry-pick'
    abbr --add gcpa 'git cherry-pick --abort'
    abbr --add gcpc 'git cherry-pick --continue'
    abbr --add gclean 'git clean --interactive -d'
    abbr --add gcl 'git clone --recurse-submodules'
    abbr --add gclf 'git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules'
    abbr --add gcam 'git commit --all --message'
    abbr --add gcas 'git commit --all --signoff'
    abbr --add gcasm 'git commit --all --signoff --message'
    abbr --add gcs 'git commit --gpg-sign'
    abbr --add gcss 'git commit --gpg-sign --signoff'
    abbr --add gcssm 'git commit --gpg-sign --signoff --message'
    abbr --add gcmsg 'git commit --message'
    abbr --add gcsm 'git commit --signoff --message'
    abbr --add gc 'git commit --verbose'
    abbr --add gca 'git commit --verbose --all'
    abbr --add 'gca!' 'git commit --verbose --all --amend'
    abbr --add 'gcan!' 'git commit --verbose --all --no-edit --amend'
    abbr --add 'gcans!' 'git commit --verbose --all --signoff --no-edit --amend'
    abbr --add 'gcann!' 'git commit --verbose --all --date=now --no-edit --amend'
    abbr --add 'gc!' 'git commit --verbose --amend'
    abbr --add gcn 'git commit --verbose --no-edit'
    abbr --add 'gcn!' 'git commit --verbose --no-edit --amend'
    abbr --add gcf 'git config --list'
    abbr --add gd 'git diff'
    abbr --add gdca 'git diff --cached'
    abbr --add gdcw 'git diff --cached --word-diff'
    abbr --add gds 'git diff --staged'
    abbr --add gdw 'git diff --word-diff'
    abbr --add glg 'git log --stat'
    abbr --add glgp 'git log --stat --patch'
    abbr --add gignored 'git ls-files -v | grep "^[[:lower:]]"'
    abbr --add gfg 'git ls-files | grep'
    abbr --add gm 'git merge'
    abbr --add gma 'git merge --abort'
    abbr --add gmc 'git merge --continue'
    abbr --add gms 'git merge --squash'
    abbr --add gmff 'git merge --ff-only'
    abbr --add gmtl 'git mergetool --no-prompt'
    abbr --add gmtlvim 'git mergetool --no-prompt --tool=vimdiff'
    abbr --add gl 'git pull'
    abbr --add gpr 'git pull --rebase'
    abbr --add gprv 'git pull --rebase -v'
    abbr --add gpra 'git pull --rebase --autostash'
    abbr --add gp 'git push'
    abbr --add gpu 'git push origin HEAD'
    abbr --add gpv 'git push --verbose'
    abbr --add gpoat 'git push origin --all && git push origin --tags'
    abbr --add gsts 'git stash show --patch'
    abbr --add gstu 'git stash --include-untracked'
    abbr --add gst 'git status'
    abbr --add gss 'git status --short'
    abbr --add gsb 'git status --short --branch'
    abbr --add gsi 'git submodule init'
    abbr --add gsu 'git submodule update'
    abbr --add gsd 'git svn dcommit'
    abbr --add gsr 'git svn rebase'
    abbr --add gsw 'git switch'
    abbr --add gswc 'git switch --create'
    abbr --add gta 'git tag --annotate'
    abbr --add gts 'git tag --sign'
    abbr --add gtv 'git tag | sort -V'
    abbr --add gignore 'git update-index --assume-unchanged'
    abbr --add gunignore 'git update-index --no-assume-unchanged'
    abbr --add gwch 'git whatchanged -p --abbrev-commit --pretty=medium'
    abbr --add gwt 'git worktree'
    abbr --add gwta 'git worktree add'
    abbr --add gwtls 'git worktree list'
    abbr --add gwtmv 'git worktree move'
    abbr --add gwtrm 'git worktree remove'

    # BEGIN opam configuration
    # This is useful if you're using opam as it adds:
    #   - the correct directories to the PATH
    #   - auto-completion for the opam binary
    # This section can be safely removed at any time if needed.
    test -r '/Users/fapfor/.opam/opam-init/init.fish' && source '/Users/fapfor/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true
    # END opam configuration
end
