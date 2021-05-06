
mutable struct Train
    id::Int
    sensDepart::Bool
    voieEnLigne::String
    voieAQuai::String
    typeCirculation::String
    dateHeure::String
    typesMateriels::Vector{String}
	groupe::Int
	itineraire::Int

    Train(; id, sensDepart, voieEnLigne, voieAQuai, typeCirculation, dateHeure, typesMateriels, groupe, itineraire) =
        new(id, sensDepart, voieEnLigne, voieAQuai, typeCirculation, dateHeure, typesMateriels, groupe, -1)
end

function train_into_dict(train::Train)::Dict
	if train.itineraire == -1
		itineraire = "notAffected"
		voieAQuai = "notAffected"
	else
		itineraire = string(train.itineraire)
		voieAQuai = train.voieAQuai
	end
    dico = Dict("voieAQuai" => voieAQuai, "itineraire" => itineraire)
	return dico
end
