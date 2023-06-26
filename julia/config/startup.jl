using InteractiveUtils

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

ENV["JULIA_EDITOR"] = "lvim"

InteractiveUtils.define_editor(
    r"lvim", wait=true) do cmd, path, line
    `$cmd +$line $path`
end
