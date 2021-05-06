struct Train
    id::Int
    sensDepart::Bool
    voieEnLigne::String
    voieAQuai::String
    typeCirculation::String
    dateHeure::String
<<<<<<< Updated upstream
    typesMateriels::String
	itineraire::Int
=======
    typesMateriels::Vector{String}
>>>>>>> Stashed changes

    Train(; id, sensDepart, voieEnLigne, voieAQuai, typeCirculation, dateHeure, typesMateriels) =
        new(id, sensDepart, voieEnLigne, voieAQuai, typeCirculation, dateHeure, typesMateriels, -1)
end

function train_into_dict(train::Train)::Dict
	if train.itineraire == -1
		itineraire = "notAffected"
	else
		itineraire = string(train.itineraire)
	end
    dico = Dict("voieAQuai" => train.voieAQuai, "itineraire" => itineraire)
	return dico
end
