:- include('item.pl').

:- dynamic(isShop/0).

shop :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

shop :-
  isPlay, player(X, Y),
  (X =:= 12, Y =:= 4 -> !, asserta(isShop),
  write('What do you want to buy? Type "gacha." or "potion."'), nl,
  write('1. Gacha (200 gold)'), nl,
  write('2. Potion (100 gold)'), nl
  ; !, write('You must go to the shop first!'), nl).

gacha :-
  isPlay, isShop, inventCounter(Y), currGold(Gold),
  ( Gold > 199 -> !, ( (Y+1) < 101 -> 
  random(1, 101, X), write('You got a '), retract(currGold(Gold)), NewGold is (Gold-200), asserta(currGold(NewGold)),
  (X < 31 -> !,item(55, B, C, _), addToInvent(55), write(C), write(' '), write(B), nl
  ; 30 < X, X < 61 -> random(10, 19, A),!, item(A, B, C, _), addToInvent(A), write(C), write(' '), write(B), nl
  ; 60 < X, X < 81 -> random(19, 28, A),!, item(A, B, C, _), addToInvent(A), write(C), write(' '), write(B), nl
  ; 80 < X, X < 94 -> random(28, 37, A),!, item(A, B, C, _), addToInvent(A), write(C), write(' '), write(B), nl
  ; 93 < X, X < 99 -> random(37, 46, A),!, item(A, B, C, _), addToInvent(A), write(C), write(' '), write(B), nl
  ; 98 < X, X < 101 -> random(46, 55, A),!, item(A, B, C, _), addToInvent(A), write(C), write(' '), write(B), nl)
  ; !, write('Your inventory is full'), nl)
  ; !, write('You cant afford a gacha (200 gold)')).

gacha :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

gacha :-
  \+isShop,
  write('You must go to the shop first!'), nl, !.

potion :-
  isShop, item(55, B, C, _), inventCounter(Y), currGold(Gold),
  (Gold > 99 -> !, 
  ( (Y+1) < 101 -> !, retract(currGold(Gold)), NewGold is (Gold-100), asserta(currGold(NewGold)),
  write('You got a '), write(C), write(' '), write(B), addToInvent(55), nl
  ; !, write('Your inventory is full'), nl)
  ; !, write('You cant afford a potion (100 gold)')).

potion :-
  \+isShop,
  write('You must go to the shop first!'), nl, !.

exitShop :-
  \+isShop,
  write('Exit from what?!, Youre not even in the shop!'), nl, !.

exitShop :- 
  isShop,
  retract(isShop), write('Thanks for coming.'), !.