# TODO: Fill me in with your program to compute the uknown model parameters from the data
include("Include.jl")


# load the data -
path_to_data_file = joinpath(_PATH_TO_DATA,"PS5-dataset-w-repeats.csv")

data = loaddataset(path_to_data_file) 

x = build_data_matrix(data)

y = build_output_vector(data)

Xᵀ = transpose(x)

Xinv = inv(Xᵀ*x)*Xᵀ


# beta Calculation
β = Xinv*y


#residual Calculation
r = y - x*β
ϵ = build_error_distribution(r)


returns = length(r)
samples = 10000
parameters = 2
simulated_parameter_values = Array{Float64,2}(undef,samples,2)

for s in 1:samples
    βᵣ = β - Xinv*rand(ϵ,returns)
    for p in 1:parameters
        simulated_parameter_values[s,p] = βᵣ[p]
    end
end









