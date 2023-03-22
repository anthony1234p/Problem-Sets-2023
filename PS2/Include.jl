# setup paths -
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src")
const _PATH_TO_DATA = joinpath(_ROOT, "data")

using DataStructures


include(joinpath(_PATH_TO_SRC, "Types.jl"))
include(joinpath(_PATH_TO_SRC, "Factory.jl"))
include(joinpath(_PATH_TO_SRC, "Files.jl"))
include(joinpath(_PATH_TO_SRC, "Parser.jl"))

# load external packages -
# TODO: Fill in any external requirements 

# load my codes -
# TODO: Fill in the include statements with your files