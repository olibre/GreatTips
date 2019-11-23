 
Pour extraire une grande quantité de données à partir d'Elasticsearch :

1. paramètres `from` and `page`
2. API `scroll`
3. paramètre `search_after`

La première solution est limitée par le paramètre `index.max_result_window` (default 10000).
Car plus on va augmenter la valeur de from moins ça sera efficace.
Donc ce n'est pas performant pour des grands jeux de données et c'est pour cela qu'il y a une limite fixée.

Pour la seconde solution, on crée un contexte de recherche sur le serveur qui n'inclura pas les modifications
qui sont faites sur l'index pendant le parcours des résultats.
Cela implique donc des ressources supplémentaires sur le serveur.
Le nombre de contexte de recherche est donc limité en nombre et dans le temps (timeout).
Cela peut être embêtant si l'on souhaite faire une reprise de la lecture d'une recherche en cas de crash car le contexte de recherche aura été détruit.
Par contre, on peut paralléliser la lecture à l'aide des paramètres de `slice`.

La dernière solution (`search_after`) ne crée pas de contexte de recherche mais permet de parcourir les résultats en spécifiant le dernier document lu.
Vu qu'il n'y a pas de contexte de recherche, si des modifications sont faites dans l'index, on peut récupérer ces modifications ce qui peut provoquer des doublons/suppression lors de la lecture.
En sauvegardant le dernier document lu, on peut donc créer une reprise sur incident.
Si l'ordre n'a pas d'importance, alors mieux veut utiliser le tri par `_doc` car c'est l'ordre naturel de l'index :

> Scroll requests have optimizations that make them faster when the sort order is `_doc`.  
> If you want to iterate over all documents regardless of the order, this is the most efficient option:
> 
>     GET /_search?scroll=1m
>     {
>       "sort": [
>         "_doc"
>       ]
>     }
