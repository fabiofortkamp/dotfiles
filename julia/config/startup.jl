
# ensuring packages loaded in startup are installed
import Pkg
let
    pkgs = ["Revise", "OhMyREPL", "DrWatson", "AbbreviatedStackTraces"]
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

# Exit with :q and restart with :r
pushfirst!(REPL.repl_ast_transforms, function (ast::Union{Expr,Nothing})
    function toplevel_quotenode(ast, s)
        return (Meta.isexpr(ast, :toplevel, 2) && ast.args[2] === QuoteNode(s)) ||
               (Meta.isexpr(ast, :toplevel) && any(x -> toplevel_quotenode(x, s), ast.args))
    end
    if toplevel_quotenode(ast, :q)
        exit()
    elseif toplevel_quotenode(ast, :r)
        argv = Base.julia_cmd().exec
        opts = Base.JLOptions()
        if opts.project != C_NULL
            push!(argv, "--project=$(unsafe_string(opts.project))")
        end
        if opts.nthreads != 0
            push!(argv, "--threads=$(opts.nthreads)")
        end
        # @ccall execv(argv[1]::Cstring, argv::Ref{Cstring})::Cint
        ccall(:execv, Cint, (Cstring, Ref{Cstring}), argv[1], argv)
    end
    return ast
end)



ENV["JULIA_EDITOR"] = "code-insiders"

# make error messages shorter
using AbbreviatedStackTraces
ENV["JULIA_STACKTRACE_MINIMAL"] = true

# make REPL colorful
using OhMyREPL
colorscheme!("BoxyMonokai256")
enable_autocomplete_brackets(true)
OhMyREPL.Passes.RainbowBrackets.activate_256colors()
