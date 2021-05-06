include("parser.jl")
#include("solution.jl")
include("naive_function.jl")
include("naif_param_n.jl")
include("extraction.jl")
include("parser_sortie.jl")


path = joinpath(".", "instances/PE.json")
path_write_sol = joinpath(".", "solution_naive2")

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
