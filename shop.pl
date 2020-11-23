:- include('item.pl').

:- dynamic(isShop/0).

shop :-
  isPlay, asserta(isShop),
  write('What do you want to buy? Type "gacha." or "potion."'), nl, 
  write('1. Gacha (500 gold)'), nl,
  write('2. Potion (100 gold)'), nl, !.

shop :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

gacha :-
  isPlay, isShop,
  random(1, 101, X), write('You got a '),
  (X < 31 -> !,item(55, B, C, _), addToInvent(55), write(C), write(' '), write(B), nl
  ; 30 < X, X < 61 -> random(10, 19, A),!, item(A, B, C, _), addToInvent(A), write(C), write(' '), write(B), nl
  ; 60 < X, X < 81 -> random(19, 28, A),!, item(A, B, C, _), addToInvent(A), write(C), write(' '), write(B), nl
  ; 80 < X, X < 94 -> random(28, 37, A),!, item(A, B, C, _), addToInvent(A), write(C), write(' '), write(B), nl
  ; 93 < X, X < 99 -> random(37, 46, A),!, item(A, B, C, _), addToInvent(A), write(C), write(' '), write(B), nl
  ; 98 < X, X < 101 -> random(46, 55, A),!, item(A, B, C, _), addToInvent(A), write(C), write(' '), write(B), nl).

gacha :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

gacha :-
  \+isShop,
  write('You must go to the shop first!'), nl, !.

potion :-
  isShop,
  write('You got a potion'), addToInvent(55), nl, !.

potion :-
  \+isShop,
  write('You must go to the shop first!'), nl, !.

exitShop :- retract(isShop), write('Thanks for coming.'), !.

/*
Todo
1. probabilitas
2. ngecek di map apakah lagi posisi di shop
3. ngecek uang cukup
4. ngecek inventory cukup
5. masuk ke inventory
*/
