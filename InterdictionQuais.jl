struct InterdictionQuais
    voiesAQuaiInterdites::Vector{String}
    voiesEnLigne::Vector{String}
    typesMateriels::Vector{Int}
    typesCirculation::Vector{String} # Ou Int ?
    InterdictionQuai(; voiesAQuaiInterdites, voiesEnLigne, typesMateriels, typesCirculation) = new(voiesAQuaiInterdites, voiesEnLigne, typesMateriels, typesCirculation)
end

function Base.show(io::IO, interdic::InterdictionQuais)
    str = "InterdictionQuais\n"
    str *= "voiesAQuaiInterdites :\n"
    for i in 1:length(interdic.voiesAQuaiInterdites)
        str *= "       $(interdic.voiesAQuaiInterdites[i])\n"
    end
    str *= "voiesEnLigne : \n"
    for i in 1:length(interdic.voiesEnLigne)
        str *= "       $(interdic.voiesEnLigne[i])\n"
    end
    str *= "typesMateriels : \n"
    for i in 1:length(interdic.typesMateriels)
        str *= "       $(interdic.typesMateriels[i])\n"
    end
    str *= "typesCirculation : \n"
    for i in 1:length(interdic.typesCirculation)
        str *= "       $(interdic.typesCirculation[i])\n"
    end
    print(io, str)
end
