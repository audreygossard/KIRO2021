struct Train
    id::Int
    sensDepart::Bool
    voieEnLigne::String
    voieAQuai::String
    typeCirculation::String
    dateHeure::String
    typesMateriels::String

    Train(; id, sensDepart, voieEnLigne, voieAQuai, typeCirculation, dateHeure, typesMateriels) =
        new(id, sensDepart, voieEnLigne, voieAQuai, typeCirculation, dateHeure, typesMateriels)
end
