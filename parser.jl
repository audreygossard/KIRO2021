using JSON
include("Instance.jl")


function read_instance(path::String)#::Instance
	dict = JSON.parse(open(path))

	trains = Vector{Vector{Train}}()
	itineraires = Vector{Itineraire}()
	voiesAQuai = Vector{String}()
	voiesEnLigne = Vector{String}()
	interdictionsQuais = Vector{InterdictionQuais}()
	contraintes = Vector{Vector{Int}}()

	g=0
	for groupe_trains in dict["trains"]
		g+=1
		trains_list = Vector{Train}()
		for train in groupe_trains
			push!(trains_list,
			Train(id=train["id"], sensDepart=train["sensDepart"],
			      voieEnLigne=train["voieEnLigne"], voieAQuai=train["voieAQuai"],
				  typeCirculation=train["typeCirculation"], dateHeure=train["dateHeure"],
				  typesMateriels=train["typesMateriels"], groupe=g, itineraire=-1))
		end
		push!(trains, trains_list)
	end

	for itineraire in dict["itineraires"]
		push!(itineraires,
		Itineraire(id=itineraire["id"], sensDepart=itineraire["sensDepart"],
		 		   voieEnLigne=itineraire["voieEnLigne"], voieAQuai=itineraire["voieAQuai"]))
	end

	voiesAQuai = dict["voiesAQuai"]

	voieEnLigne = dict["voiesEnLigne"]

#=
	for interdictionQuais in dict["interdictionsQuais"]
		println(interdictionQuais["voiesAQuaiInterdites"])
		println(interdictionQuais["voiesEnLigne"])
		println(interdictionQuais["typesMateriels"])
		println(interdictionQuais["typesCirculation"])
		push!(interdictionsQuais,
		InterdictionQuais(voiesAQuaiInterdites=interdictionQuais["voiesAQuaiInterdites"], voiesEnLigne=interdictionQuais["voiesEnLigne"],
						 typesMateriels=interdictionQuais["typesMateriels"], typesCirculation=interdictionQuais["typesCirculation"]))
	end
=#
	contraintes = dict["contraintes"]

	#instance = Instance(trains=trains, itineraires=itineraires, voiesAQuai=voiesAQuai,
	#voiesEnLigne=voiesEnLigne, interdictionsQuais=interdictionsQuais, contraintes=contraintes)
	instance = Instance(trains=trains, itineraires=itineraires, voiesAQuai=voiesAQuai,
	voiesEnLigne=voiesEnLigne, contraintes=contraintes)
	return dict, instance
end
