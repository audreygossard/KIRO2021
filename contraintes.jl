include("instance.jl")

function contrainte_dico(contraintes::Vector{Vector{Int}}, trains::Vector{Vector{Train}})
	gros_dico =Dict()
	for g in 1:length(trains)
		groupe = trains[g]
		for i in 1:length(groupe)
			train = groupe[i]
			gros_dico[train.id] = []
		end
	end
	for c in 1:length(contraintes)
		contrainte = contraintes[c]
		a, index_train_1, c, d, e = contrainte
		vecteur_de_contrainte = gros_dico[index_train_1]
		push!(vecteur_de_contrainte, contrainte)
	end
	return gros_dico
end
