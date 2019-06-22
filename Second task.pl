%  Loginis programavimas. 2 užduotis
%  Gediminas Krasauksas
%  IV kursas, 3 grupė
%  Variantai: 1.1 ir 5.2



% ---------- DUOMENŲ BAZĖ ----------
kelias(maskva, stokholmas, 1228).
kelias(maskva, vilnius, 191).
kelias(maskva, roma, 2378).
kelias(stokholmas, londonas, 1434).
kelias(stokholmas, vilnius, 176).
kelias(stokholmas, oslas, 99).
kelias(vilnius, londonas, 225).
kelias(vilnius, berlynas, 320).
kelias(vilnius, roma, 404).
kelias(londonas, berlynas, 933).
kelias(londonas, madridas, 1265).
kelias(londonas, dublinas, 75).
kelias(berlynas, roma, 184).
kelias(berlynas, madridas, 271).
kelias(berlynas, paryzius, 178).
kelias(roma, paryzius, 1052).



% ---------- TAISYKLĖS -----------

% --------- VARIANTAS-1.1 --------
galima_nuvaziuoti(X, Y, L):- kelias(X, Y, KM), KM < L.
galima_nuvaziuoti(X, Y, L):- kelias(X, Z, KM1), KM2 is L-KM1, galima_nuvaziuoti(Z, Y, KM2).
% galima_nuvaziuoti(X, Y, 100).
% galima_nuvaziuoti(X, Y, 1000).
% galima_nuvaziuoti(maskva, roma, 600).
% galima_nuvaziuoti(maskva, roma, 700).


% --------- VARIANTAS-5.2 --------
dalyba(X, Y, Z):- Y=:=0, Z is 0.

dalyba(X, Y, Z):- X>=0, Y>0, Y-X>0, Z is 0.
dalyba(X, Y, Z):- X<0, Y<0, Y-X<0, Z is 0.
dalyba(X, Y, Z):- X>=0, Y<0, Y+X<0, Z is 0.
dalyba(X, Y, Z):- X<0, Y>0, Y+X>0, Z is 0.

dalyba(X, Y, Z):- X>0, Y>0, X>=Y, X1 is X-Y, dalyba(X1, Y, Z1), Z is Z1+1.
dalyba(X, Y, Z):- X<0, Y<0, X=<Y, X1 is -X+Y, Y1 is Y*(-1), dalyba(X1, Y1, Z1), Z is Z1+1.
dalyba(X, Y, Z):- X>0, Y<0, X>=(-Y), X1 is X+Y, Y1 is Y*(-1), dalyba(X1, Y1, Z1), Z is -Z1-1.
dalyba(X, Y, Z):- X<0, Y>0, (-X)>=Y, X1 is -X-Y, dalyba(X1, Y, Z1), Z is -Z1-1.