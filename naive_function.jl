
#affecte aux trains d'un groupe G le meme quai qt
function affecte_quai_train(qt, G)
  #N = nombre de train dans G
  N = length(G)
  for i=1:N
    G[i].voieAQuai = gt
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
function contrainte2(trains, NG)
  #NG = nombre de groupes
  for i=1:NG #pour  chaque groupe
    qt = trains[i, 1].voieAQuai
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
        G[i].itineraire = j
        bool = true
        break #on ne cherche plus d'autre itineraire pour ce train
      end
    end
    if not(bool) #on a trouve aucun itineraire
      itineraires_admissibles = false #on met tout le monde a it nul et qt nul
      break #on arrete de tout parcourir
    end
  end
  if not(itineaires_admissibles)
    G = affecte_quai_train("NotAffected", G)
    G = affecte_itineraire_train(-1, G)
  end
  return G
end


function contrainte1(trains, NG)
  #NG = nombre de groupes
  for i=1:NG #pour  chaque groupe
    trains[i] = itineaire_admissible_groupe(trains[i])
  end
  return trains
end



#######################################
#
#            Gestion contrainte 3
#
#######################################

function voie_en_ligne(train, interdiction)
  interdiction = interdictions[f]["key"]
  liste_voies_ligne = interdictionsQuais[f].voiesEnLigne
  lt = train.voieEnLigne
  return lt in liste_voies_ligne
end

function types_Materiels(train, f)
  liste_materiel = Set(interdictionsQuais[f].typesMateriels)
  Materiel = Set(train.typesMateriels)
  return intersect(liste_materiel, Materiel).size() > 0
end

function types_Circulation(train, f)
  liste_circulation = interdictionsQuais[f].typesCirculation
  et = train.typeCirculation
  return et in liste_circulation
end

function quai_interdit(train, f)
  qt = train.voieAQuai
  Qf = interdictionsQuais[f].voiesAQuaiInterdites
  retunr qt in Qf
end

function contrainte3_groupe(G)
  admissible = true
  N = length(G)
  #N = nombre de train dans G
  #F = nombre d'interdictions
  for i=1:N
    for f=1:F
      interdiction = interdictions[f]
      if (voie_en_ligne(G[i], interdiction) || types_Materiels(G[i], interdiction) || types_Circulation(G[i], interdiction))
        if quai_interdit(G[i], interdiction)
          #abort
          admissible = false
          break
        end
    end
    if admissile == False
      break
    end
  end
  if admissible == false
    G = affecte_quai_train("Notaffected", G)
  end
  return G
end


function contrainte3(trains)
  for i=1:NG
    trains[i] = contrainte3_groupe(trains[i])
  end
  return trains
end
