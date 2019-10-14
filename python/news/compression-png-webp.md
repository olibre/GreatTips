Je partage dans ce commentaire mes trouvailles pour réduire davantage les images PNG. 🤩

J’ai testé les outils [`pngcrush`](https://en.wikipedia.org/wiki/Pngcrush), [`pngnq`](https://github.com/stuart/pngnq), [`pngquant`](https://github.com/kornelski/pngquant) et [Trimage](https://trimage.org/). Ce dernier outil, Trimage, est une application graphique qui se base sur les outils [`pngcrush`](https://en.wikipedia.org/wiki/Pngcrush), [`optipng`](http://optipng.sourceforge.net/), et [`advpng`](https://en.wikipedia.org/wiki/AdvanceCOMP).

Installation
------------

```c
sudo apt install pngcrush pngnq pngquant trimage
```

Présentation à partir des Manpages
----------------------------------

* **`pngcrush`** is an optimizer for PNG (Portable Network Graphics) files. Its main purpose is to reduce the size of the file's IDAT chunk (or stream). `pngcrush` can also be used to modify a PNG's ancillary chunks (example : transparency information or textual comments). Some familiarity with the PNG (pronounced “ping”) format may be helpful to users of pngcrush. `pngcrush` has reasonable defaults so running with no options may produce smaller files.
* **`pngnq`** quantizes a 32-bit RGBA PNG image to an 8 bit RGBA palette PNG using the neuquant algorithm. The output file name is the input file name extended with `-nq8.png` or a specified extension.
* **`pngquant`** converts 32-bit RGBA PNGs to 8-bit (or smaller) RGBA-palette PNGs, optionally using Floyd-Steinberg dithering. The output filename is the same as the input name except that it ends in `-fs8.png` or `-or8.png`.
* **`trimage`** is a front-end to compress png and jpeg images via optipng, advpng, pngcrush and jpegoptim.

Recompression PNG
-----------------

```sh
cd chemin/avec/des/images
for f in *.png ; do pngcrush --brute $f ${f}crush.png ; done
for f in *.png ; do pngnq -s 1 $f ; done
for f in *.png ; do pngquant --speed 1 --ext -pngquant.png $f ; done
```

Je n’avais pas vu que Trimage pouvait être utilisé à la ligne de commande : je l’ai utilisé via l’interface graphique.

Résultats pour une image RGBA
-----------------------------

Taille | Opération
------:|-----------------
186467 | Image RGBA 32 bits de type logo enregistrée avec GIMP
145386 | Juste `pngcrush`
138587 | Juste Trimage
52348  | Juste `pngquant`
52118  | Juste `pngnq`
50066  | Double combinaison `pngnq` + `pngquant`
47784  | Double combinaison `pngquant` + Trimage
46383  | Double combinaison `pngnq` + Trimage
45654  | Triple combinaison `pngnq` + `pngquant` + Trimage

Notons que Trimage intègre la compression fournie par `pngcrush`.

En utilisant un seul outil, c’est `pngnq` qui s’en est sorti le mieux (avec mon image), suivi de près par `pngquant`, ces deux outils réalisant des opérations similaires.

J’ai été surpris que la combinaison de tous ces outils puissent obtenir une encore meilleure compression ! D'ailleur l'auteur de `pngnq` donne l'exemple suivant :

`pngnq -n 256 image.png && pngcrush image-nq8.png smallimage.png`


Résultats pour une image avec des couleurs indexées
---------------------------------------------------

Taille | Opération
------:|-----------------
55227  | La même image avec 32 couleurs indexées (sans transparence), enregistrée en GIF avec GIMP
31158  | La même image avec 32 couleurs indexées (sans transparence), enregistrée en PNG avec GIMP
30367  | Juste `pngquant`
26951  | Juste Trimage
26701  | Combinaison `pngquant` et Trimage

Dans ce second test, l’outil `pngnq` augmentait la taille. :-/

Notons au passage, que le format GIF semble dépassé pour ce type d’image !

Bilan
-----

Avec ces différentes astuces, nous passons d’une image PNG initiale de 182 Kio (RGBA) à 26 Kio, soit 14 % de l’original, sans aucune différence à mes yeux !

Et le WebP sans pertes ?
------------------------
    
* Installation  
  `sudo apt install webp`
* Conversion PNG -> WebP  
  `for f in */*.png ; do cwebp -preset icon -lossless -z 9 -m 6 $f -o $f.webp ; done`


PNG    | WebP  | Image
------:|------:|----------
186467 | 76048 | Image RGBA initiale (GIMP)
52348  | 40918 | Juste `pngquant`
52118  | 38358 | Juste `pngnq`
31158  | 21340 | Image 32 couleurs indexées (GIMP)
31857  | 21338 | Juste `pngnq` sur l’image 32 couleurs indexées

Incroyable, l’outil `cwebp` compresse encore mieux quand le PNG a été optimisé. Et, bien que `pngnq` augmente la taille du PNG avec couleurs indexées, le WebP final est encore un tout petit peu meilleur !

Dans tous les cas, l’écart s’amenuise entre un PNG très optimisé et un WebP sans pertes. Le WebP, parvient tout de même à compresser un tiers.

Conclusion
----------

Pour mes prochaines dépêches sur LinuxFr.org, je vais combiner différents outils pour obtenir des fichiers PNG avec le meilleur ratio qualité/taille. Et puis, plus tard, quand quasiment tout le lectorat de LinuxFr.org pourra profiter des images au format WebP, je passerai au WebP, mais en recompressant préalablement mes fichiers avec `pngnq`.



Autre test
----------



sudo dnf install pngcrush pngnq pngquant optipng advancecomp


time for ((i=0;i<8;i++))
do
    for f in *.png
    do
        pngnq -s 1 $f

        pngquant --speed 1 $f

        f_opt=${f%.png}-opt.png
        [[ -e $f_opt ]] || optipng -strip all -o 7 $f --out $f_opt

        f_adv=${f%.png}-adv.png
        [[ -e $f_adv ]] || cp $f $f_adv && advpng -f --shrink-insane --iter 20 --recompress $f_adv

        f_cru=${f%.png}-cru.png
        [[ -e $f_cru ]] || pngcrush --brute $f $f_cru
    done
done


for f in *.png ; do cwebp -progress -preset icon -lossless -z 9 -m 6 $f -o ${f%.png}.lossless-webp ; done


```
> du -hsc *.png | sort -h | tail

140K	quel-python-adopter-small-cru-opt-opti-adv.png
140K	quel-python-adopter-small-opt-adv-adv.png
140K	quel-python-adopter-small-opt-adv-cru-adv.png
140K	quel-python-adopter-small-opt-adv-cru-opti-adv.png
140K	quel-python-adopter-small-opt-adv-opti-adv.png
140K	quel-python-adopter-small-opt-adv.png
140K	quel-python-adopter-small-opt-cru-adv.png
140K	quel-python-adopter-small-opt-cru-opti-adv.png
140K	quel-python-adopter-small-opt-opti-adv.png
829M	total
```


```
> ls -1 *.png | wc -l

20768
```




10:16 $ join <(du -b partie-35*.png | awk -F '[\t.]' '{print $2, $1, $3}' | sort ) <(du -b partie-35*.webp | awk -F '[\t.]' '{print $2, $1, $3}' | sort) | sort -nr -k2 | column -t
10:17 $ join <(du -b partie-35*.png | awk -F '[\t.]' '{print $2, $1}' | sort ) <(du -b partie-35*.webp | awk -F '[\t.]' '{print $2, $1}' | sort) | sort -nr -k2 | column -t
partie-35                  127572  16760
partie-35-cru              115426  16760
partie-35-opt              115240  16760
partie-35-adv              109525  16760
partie-35-fs8-cru          45103   20882
partie-35-fs8              45098   20882
partie-35-fs8-fs8          45089   20882
partie-35-fs8-opt          44931   20882
partie-35-fs8-fs8-opt      44925   20882
partie-35-fs8-adv          42890   20882
partie-35-fs8-fs8-adv      42883   20882
partie-35-fs8-nq8          41557   18878
partie-35-fs8-nq8-opt      41509   18878
partie-35-fs8-nq8-fs8      40812   21060
partie-35-fs8-nq8-fs8-opt  40713   21060
partie-35-nq8-cru          39617   17382
partie-35-fs8-nq8-adv      39542   18878
partie-35-nq8              39533   17382
partie-35-nq8-opt          39485   17382
partie-35-nq8-fs8          38763   19578
partie-35-fs8-nq8-fs8-adv  38709   21060
partie-35-nq8-fs8-cru      38681   19578
partie-35-nq8-fs8-opt      38558   19578
partie-35-nq8-adv          37764   17382
partie-35-nq8-nq8          36971   17522
partie-35-nq8-nq8-opt      36923   17522
partie-35-nq8-fs8-adv      36878   19578
partie-35-nq8-nq8-fs8      36519   19642
partie-35-nq8-nq8-fs8-opt  36344   19642
partie-35-nq8-nq8-adv      35245   17522
partie-35-nq8-nq8-fs8-adv  34659   19642
✔ ~/git/ext/GreatPractices/python/news [master|✚ 1…4958]
10:18 $ join <(du -b partie-35*.png | awk -F '[\t.]' '{print $2, $1}' | sort ) <(du -b partie-35*.webp | awk -F '[\t.]' '{print $2, $1}' | sort) | sort -nr -k3 | column -t
partie-35-fs8-nq8-fs8-opt  40713   21060
partie-35-fs8-nq8-fs8-adv  38709   21060
partie-35-fs8-nq8-fs8      40812   21060
partie-35-fs8-opt          44931   20882
partie-35-fs8-fs8-opt      44925   20882
partie-35-fs8-fs8-adv      42883   20882
partie-35-fs8-fs8          45089   20882
partie-35-fs8-cru          45103   20882
partie-35-fs8-adv          42890   20882
partie-35-fs8              45098   20882
partie-35-nq8-nq8-fs8-opt  36344   19642
partie-35-nq8-nq8-fs8-adv  34659   19642
partie-35-nq8-nq8-fs8      36519   19642
partie-35-nq8-fs8-opt      38558   19578
partie-35-nq8-fs8-cru      38681   19578
partie-35-nq8-fs8-adv      36878   19578
partie-35-nq8-fs8          38763   19578
partie-35-fs8-nq8-opt      41509   18878
partie-35-fs8-nq8-adv      39542   18878
partie-35-fs8-nq8          41557   18878
partie-35-nq8-nq8-opt      36923   17522
partie-35-nq8-nq8-adv      35245   17522
partie-35-nq8-nq8          36971   17522
partie-35-nq8-opt          39485   17382
partie-35-nq8-cru          39617   17382
partie-35-nq8-adv          37764   17382
partie-35-nq8              39533   17382
partie-35-opt              115240  16760
partie-35-cru              115426  16760
partie-35-adv              109525  16760
partie-35                  127572  16760

10:22 $ join <(du -b partie-4*.png | awk -F '[\t.]' '{print $2, $1}' | sort ) <(du -b partie-4*.webp | awk -F '[\t.]' '{print $2, $1}' | sort) | sort -nr -k3 | column -t
partie-4-fs8-opt-cru      44142   21470
partie-4-fs8-opt-adv      42007   21470
partie-4-fs8-opt          43997   21470
partie-4-fs8-fs8-opt      43991   21470
partie-4-fs8-fs8-adv      41988   21470
partie-4-fs8-fs8          44152   21470
partie-4-fs8-cru          44143   21470
partie-4-fs8-adv          42008   21470
partie-4-fs8              44165   21470
partie-4-fs8-nq8-fs8-opt  38831   21444
partie-4-fs8-nq8-fs8-adv  36837   21444
partie-4-fs8-nq8-fs8      38955   21444
partie-4-fs8-nq8-opt-adv  38123   19268
partie-4-fs8-nq8-opt      40096   19268
partie-4-fs8-nq8-adv      38124   19268
partie-4-fs8-nq8          40145   19268
partie-4-nq8-nq8-fs8-opt  36516   19222
partie-4-nq8-nq8-fs8-adv  34719   19222
partie-4-nq8-nq8-fs8      36659   19222
partie-4-nq8-fs8-opt      38991   19212
partie-4-nq8-fs8-cru      39111   19212
partie-4-nq8-fs8-adv      37193   19212
partie-4-nq8-fs8          39212   19212
partie-4-nq8-opt          39350   17072
partie-4-nq8-cru          39484   17072
partie-4-nq8-adv          37553   17072
partie-4-nq8              39398   17072
partie-4-nq8-nq8-opt      37071   17066
partie-4-nq8-nq8-adv      35279   17066
partie-4-nq8-nq8          37119   17066
partie-4-opt              114137  16440
partie-4-cru              114334  16440
partie-4-adv              108388  16440
partie-4                  126293  16440
✔ ~/git/ext/GreatPractices/python/news [master|✚ 1…4958]
10:22 $ join <(du -b partie-4*.png | awk -F '[\t.]' '{print $2, $1}' | sort ) <(du -b partie-4*.webp | awk -F '[\t.]' '{print $2, $1}' | sort) | sort -nr -k2 | column -t
partie-4                  126293  16440
partie-4-cru              114334  16440
partie-4-opt              114137  16440
partie-4-adv              108388  16440
partie-4-fs8              44165   21470
partie-4-fs8-fs8          44152   21470
partie-4-fs8-cru          44143   21470
partie-4-fs8-opt-cru      44142   21470
partie-4-fs8-opt          43997   21470
partie-4-fs8-fs8-opt      43991   21470
partie-4-fs8-adv          42008   21470
partie-4-fs8-opt-adv      42007   21470
partie-4-fs8-fs8-adv      41988   21470
partie-4-fs8-nq8          40145   19268
partie-4-fs8-nq8-opt      40096   19268
partie-4-nq8-cru          39484   17072
partie-4-nq8              39398   17072
partie-4-nq8-opt          39350   17072
partie-4-nq8-fs8          39212   19212
partie-4-nq8-fs8-cru      39111   19212
partie-4-nq8-fs8-opt      38991   19212
partie-4-fs8-nq8-fs8      38955   21444
partie-4-fs8-nq8-fs8-opt  38831   21444
partie-4-fs8-nq8-adv      38124   19268
partie-4-fs8-nq8-opt-adv  38123   19268
partie-4-nq8-adv          37553   17072
partie-4-nq8-fs8-adv      37193   19212
partie-4-nq8-nq8          37119   17066
partie-4-nq8-nq8-opt      37071   17066
partie-4-fs8-nq8-fs8-adv  36837   21444
partie-4-nq8-nq8-fs8      36659   19222
partie-4-nq8-nq8-fs8-opt  36516   19222
partie-4-nq8-nq8-adv      35279   17066
partie-4-nq8-nq8-fs8-adv  34719   19222

10:42 $ join <(du -b quel-python-adopter-small*.png | awk -F '[\t.]' '{print $2, $1}' | sort ) <(du -b quel-python-adopter-small*.webp | awk -F '[\t.]' '{print $2, $1}' | sort) | sort -nr -k2 | column -t
quel-python-adopter-small-adv              141025  23576
quel-python-adopter-small                  130303  23576
quel-python-adopter-small-opt              130114  23576
quel-python-adopter-small-cru              129916  23576
quel-python-adopter-small-nq8-cru          40998   24350
quel-python-adopter-small-fs8-cru          40966   26272
quel-python-adopter-small-nq8              40839   24350
quel-python-adopter-small-nq8-opt          40791   24350
quel-python-adopter-small-fs8-cru-opt      40738   26272
quel-python-adopter-small-nq8-fs8-cru      40512   24942
quel-python-adopter-small-fs8              40412   26272
quel-python-adopter-small-fs8-fs8          40401   26272
quel-python-adopter-small-fs8-opt          40364   26272
quel-python-adopter-small-fs8-fs8-opt      40353   26272
quel-python-adopter-small-nq8-fs8-cru-opt  40286   24942
quel-python-adopter-small-nq8-fs8          39977   24942
quel-python-adopter-small-nq8-fs8-opt      39929   24942
quel-python-adopter-small-nq8-nq8          38971   24442
quel-python-adopter-small-nq8-nq8-opt      38923   24442
quel-python-adopter-small-fs8-adv          38720   26272
quel-python-adopter-small-fs8-fs8-adv      38704   26272
quel-python-adopter-small-nq8-adv          38620   24350
quel-python-adopter-small-fs8-nq8          38581   25778
quel-python-adopter-small-fs8-nq8-opt      38533   25778
quel-python-adopter-small-nq8-fs8-adv      38238   24942
quel-python-adopter-small-nq8-nq8-fs8      38050   25004
quel-python-adopter-small-nq8-nq8-fs8-opt  38002   25004
quel-python-adopter-small-fs8-nq8-fs8      37691   26298
quel-python-adopter-small-fs8-nq8-fs8-opt  37643   26298
quel-python-adopter-small-nq8-nq8-adv      36948   24442
quel-python-adopter-small-fs8-nq8-adv      36702   25778
quel-python-adopter-small-nq8-nq8-fs8-adv  36438   25004
quel-python-adopter-small-fs8-nq8-fs8-adv  36098   26298
✔ ~/git/ext/GreatPractices/python/news [master|✚ 1…4958]
10:43 $ join <(du -b quel-python-adopter-small*.png | awk -F '[\t.]' '{print $2, $1}' | sort ) <(du -b quel-python-adopter-small*.webp | awk -F '[\t.]' '{print $2, $1}' | sort) | sort -nr -k3 | column -t
quel-python-adopter-small-fs8-nq8-fs8-opt  37643   26298
quel-python-adopter-small-fs8-nq8-fs8-adv  36098   26298
quel-python-adopter-small-fs8-nq8-fs8      37691   26298
quel-python-adopter-small-fs8-opt          40364   26272
quel-python-adopter-small-fs8-fs8-opt      40353   26272
quel-python-adopter-small-fs8-fs8-adv      38704   26272
quel-python-adopter-small-fs8-fs8          40401   26272
quel-python-adopter-small-fs8-cru-opt      40738   26272
quel-python-adopter-small-fs8-cru          40966   26272
quel-python-adopter-small-fs8-adv          38720   26272
quel-python-adopter-small-fs8              40412   26272
quel-python-adopter-small-fs8-nq8-opt      38533   25778
quel-python-adopter-small-fs8-nq8-adv      36702   25778
quel-python-adopter-small-fs8-nq8          38581   25778
quel-python-adopter-small-nq8-nq8-fs8-opt  38002   25004
quel-python-adopter-small-nq8-nq8-fs8-adv  36438   25004
quel-python-adopter-small-nq8-nq8-fs8      38050   25004
quel-python-adopter-small-nq8-fs8-opt      39929   24942
quel-python-adopter-small-nq8-fs8-cru-opt  40286   24942
quel-python-adopter-small-nq8-fs8-cru      40512   24942
quel-python-adopter-small-nq8-fs8-adv      38238   24942
quel-python-adopter-small-nq8-fs8          39977   24942
quel-python-adopter-small-nq8-nq8-opt      38923   24442
quel-python-adopter-small-nq8-nq8-adv      36948   24442
quel-python-adopter-small-nq8-nq8          38971   24442
quel-python-adopter-small-nq8-opt          40791   24350
quel-python-adopter-small-nq8-cru          40998   24350
quel-python-adopter-small-nq8-adv          38620   24350
quel-python-adopter-small-nq8              40839   24350
quel-python-adopter-small-opt              130114  23576
quel-python-adopter-small-cru              129916  23576
quel-python-adopter-small-adv              141025  23576
quel-python-adopter-small                  130303  23576

10:43 $ join <(du -b tux*.png | awk -F '[\t.]' '{print $2, $1}' | sort ) <(du -b tux*.webp | awk -F '[\t.]' '{print $2, $1}' | sort) | sort -nr -k2 | column -t
tux-python-adv              46647  5472
tux-python                  42896  5472
tux-python-opt              42828  5472
tux-python-cru              42828  5472
tux-python-nq8              18143  5514
tux-python-nq8-fs8-cru      17547  5688
tux-python-nq8-fs8-cru-opt  17546  5688
tux-python-fs8-cru          17234  5634
tux-python-nq8-fs8          17054  5688
tux-python-nq8-fs8-opt      17042  5688
tux-python-nq8-nq8          16933  5544
tux-python-nq8-adv          16919  5514
tux-python-nq8-opt-adv      16916  5514
tux-python-fs8-fs8          16798  5634
tux-python-fs8              16793  5634
tux-python-fs8-fs8-opt      16786  5634
tux-python-fs8-opt          16781  5634
tux-python-nq8-fs8-adv      16457  5688
tux-python-fs8-nq8          16421  5504
tux-python-fs8-fs8-adv      16268  5634
tux-python-fs8-adv          16256  5634
tux-python-nq8-cru          16008  5514
tux-python-nq8-opt          16005  5514
tux-python-nq8-nq8-adv      15857  5544
tux-python-nq8-nq8-opt-adv  15855  5544
tux-python-nq8-nq8-fs8      15721  5692
tux-python-fs8-nq8-opt      15713  5504
tux-python-nq8-nq8-fs8-opt  15709  5692
tux-python-nq8-nq8-opt      15657  5544
tux-python-fs8-nq8-fs8      15545  5662
tux-python-fs8-nq8-fs8-opt  15533  5662
tux-python-fs8-nq8-adv      15390  5504
tux-python-fs8-nq8-opt-adv  15385  5504
tux-python-nq8-nq8-fs8-adv  15198  5692
tux-python-fs8-nq8-fs8-adv  14949  5662
✔ ~/git/ext/GreatPractices/python/news [master|✚ 1…4958]
10:44 $ join <(du -b tux*.png | awk -F '[\t.]' '{print $2, $1}' | sort ) <(du -b tux*.webp | awk -F '[\t.]' '{print $2, $1}' | sort) | sort -nr -k3 | column -t
tux-python-nq8-nq8-fs8-opt  15709  5692
tux-python-nq8-nq8-fs8-adv  15198  5692
tux-python-nq8-nq8-fs8      15721  5692
tux-python-nq8-fs8-opt      17042  5688
tux-python-nq8-fs8-cru-opt  17546  5688
tux-python-nq8-fs8-cru      17547  5688
tux-python-nq8-fs8-adv      16457  5688
tux-python-nq8-fs8          17054  5688
tux-python-fs8-nq8-fs8-opt  15533  5662
tux-python-fs8-nq8-fs8-adv  14949  5662
tux-python-fs8-nq8-fs8      15545  5662
tux-python-fs8-opt          16781  5634
tux-python-fs8-fs8-opt      16786  5634
tux-python-fs8-fs8-adv      16268  5634
tux-python-fs8-fs8          16798  5634
tux-python-fs8-cru          17234  5634
tux-python-fs8-adv          16256  5634
tux-python-fs8              16793  5634
tux-python-nq8-nq8-opt-adv  15855  5544
tux-python-nq8-nq8-opt      15657  5544
tux-python-nq8-nq8-adv      15857  5544
tux-python-nq8-nq8          16933  5544
tux-python-nq8-opt-adv      16916  5514
tux-python-nq8-opt          16005  5514
tux-python-nq8-cru          16008  5514
tux-python-nq8-adv          16919  5514
tux-python-nq8              18143  5514
tux-python-fs8-nq8-opt-adv  15385  5504
tux-python-fs8-nq8-opt      15713  5504
tux-python-fs8-nq8-adv      15390  5504
tux-python-fs8-nq8          16421  5504
tux-python-opt              42828  5472
tux-python-cru              42828  5472
tux-python-adv              46647  5472
tux-python                  42896  5472

11:16 $ name=quel-python-adopter-small ; join <(join <(du -b $name*.png | awk -F '[\t.]' '{print $2, $1}' | sort ) <(du -b $name*.lossless-webp | awk -F '[\t.]' '{print $2, $1}' | sort)) <(du -b $name*.webp | awk -F '[\t.]' '{print $2, $1}' | sort) | sort -nr -k3 | column -t
quel-python-adopter-small-opt              130114  101152  23576
quel-python-adopter-small-cru              129916  101152  23576
quel-python-adopter-small-adv              141025  101152  23576
quel-python-adopter-small                  130303  101152  23576
quel-python-adopter-small-fs8-opt          40364   41006   26272
quel-python-adopter-small-fs8-fs8-opt      40353   41006   26272
quel-python-adopter-small-fs8-fs8-adv      38704   41006   26272
quel-python-adopter-small-fs8-fs8          40401   41006   26272
quel-python-adopter-small-fs8-cru-opt      40738   41006   26272
quel-python-adopter-small-fs8-cru          40966   41006   26272
quel-python-adopter-small-fs8-adv          38720   41006   26272
quel-python-adopter-small-fs8              40412   41006   26272
quel-python-adopter-small-nq8-opt          40791   40162   24350
quel-python-adopter-small-nq8-fs8-opt      39929   40162   24942
quel-python-adopter-small-nq8-fs8-cru-opt  40286   40162   24942
quel-python-adopter-small-nq8-fs8-cru      40512   40162   24942
quel-python-adopter-small-nq8-fs8-adv      38238   40162   24942
quel-python-adopter-small-nq8-fs8          39977   40162   24942
quel-python-adopter-small-nq8-cru          40998   40162   24350
quel-python-adopter-small-nq8-adv          38620   40162   24350
quel-python-adopter-small-nq8              40839   40162   24350
quel-python-adopter-small-nq8-nq8-opt      38923   38484   24442
quel-python-adopter-small-nq8-nq8-fs8-opt  38002   38484   25004
quel-python-adopter-small-nq8-nq8-fs8-adv  36438   38484   25004
quel-python-adopter-small-nq8-nq8-fs8      38050   38484   25004
quel-python-adopter-small-nq8-nq8-adv      36948   38484   24442
quel-python-adopter-small-nq8-nq8          38971   38484   24442
quel-python-adopter-small-fs8-nq8-opt      38533   38384   25778
quel-python-adopter-small-fs8-nq8-fs8-opt  37643   38384   26298
quel-python-adopter-small-fs8-nq8-fs8-adv  36098   38384   26298
quel-python-adopter-small-fs8-nq8-fs8      37691   38384   26298
quel-python-adopter-small-fs8-nq8-adv      36702   38384   25778
quel-python-adopter-small-fs8-nq8          38581   38384   25778
✔ ~/git/ext/GreatPractices/python/news [master|✚ 1…9244]
11:16 $ name=tux ; join <(join <(du -b $name*.png | awk -F '[\t.]' '{print $2, $1}' | sort ) <(du -b $name*.lossless-webp | awk -F '[\t.]' '{print $2, $1}' | sort)) <(du -b $name*.webp | awk -F '[\t.]' '{print $2, $1}' | sort) | sort -nr -k3 | column -t
tux-python-opt              42828  29522  5472
tux-python-cru              42828  29522  5472
tux-python-adv              46647  29522  5472
tux-python                  42896  29522  5472
tux-python-nq8-opt-adv      16916  17142  5514
tux-python-nq8-opt          16005  17142  5514
tux-python-nq8-fs8-opt      17042  17142  5688
tux-python-nq8-fs8-cru-opt  17546  17142  5688
tux-python-nq8-fs8-cru      17547  17142  5688
tux-python-nq8-fs8-adv      16457  17142  5688
tux-python-nq8-fs8          17054  17142  5688
tux-python-nq8-cru          16008  17142  5514
tux-python-nq8-adv          16919  17142  5514
tux-python-nq8              18143  17142  5514
tux-python-fs8-opt          16781  17134  5634
tux-python-fs8-fs8-opt      16786  17134  5634
tux-python-fs8-fs8-adv      16268  17134  5634
tux-python-fs8-fs8          16798  17134  5634
tux-python-fs8-cru          17234  17134  5634
tux-python-fs8-adv          16256  17134  5634
tux-python-fs8              16793  17134  5634
tux-python-nq8-nq8-opt-adv  15855  16010  5544
tux-python-nq8-nq8-opt      15657  16010  5544
tux-python-nq8-nq8-fs8-opt  15709  16010  5692
tux-python-nq8-nq8-fs8-adv  15198  16010  5692
tux-python-nq8-nq8-fs8      15721  16010  5692
tux-python-nq8-nq8-adv      15857  16010  5544
tux-python-nq8-nq8          16933  16010  5544
tux-python-fs8-nq8-opt-adv  15385  15884  5504
tux-python-fs8-nq8-opt      15713  15884  5504
tux-python-fs8-nq8-fs8-opt  15533  15884  5662
tux-python-fs8-nq8-fs8-adv  14949  15884  5662
tux-python-fs8-nq8-fs8      15545  15884  5662
tux-python-fs8-nq8-adv      15390  15884  5504
tux-python-fs8-nq8          16421  15884  5504
✔ ~/git/ext/GreatPractices/python/news [master|✚ 1…9244]





```
ll googlelogo_white_background_color_272x92dp.png

for ((i=0;i<20;i++))
do
    for f in googlelogo*.png
    do
        f_nq8=${f%.png}-nq8.png
        [[ -e $f_nq8 ]] || pngnq -s 1 $f  # output file with "-nq8.png"

        f_fs8=${f%.png}-fs8.png
        [[ -e $f_fs8 ]] || pngquant --posterize 20 --quality 45-95 --skip-if-larger --strip --speed 1 $f  # suffix can be: -fs8 -or8 -ie-fs8.png -ie-or8

        f_opt=${f%.png}-opt.png
        [[ -e $f_opt ]] || optipng -strip all -o 7 $f --out $f_opt

        f_adv=${f%.png}-adv.png
        [[ -e $f_adv ]] || cp $f $f_adv && advpng -f --shrink-insane --iter 20 --recompress $f_adv

        f_cru=${f%.png}-cru.png
        pngcrush --brute $f $f_cru
    done
done

./long-file-names-v3.py googlelogo*.png | xargs rm

for f in *.png
do
    cwebp -progress -q 0 -preset icon -lossless -z 9 -m 6 $f -o ${f%.png}.lossless-webp
done


for f in *.png
do
    cwebp -preset icon -mt -af -pass 10 -q 50 -alpha_q 9 -m 6 -progress "$f" -o "${f%.png}.webp"
done

name=g ; join <(join <(du -b $name*.png | awk -F '[\t.]' '{print $2, $1}' | sort ) <(du -b $name*.lossless-webp | awk -F '[\t.]' '{print $2, $1}' | sort)) <(du -b $name*.webp | awk -F '[\t.]' '{print $2, $1}' | sort) | sort -nr -k2 | column -t
```

```
googlelogo_white_background_color_272x92dp                              5482  5324  3512
googlelogo_white_background_color_272x92dp-nq8                          3831  2872  3520
googlelogo_white_background_color_272x92dp-nq8-fs8                      3478  2872  3520
googlelogo_white_background_color_272x92dp-nq8-fs8-adv                  3290  2872  3520
googlelogo_white_background_color_272x92dp-nq8-nq8-fs8-adv              3123  2760  3522
googlelogo_white_background_color_272x92dp-nq8-nq8-nq8-nq8-fs8          2921  2556  3536
googlelogo_white_background_color_272x92dp-nq8-nq8-nq8-nq8-fs8-adv      2782  2556  3536
googlelogo_white_background_color_272x92dp-nq8-nq8-nq8-nq8-nq8-fs8-adv  2728  2518  3544
```


