%  Loginis programavimas. 1 užduotis
%  Gediminas Krasauksas
%  IV kursas, 3 grupė
%  Variantai: 21, 28, 40, 44



% ---------- DUOMENŲ BAZĖ ----------
asmuo(zarija, moteris, 2, peles).
asmuo(greta, moteris, 24, medicina).
asmuo(zygimantas, vyras, 26, kompiuteriai).
asmuo(gediminas, vyras, 21, futbolas).
asmuo(ona, moteris, 11, svietimas).
asmuo(stepas, vyras, 63, statybos).
asmuo(nijole, moteris, 60, niekas).
asmuo(zita, moteris, 64, maistas).
asmuo(jonas, vyras, 62, automobiliai).
asmuo(algis, vyras, 83, ukis).
asmuo(marija, moteris, 79, seima).
asmuo(aldona, moteris, 84, vaistai).
asmuo(stasys, vyras, 24, amatai).

mama(greta, zarija).
mama(ona, zygimantas).
mama(ona, gediminas).
mama(aldona, nijole).
mama(aldona, ona).
mama(marija, stepas).
mama(marija, jonas).
mama(marija, zita).

pora(zygimantas, greta).
pora(stepas, ona).
pora(algis, marija).
pora(stasys, aldona).



% ---------- TAISYKLĖS ----------

% --------- VARIANTAS-21 --------
sesuras(Sesuras, Marti):- pora(Sesuras, Motina), mama(Motina, Vyras), pora(Vyras, Marti).
% ?- sesuras(stepas, greta).
% ?- sesuras(algis, Marti).


% --------- VARIANTAS-28 --------
turi_vaiku(TevasMama):- mama(TevasMama, Vaikas).
turi_vaiku(TevasMama):- pora(TevasMama, Motina), mama(Motina, Vaikas).
% ?- turi_vaiku(gediminas).
% ?- turi_vaiku(zygimantas).


% --------- VARIANTAS-40 --------
klaida_duomenyse(Asmuo):- mama(Mama, Asmuo), asmuo(Mama, _, AgeParent, _), asmuo(Asmuo, _, AgeKid, _), AgeKid>AgeParent.
klaida_duomenyse(Asmuo):- pora(Tevas, Mama), mama(Mama, Asmuo), asmuo(Tevas, _, AgeParent, _), asmuo(Asmuo, _, AgeKid, _), AgeKid>AgeParent.
% ?- klaida_duomenyse(nijole).
% ?- klaida_duomenyse(ona).


% --------- VARIANTAS-44 --------
at_suk(Asmuo, N):- asmuo(Asmuo, Sex, Age, Hobbie), N is div(Age, 10).
% at_suk(zarija, 0).
% at_suk(Asmuo, 2).


