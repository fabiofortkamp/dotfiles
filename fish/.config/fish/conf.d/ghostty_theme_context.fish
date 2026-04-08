function __ghostty_theme_context_apply
    if not status is-interactive
        return
    end

    set -l helper "$HOME/dotfiles/bin/ghostty-theme-context"
    if not test -x "$helper"
        return
    end

    "$helper" apply "$PWD" >/dev/null 2>&1
end

function __ghostty_theme_context_on_pwd --on-variable PWD
    __ghostty_theme_context_apply
end

__ghostty_theme_context_apply
