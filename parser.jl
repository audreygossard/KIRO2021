# MODELE POUR COMPLETER DIRECTEMENT PLUS VITE
# CONTIENT:
# - structure Instance
# - function lire instance (et renvoit instance)


struct Instance
    D::Int  #duree simulation
    I::Int  #nb intersection
    S::Int  #nb streets
    V::Int  #nb cars
    F::Int  #nb bonus points for cars reaching their destination

    streets::Vector{Street}
    paths::Vector{Path}

    Instance(; D, I, S, V, F, streets, paths) =
        new(D, I, S, V, F, streets, paths)
end


function read_instance(path::String)::Instance
	data = open(path) do file
		readlines(file)
	end

	dims = split(data[1], " ")
	V = parse(Int, dims[2])
	...
	...

	return Instance(V = ..., ... = ...,  )
end
