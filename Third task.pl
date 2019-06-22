%  Loginis programavimas. 3 užduotis
%  Gediminas Krasauksas
%  IV kursas, 3 grupė
%  Variantai: 1.2, 2.7, 3.6, 4.4



% --------- VARIANTAS-1.2 --------
maz( []  ) :- ! .
maz( [_] ) :- ! .
maz( [X,Y|Z] ) :- X>=Y , maz( [Y|Z] ), ! .

% maz([41,8,2]).
% maz([2]).
% maz([22,6,8]).


% --------- VARIANTAS-2.7 --------
de_sk([X|Y]   , K )         :- apsk( [X|Y] , _  , Value  ) , K is Value                           , ! .
apsk( [X]     , N , Value ) :-	                             N is 1     , Value is X              , ! .
apsk( [X,Z|Y] , N , Value ) :- apsk( [Z|Y] , N2 , Value2 ) , N is N2*10 , Value is (X*N + Value2) , ! .

% de_sk([1,9,8,5],K).


% --------- VARIANTAS-3.6 --------
galiniai(  [X|Y] , K , R ) :- gal( [X|Y] , K , _  , R2 )         , R = R2                   , ! .
gal( [_]     , K , N , R ) :-                              K=<0  , R = []     , N is 1      , ! .
gal( [X]     , K , N , R ) :-                              K >0  , R = [X]    , N is 1      , ! .
gal( [X,Z|Y] , K , N , R ) :- gal( [Z|Y] , K , N2 , R2 ) , N2 <K , R = [X|R2] , N is N2 + 1 , ! .
gal( [_,Z|Y] , K , N , R ) :- gal( [Z|Y] , K , N2 , R2 ) , N2>=K , R = R2     , N is N2 + 1 , ! .

% galiniai([5,3],2,X).
% galiniai([5,3],0,X).
% galiniai([5,3],4,X).
% galiniai([5,3,8,4,6,4,7],4,X).
% galiniai([a,b,c,d,e],3,R).


% --------- VARIANTAS-4.4 --------
suma([X|Y], [M|N], Sum):- 
reverse([X|Y], Rev1, []), 
reverse([M|N], Rev2, []), 
list_sum(Rev1, Rev2, Rez, 0), 
reverse(Rez, Rev3, []), 
Sum = Rev3.

reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

list_sum( []     , []     , []     , 0 ) .
list_sum( []     , []     , [Z|Zs] , 1 )   :-                Z is 1           , list_sum( [] , [] , Zs , 0 ) , ! .
list_sum( []     , [Y|Ys] , [Z|Zs] , Liek) :- Y+Liek =:=10 , Z is 0           , list_sum( [] , Ys , Zs , 1 ) , ! .
list_sum( []     , [Y|Ys] , [Z|Zs] , Liek) :- Y+Liek   <10 , Z is Y+Liek      , list_sum( [] , Ys , Zs , 0 ) , ! .
list_sum( [X|Xs] , []     , [Z|Zs] , Liek) :- X+Liek =:=10 , Z is 0           , list_sum( Xs , [] , Zs , 1 ) , ! .
list_sum( [X|Xs] , []     , [Z|Zs] , Liek) :- X+Liek   <10 , Z is X+Liek      , list_sum( Xs , [] , Zs , 0 ) , ! .
list_sum( [X|Xs] , [Y|Ys] , [Z|Zs] , Liek) :- X+Y+Liek>=10 , Z is X+Y+Liek-10 , list_sum( Xs , Ys , Zs , 1 ) , ! .
list_sum( [X|Xs] , [Y|Ys] , [Z|Zs] , Liek) :- X+Y+Liek <10 , Z is X+Y+Liek    , list_sum( Xs , Ys , Zs , 0 ) , ! .

% suma([9,4,6,1,3,4],[2,8],Sum).
