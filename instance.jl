include("Itineraire.jl")
include("Train.jl")
include("InterdictionQuais.jl")

struct Instance
    trains::Vector{Train}
    itineraires::Vector{Itineraire}
    voiesAQuai::Vector{String}
    voiesEnLigne::Vector{String}
    interdictionsQuais::Vector{InterdictionQuais}
    contraintes::Vector{Vector{Int}}

    Instance(; trains, itineraires, voiesAQuai, voiesEnLigne, interdicitonsQuais, contraintes) =
        new(trains, itineraires, voiesAQuai, voiesEnLigne, interdicitonsQuais, contraintes)
end
