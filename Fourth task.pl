%  Loginis programavimas. 4 užduotis
%  Gediminas Krasauksas
%  IV kursas, 3 grupė
%  Variantas: 16: Sudoku




% ---------------------------------------------------------
% ----------------------  SUDOKU  -------------------------
% ---------------------------------------------------------

sudoku(Puzzle) :- 
	printPuzzle(Puzzle), nl, 
	map(Spots),
	init(Puzzle,Spots),!,
	solve(Spots),
	printPuzzle(Puzzle).

   
   
% ---------------------------------------------------------
% --------------------  MAP SUDOKU  -----------------------
% ---------------------------------------------------------

map(Spots) :- 
	length(Spots,81),
	mapRows(Spots), 
	mapCols(Spots, 9), 
	mapSquares(Spots).

% ---------------------------------------------------------

mapRows([]).
mapRows(Spots) :- 
	mapRow(Spots,_,9),
	skip(Spots,9,Spots1), 
	mapRows(Spots1).

mapRow(_,_,0).
mapRow([spot(_,R,_,_)|Spots],R,K) :- 
	K > 0,
	K1 is K-1, 
	mapRow(Spots,R,K1).

% ---------------------------------------------------------

mapCols(_,0).
mapCols(Spots,K) :- K > 0,
   mapCol(Spots,_),
   skip(Spots,1,Spots1), 
   K1 is K-1, mapCols(Spots1,K1).

mapCol([],_).
mapCol([spot(_,_,C,_)|Spots],C) :-
   skip(Spots,8,Spots1),
   mapCol(Spots1,C).

% ---------------------------------------------------------
   
mapSquares(Spots) :- 
   mapGroup(Spots),
   skip(Spots,27,Spots1),
   mapGroup(Spots1),
   skip(Spots1,27,Spots2),
   mapGroup(Spots2).

mapGroup(Spots) :- 
   mapSq(Spots,_),
   skip(Spots,3,Spots1),
   mapSq(Spots1,_),
   skip(Spots1,3,Spots2),
   mapSq(Spots2,_).

mapSq([],_).
mapSq(Spots,S) :- 
  mapTriplet(Spots,S),
  skip(Spots,9,Spots1),
  mapTriplet(Spots1,S),
  skip(Spots1,9,Spots2),
  mapTriplet(Spots2,S).

mapTriplet([spot(_,_,_,S),spot(_,_,_,S),spot(_,_,_,S)|_],S).



% ---------------------------------------------------------
% ----------------------  UTILITY  ------------------------
% ---------------------------------------------------------

skip([],_,[]).
skip(Xs,0,Xs).
skip([_|Xs],K,Zs) :- K > 0, K1 is K-1, skip(Xs,K1,Zs). 



% ---------------------------------------------------------
% --------------  INITIALIZE SUDOKU SPOTS  ----------------
% ---------------------------------------------------------

init([],[]).
init([X|Xs],[Sp|Spots]) :- initSpot(X,Sp), init(Xs,Spots).

initSpot(X,spot(X,_,_,_)) :- var(X), !.
initSpot(X,spot(X,R,C,S)) :- integer(X),
   insert(X,R),
   insert(X,C),
   insert(X,S).

   
   
% ---------------------------------------------------------
% -------------------  SOLVE SUDOKU  ----------------------
% ---------------------------------------------------------

solve([]).
solve([Spot|Spots]) :- find(Spot), solve(Spots).

find(spot(X,_,_,_)) :- nonvar(X), !.
find(spot(X,R,C,S)) :- var(X),
   between(1,9,X),
   insert(X,R),
   insert(X,C),
   insert(X,S).
   
   

% ---------------------------------------------------------
% -------------------  INSERT VALUE  ----------------------
% ---------------------------------------------------------

insert(X,L) :- var(L), L = [X|_].
insert(X,[Y|Ys]) :- X \= Y, insert(X,Ys).



% ---------------------------------------------------------
% -------------------  PRINT SUDOKU  ----------------------
% ---------------------------------------------------------

printPuzzle([]).
printPuzzle(Xs) :- nl,
	printGroup(Xs,Xs1),
	write('--------+---------+--------'), nl,
	printGroup(Xs1,Xs2),
	write('--------+---------+--------'), nl,
	printGroup(Xs2,_).

printGroup(Xs,Xs3) :- 
	printRow(Xs,Xs1), nl,
	write('        |         |'), nl, 
	printRow(Xs1,Xs2), nl,
	write('        |         |'), nl, 
	printRow(Xs2,Xs3), nl.
 
printRow(Xs,Xs3) :-
	printTriplet(Xs,Xs1), write(' | '),
	printTriplet(Xs1,Xs2), write(' | '),
	printTriplet(Xs2,Xs3).

printTriplet(Xs,Xs3) :-
	printElement(Xs,Xs1), write('  '),
	printElement(Xs1,Xs2), write('  '),
	printElement(Xs2,Xs3).

printElement([X|Xs],Xs) :- var(X), write('.').
printElement([X|Xs],Xs) :- write(X).



% ---------------------------------------------------------
% ---------------------  TEST CASE  -----------------------
% ---------------------------------------------------------

test(N) :- puzzle(N,P), sudoku(P).

puzzle(1,P) :- 
	P = [2,_,6,	 _,1,_,	 9,_,7, 
		 7,_,4,	 _,8,_,	 _,_,_, 
		 _,_,_,	 6,_,_,	 _,_,2,
        
		 _,9,_,	 _,_,5,	 1,2,_, 
		 _,_,2,	 1,_,9,	 6,_,_, 
		 _,6,1,	 4,_,_,	 _,3,_,
		
		 8,_,_,	 _,_,6,	 _,_,_, 
		 _,_,_,	 _,7,_,	 8,_,3, 
		 1,_,9,	 _,5,_,	 2,_,6].
		 
puzzle(2,P) :- 
	P = [_,_,_,	 _,_,_,	 _,_,_, 
		 _,_,_,	 _,_,_,	 _,_,_, 
		 _,_,_,	 _,_,_,	 _,_,_,
        
		 _,_,_,	 _,_,_,	 _,_,_, 
		 _,_,_,	 _,_,_,	 _,_,_, 
		 _,_,_,	 _,_,_,	 _,_,_,
		
		 _,_,_,	 _,_,_,	 _,_,_, 
		 _,_,_,	 _,_,_,	 _,_,_, 
		 _,_,_,	 _,_,_,	 _,_,_].