function naif(trains, k::Int)
    nb_grp = length(trains)
    #contrainte 2
    trains = contrainte2(trains, nb_grp, k)
    #contrainte 1
    trains = contrainte1(trains, nb_grp, nb_itineraires)
    #contrainte 1
    trains = contrainte3(trains, nb_grp, nb_interdictions)
    return trains
end
