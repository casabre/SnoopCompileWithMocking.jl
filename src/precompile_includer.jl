should_precompile =  false


# Don't edit the following! Instead change the script for `snoop_bot`.
ismultios = false
ismultiversion = false
# precompile_enclosure
@static if !should_precompile
    # nothing
elseif !ismultios && !ismultiversion
    include("../deps/SnoopCompile/precompile/precompile_SnoopCompileWithMocking.jl")
    _precompile_()
else
    
end # precompile_enclosure
