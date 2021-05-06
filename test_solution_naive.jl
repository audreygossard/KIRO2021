include("parser.jl")
#include("solution.jl")
#include("naive_function.jl")


path = joinpath(".", "instances/A.json")
#path_write_sol = joinpath(".", "solution_naive/sol_S.txt")

dict, instance = read_instance(path)

trains = instance.trains
itineraires = instance.itineraires
voiesAQuai = instance.voiesAQuai
voiesEnLigne = instance.voiesEnLigne
contraintes = instance.contraintes

interdictions = dict["interdictionsQuais"]

nb_groupes = length(dict["trains"])
nb_trains = length(trains)

#contrainte 2
trains = contrainte2(trains, nb_groupes)
#contrainte 1

#write_solution(sol, path_write_sol)
