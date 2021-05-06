include("parser.jl")
#include("solution.jl")
include("naive_function.jl")
include("parser_sortie.jl")


path = joinpath(".", "instances/A.json")
path_write_sol = joinpath(".", "solution_naive")

dict, instance = read_instance(path)

trains = instance.trains
itineraires = instance.itineraires
voiesAQuai = instance.voiesAQuai
voiesEnLigne = instance.voiesEnLigne
contraintes = instance.contraintes

interdictions = dict["interdictionsQuais"]

nb_groupes = length(dict["trains"])
nb_trains = 0
for groupe_trains in trains
    global nb_trains += length(groupe_trains)
end
nb_itineraires = length(itineraires)
nb_interdictions = length(interdictions)
println(nb_interdictions)

#contrainte 2
trains = contrainte2(trains, nb_groupes)
#contrainte 1
#est ce que ça fonctionne vraiment??
trains = contrainte1(trains, nb_groupes, nb_itineraires)
#contrainte3
trains = contrainte3(trains, nb_groupes, nb_interdictions)



write_solution(path_write_sol, "A", trains)
