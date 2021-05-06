function naif(trains, k::int)
    #contrainte 2
    trains = contrainte2(trains, nb_groupes, n=k)
    #contrainte 1
    trains = contrainte1(trains, nb_groupes, nb_itineraires)
    #contrainte 1
    trains = contrainte3(trains, nb_groupes, nb_interdictions)
    return trains
end
