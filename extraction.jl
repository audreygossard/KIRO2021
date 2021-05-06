include("Train.jl")
function extraire(trains::Vector{Vector{Train}}, taille_min::Int)
	groupes_trop_petits_extraits = Vector{Vector{Train}}()
	groupes_trop_petits = Vector{Vector{Train}}()
	groupes_deja_affectes = Vector{Vector{Train}}()
    for g in 1:length(trains)
		groupe = trains[g]
        train = groupe[i]
		if train.itineraire ==-1 # Pas d'itinéraire affecté au groupe
			taille_groupe = length(groupe)
			if taille_groupe >= taille_min
				push!(groupe, groupes_extraits)
			else # groupe trop petit
				push!(groupe,groupes_trop_petits)
			end
		else # Le groupe a déjà un itinéraire
			push!(groupe, groupes_deja_affectes)
		end
    end
	return groupes_extraits, groupes_trop_petits, groupes_deja_affectes
end
