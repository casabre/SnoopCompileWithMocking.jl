using Test
using TestSetExtensions
using Mocking
using SnoopCompileWithMocking


@testset ExtendedTestSet "Not using mocking" begin
    @test make_fancy("SnoopCompile") === nothing
end

@testset ExtendedTestSet "Using mocking" begin
    fancy = "";
    fancynize_patch = @patch SnoopCompileWithMocking.fancynize(normal::AbstractString) = begin
        fancy = "This is now awesome: $normal";
        nothing
    end
    Mocking.activate()
    apply(fancynize_patch) do 
        @test make_fancy("SnoopCompile") === nothing
    end
    Mocking.deactivate()
    @test fancy == "This is now awesome: SnoopCompile"
end