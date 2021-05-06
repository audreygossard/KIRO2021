include("train.jl")

function write_solution(path::String, instance_name::String, trains::Vector{Vector{Train}})
	gros_dico = Dict()
	for g in 1:length(trains)
		groupe = trains[g]
		for i in 1:length(groupe)
	        train = groupe[i]
			gros_dico[string(train.id)] = train_into_dict(train)
		end
    end
	# pass data as a json string (how it shall be displayed in a file)
	stringdata = JSON.json(gros_dico)
	file_name = joinpath(path, "solutions/",instance_name)
	open(file_name, "w") do f
	     write(f, stringdata)
	end
	return stringdata
end
