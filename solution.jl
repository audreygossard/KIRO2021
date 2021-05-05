# MODELE POUR COMPLETER ET TOUT CHANGER
# CONTIENT:
# - structures solution
# - fonction ecriture solution


struct Sol # CHANGER NOM
    A::Int  #nb intersections
    intersections::Vector{Intersection}

    Schedule(; A, intersections) = new(A, intersections)
end


#fonctions de conversion structure vers string pour l'ecriture de la solution
function Base.string(light::Light)::String
    street = light.street
    T = light.T
    str = street * " $T"
    return str
end


function Base.string(intersection::Intersection)::String
    i = intersection.i
    E = intersection.E
    lights = intersection.lights
    str = "$(i)" * "\n" * "$E"
    for light in intersection.lights
        str *= "\n" * string(light)
    end
    return str
end


function Base.string(schedule::Schedule)::String
    A = schedule.A
    str = "$A"
    for intersection in schedule.intersections
        str *= "\n" * string(intersection)
    end
    return str
end


function write_sol(sol::nom_struct_sol, path::String)::Bool
	open(path, "w") do file
        write(file, string(sol))
    end
    return true
end
