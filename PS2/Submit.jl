# include the Include.jl -
include("Include.jl")

# Step 1: load the reaction file 
path_to_compounds_file = joinpath(_PATH_TO_DATA, "Compounds.data")

# Step 2: parse the list of chemical compounds records in Compounds.data
compounds = read_compounds_file(path_to_compounds_file);

# Step 3: process each of the compounds, compute the composition dictionary and update the compound models
compounds = _recusiveCompoundModel(compounds);

# Step 4: print the updated compounds
for compound in compounds
    println(compound)
end