module SnoopCompileWithMocking

using Mocking

export make_fancy

function make_fancy(normal)::Nothing
    @mock fancynize(normal)
end

function fancynize(normal)::Nothing
    println("This is now awesome: $normal")
end

include("precompile_includer.jl")
end # module SnoopCompileWithMocking