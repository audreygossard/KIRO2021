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
				push!(groupes_extraits, groupe)
			else # groupe trop petit
				push!(groupes_trop_petits, groupe)
			end
		else # Le groupe a déjà un itinéraire
			push!(groupes_deja_affectes, groupe)
		end
    end
	return groupes_extraits, groupes_trop_petits, groupes_deja_affectes
end


function regrouper(all_listes::Vector{Vector{Vector{Train}}})::Vector{Vector{Train}}
	all_groups = Vector{Vector{Train}}()
	for indice_liste in 1:length(all_listes)
		liste = all_listes[indice_liste] #Vector{Vector{Train}
		for g in 1:length(trains)
			groupe = trains[g]
			push!(all_groups, groupe)
	    end
	end
	return all_groups
end
