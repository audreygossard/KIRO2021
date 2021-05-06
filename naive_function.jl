
#affecte aux trains d'un groupe G le meme quai qt
function affecte_quai_train(qt, G)
  #N = nombre de train dans G
  N = length(G)
  for i=1:N
    G[i].voieAQuai = qt
  end
  return G
end

#affecte aux trains d'un groupe G le meme itineraire it
function affecte_itineraire_train(it, G)
  #N = nombre de train dans G
  N = length(G)
  for i=1:N
    G[i].itineraire = it
  end
  return G
end


#######################################
#
#            Gestion contrainte 2
#
#######################################

#on affecte a chaque train d'un groupe le meme quai que le premier train du groupe
function contrainte2(trains, NG, n)
  #NG = nombre de groupes
  for i=1:NG #pour  chaque groupe
    qt = trains[i][n].voieAQuai
    trains[i] = affecte_quai_train(qt, trains[i])
  end
  return trains
end

#######################################
#
#            Gestion contrainte 1
#
#######################################
#pour chaque train d'un groupe, si qt, lt n'est pas un itineraire on met qt = qvide
#sinon on met le premier itineraire qu'on trouve
function itineaire_admissible_groupe(G, I)
  itineaires_admissibles = true
  N = length(G)
  #N = nombre de train dans G
  #I = nombre d'itineraires
  for i=1:N
    bool = false #false si il n y a pas d'itineraire pour le train i
    for j=1:I
      if (itineraires[j].sensDepart == G[i].sensDepart && itineraires[j].voieEnLigne == G[i].voieEnLigne && itineraires[j].voieAQuai == G[i].voieAQuai)
        G[i].itineraire = itineraires[j].id
        bool = true
        break #on ne cherche plus d'autre itineraire pour ce train
      end
    end
    if !(bool) #on a trouve aucun itineraire
      itineraires_admissibles = false #on met tout le monde a it nul et qt nul
      break #on arrete de tout parcourir
    end
  end
  if !(itineaires_admissibles)
    G = affecte_quai_train("notAffected", G)
    G = affecte_itineraire_train(-1, G)
  end
  return G
end


function contrainte1(trains, NG, I)
  #NG = nombre de groupes
  for i=1:NG #pour  chaque groupe
    trains[i] = itineaire_admissible_groupe(trains[i], I)
  end
  return trains
end



#######################################
#
#            Gestion contrainte 3
#
#######################################

function voie_en_ligne(train, interdiction)
  liste_voies_ligne = interdiction["voiesEnLigne"]
  lt = train.voieEnLigne
  return lt in liste_voies_ligne
end

function types_Materiels(train, interdiction)
  liste_materiel = Set(interdiction["typesMateriels"])
  Materiel = Set(train.typesMateriels)
  return length(intersect(liste_materiel, Materiel)) > 0
end

function types_Circulation(train, interdiction)
  liste_circulation = interdiction["typesCirculation"]
  et = train.typeCirculation
  return et in liste_circulation
end

function quai_interdit(train, interdiction)
  qt = train.voieAQuai
  Qf = interdiction["voiesAQuaiInterdites"]
  bool = (qt in Qf)
  return bool
end

function contrainte3_groupe(G, F)
  admissible = true
  N = length(G)
  #N = nombre de train dans G
  #F = nombre d'interdictions
  for i=1:N
    for f=1:F
      interdiction = interdictions[f]
      if (voie_en_ligne(G[i], interdiction) || types_Materiels(G[i], interdiction) || types_Circulation(G[i], interdiction)) && quai_interdit(G[i], interdiction)
        #abort
        admissible = false
        break
      end
    end
    if admissible == false
      break
    end
  end
  if admissible == false
    G = affecte_itineraire_train(-1, G)
  end
  return G
end



function contrainte3(trains, NG, F)
  for i=1:NG
    trains[i] = contrainte3_groupe(trains[i], F)
  end
  return trains
end
