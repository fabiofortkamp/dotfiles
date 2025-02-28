
# ensuring packages loaded in startup are installed
import Pkg
let
    pkgs = ["Revise", "OhMyREPL", "DrWatson"]
    for pkg in pkgs
        if Base.find_package(pkg) === nothing
            Pkg.add(pkg)
        end
    end
end

try
    @eval using Revise
catch e
    @warn "Error initializing Revise" exception = (e, catch_backtrace())
end

atreplinit() do repl
    try
        @eval using OhMyREPL
    catch e
        @warn "error while importing OhMyREPL" e
    end
end

# some contributions from Eduardo Alves below:

import REPL

# make REPL colorful
using OhMyREPL
colorscheme!("BoxyMonokai256")
enable_autocomplete_brackets(true)
OhMyREPL.Passes.RainbowBrackets.activate_256colors()
