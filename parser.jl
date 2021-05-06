using JSON
include("Instance.jl")


function read_instance(path::String)#::Instance
	dict = JSON.parse(open(path))

	trains = Vector{Train}()
	itineraires = Vector{Itineraire}()
	voiesAQuai = Vector{String}()
	voiesEnLigne = Vector{String}()
	interdictionsQuais = Vector{InterdictionQuais}()
	contraintes = Vector{Vector{Int}}()

	for ltrain in dict["trains"]
		train = ltrain[1]
		push!(trains,
		Train(id=train["id"], sensDepart=train["sensDepart"],
		      voieEnLigne=train["voieEnLigne"], voieAQuai=train["voieAQuai"],
			  typeCirculation=train["typeCirculation"], dateHeure=train["dateHeure"],
			  typesMateriels=train["typesMateriels"], itineraire=-1))
	end

	for itineraire in dict["itineraires"]
		push!(itineraires,
		Itineraire(id=itineraire["id"], sensDepart=itineraire["sensDepart"],
		 		   voieEnLigne=itineraire["voieEnLigne"], voieAQuai=itineraire["voieAQuai"]))
	end

	voiesAQuai = dict["voiesAQuai"]

	voieEnLigne = dict["voiesEnLigne"]

	for interdictionQuais in dict["interdictionsQuais"]
		push!(interdictionsQuais,
		InterdictionQuai(voiesAQuaiInterdites=interdictionQuais["voiesAQuaiInterdites"], voiesEnLigne=interdictionQuais["voiesEnLigne"],
						 typesMateriels=interdictionQuais["typesMateriels"], typesCirculation=interdictionQuais["typesCirculation"]))
	end

	contraintes = dict["contraintes"]

	instance = Instance(trains=trains, itineraires=itineraires, voiesAQuai=voiesAQuai,
	voiesEnLigne=voiesEnLigne, interdictionsQuais=interdictionsQuais, contraintes=contraintes)
	return instance
end
