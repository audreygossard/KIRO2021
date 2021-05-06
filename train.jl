struct Train
    id::Int
    sensDepart::Bool
    voieEnLigne::String
    voieAQuai::String
    typeCirculation::String
    dateHeure::String
    typesMateriels::String

    Instance(; id, sensDepart, voieEnLigne, voieAQuai, typeCirculation, dateHeuren typesMateriels) =
        new(id, sensDepart, voieEnLigne, voieAQuai, typeCirculation, dateHeuren typesMateriels)
end
