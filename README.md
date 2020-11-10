# SnoopCompileWithMocking.jl

This repository is just intended as a example project using Mocking in unit tests in conjunction with SnoopCompile.

## Execution of SnoopCompileBot

Running SnoopCompileBot on the project leads to the following error

```julia-repl
[ Info: Processsing the generated precompile signatures
m = (::var"##fancynize_patch#253#2")(normal::AbstractString) in Main at /home/carsten/SnoopCompileWithMocking.jl/test/runtests.jl:13
m.name = Symbol("##fancynize_patch#253#2")
ERROR: UndefVarError:  not defined
Stacktrace:
 [1] handle_kwbody(::Module, ::Method, ::Array{String,1}, ::Type{T} where T, ::String; check_eval::Bool) at /home/carsten/.julia/packages/SnoopCompile/aokSn/src/parcel_snoopi.jl:196
 [2] parcel(::Array{Tuple{Float64,Core.MethodInstance},1}; subst::Array{Pair{Union{Regex, AbstractChar, AbstractString},Union{Regex, AbstractChar, AbstractString}},1}, exclusions::Array{Union{Regex, AbstractChar, AbstractString},1}, remove_exclusions::Bool, check_eval::Bool, blacklist::Nothing, remove_blacklist::Nothing) at /home/carsten/.julia/packages/SnoopCompile/aokSn/src/parcel_snoopi.jl:292
 [3] top-level scope at none:22
ERROR: failed process: Process(`julia --project=@. -e "
    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:4 =#
    using SnoopCompile
    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:6 =#
    data = #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:6 =# @snoopi(tmin = 0.0, begin
                #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:7 =#
                begin
                    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:138 =#
                    using SnoopCompileWithMocking
                    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:139 =#
                    include(\"/home/carsten/SnoopCompileWithMocking.jl/test/runtests.jl\")
                end
            end);
    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:27 =#
    packageSym = Symbol(\"SnoopCompileWithMocking\")
    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:30 =#
    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:30 =# @info \"Processsing the generated precompile signatures\"
    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:32 =#
    using SnoopCompile
    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:35 =#
    pc = SnoopCompile.parcel(data; subst = Pair{Union{Regex, AbstractChar, AbstractString},Union{Regex, AbstractChar, AbstractString}}[], exclusions = Union{Regex, AbstractChar, AbstractString}[], check_eval = true)
    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:36 =#
    if !(haskey(pc, packageSym))
        #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:37 =#
        #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:37 =# @error \"no precompile signature is found for SnoopCompileWithMocking. Don't load the package before snooping. Restart your Julia session.\"
    end
    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:39 =#
    onlypackage = Dict(packageSym => sort(pc[packageSym]))
    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:40 =#
    SnoopCompile.write(\"/home/carsten//SnoopCompileWithMocking.jl/deps/SnoopCompile/precompile\", onlypackage)
    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:41 =#
    #= /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:41 =# @info \"precompile signatures were written to /home/carsten//SnoopCompileWithMocking.jl/deps/SnoopCompile/precompile\"
;"`, ProcessExited(1)) [1]

Stacktrace:
 [1] pipeline_error at ./process.jl:525 [inlined]
 [2] run(::Cmd; wait::Bool) at ./process.jl:440
 [3] run(::Cmd) at ./process.jl:438
 [4] top-level scope at /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:120
 [5] eval at ./boot.jl:331 [inlined]
 [6] #snoop_bot#9 at /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:195 [inlined]
 [7] snoop_bot(::BotConfig, ::Module) at /home/carsten/.julia/packages/SnoopCompileBot/vP6Ij/src/snoop_bot.jl:194 (repeats 2 times)
 [8] top-level scope at /home/carsten/SnoopCompileWithMocking.jl/deps/SnoopCompile/snoop_bot.jl:3
 [9] include(::String) at ./client.jl:457
 [10] top-level scope at REPL[4]:1
 ```
 