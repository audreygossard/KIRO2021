struct Itineraire
    id::Int
    sensDepart::Bool
    voieEnLigne::String
    voieAQuai::String

    Itineraire(; id, sensDepart, voieEnLigne, voieAQuai) = new(id, sensDepart, voieEnLigne, voieAQuai)
end

function Base.show(io::IO, iti::Itineraire)
    str = "Itineraire : $(iti.id), "
    str *= "sensDepart : $(iti.sensDepart), "
    str *= "voieEnLigne : $(iti.voieEnLigne), "
    str *= "voieAQuai : $(iti.voieAQuai)"
    print(io, str)
end
