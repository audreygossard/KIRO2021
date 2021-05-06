include("parser.jl")
#include("solution.jl")
include("naive_function.jl")
include("naif_param_n.jl")
include("extraction.jl")
include("parser_sortie.jl")


path = joinpath(".", "instances/NS.json")
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

trains = naif(trains, n=1)
gp_extraits, gp_trop_petits, gp_deja_affectes = extraire(trains, 2)
gp_extraits = naif(gp_extraits, n=2)
nouv_trains = Vector{Vector{Vector{Train}}}()
push!(nouv_trains, grp_extraits)
push!(nouv_trains, grp_trop_petits, grp_deja_affectes)
trains = regrouper(nouv_trains)

write_solution(path_write_sol, "NS.json", trains);
