"""
    compound_compositions()

Parses the chemical compositions of the compounds in the data file and returns a dictionary with the
compound names as keys and their compositions as values.

Args:
    None

Returns:
    A dictionary with the compound names as keys and their compositions as values.
"""

function compound_compositions()::Dict{String, Dict{Char, Int}}
    # Define the path to the data file containing the compounds
    path = "data/Compounds.data"

    # Read in the compounds from the data file
    compounds = read_compounds_file(path)

    # Create an empty dictionary to store the compositions with the compound names as keys
    compound_compositions = Dict{String, Dict{Char, Int}}()

    # Loop over each compound and parse its chemical composition
    for (name, model) in compounds
        composition = Dict{Char, Int}()

        # Loop over each character in the formula string
        i = 1
        while i <= length(model.compound)
            char = model.compound[i]

            # Check if the character is a letter
            if isletter(char)
                # If it is a letter, find the end of the element by looking for the next letter
                j = i + 1
                while j <= length(model.compound) && !isletter(model.compound[j])
                    j += 1
                end

                # Extract the element from the formula string
                element = model.compound[i:j-1]

                # Find the count for the current element
                count_start = j
                while count_start <= length(model.compound) && isdigit(model.compound[count_start])
                    count_start += 1
                end

                # Parse the count from the formula string
                count = parse(Int, model.compound[j:count_start-1])

                # Add the count for the element to the composition dictionary
                # Use get() to retrieve the current count for the element, or 0 if it does not yet exist
                # Add the parsed count to the current count for the element and store the result in the dictionary
                composition[element[1]] = get(composition, element[1], 0) + count

                # Update the loop variable to skip over the count for the current element
                i = count_start - 1
            end

            # Move to the next character in the formula string
            i += 1
        end

        # Store the composition for the current compound in the compound_compositions dictionary
        compound_compositions[name] = composition
    end

    return compound_compositions
end
