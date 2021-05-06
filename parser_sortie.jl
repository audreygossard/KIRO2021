include("train.jl")

function write_solution(file_name::String, trains::Vector{Train})
	gros_dico = Dict()
	for i in 1:length(trains)
        train = trains[i]
		gros_dico[string(train.id)] = train_into_dict(train)
    end
	# pass data as a json string (how it shall be displayed in a file)
	stringdata = JSON.json(gros_dico)
	open(file_name, "w") do f
	     write(f, stringdata)
	end
	return nothing
end
