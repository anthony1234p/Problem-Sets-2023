"""
    build_data_matrix(data::DataFrame) --> Array{Float64,2}

This builds an array and fills it with ones. It then replaces the second column of the array with the independent variable S from the data
"""

function build_data_matrix(data::DataFrame)::Array{Float64,2}
    # initialize data matrix
    S = data[:,:S]
    x = ones(100,2)
    for i in 1:100 
        x[i,2] = 1 ./S[i]
    end
    return x
end

"""
    build_output_vector(data::DataFrame) --> Array{Float64,1}

Makes the inverse v vector
"""
function build_output_vector(data::DataFrame)::Array{Float64,1}
    V1 = data[:,:v1] 
    V2 = data[:,:v2]
    V3 = data[:,:v3]

    V = ones(100)

    Vavg = (V1 + V2 + V3)/3

    for i in 1:100
     V[i] = 1 ./Vavg[i]
    end
    return V
end

"""
    build_error_distribution(residuals::Array{Float64,1}) -> Normal

It builds the error Distributions
"""
function build_error_distribution(residuals::Array{Float64,1})::Normal

    # initialize -
    μ = 0.0; # default value, replace with your value
    σ = 0.0; # default value, replace with your value

    μ = mean(residuals);
    σ = std(residuals);

    # return -
    return Normal(μ, σ);
end
