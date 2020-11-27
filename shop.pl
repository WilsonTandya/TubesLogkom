:- include('item.pl').

:- dynamic(isShop/0).

shop :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

shop :-
  isPlay, player(X, Y),
  (\+monster(_) -> (X =:= 12, Y =:= 4 -> !, asserta(isShop),
  write('What do you want to buy? Type "gacha." or "potion."'), nl,
  write('1. Gacha (200 gold) (gacha.)'), nl,
  write('2. HP Potion (100 gold) (potion.) '), nl,
  write('3. XP Potion (100 gold) (xpotion.) '), nl,
  write('4. Strength Potion (100 gold) (spotion.) '), nl,
  write('5. Resistance Potion (100 gold) (rpotion.) '), nl
  ; !, write('You must go to the shop first!'), nl)
  ; !, write('You have an ongoing battle!')).

gacha :-
  isPlay, isShop, inventCounter(Y), currGold(Gold),
  ( Gold > 199 -> !, ( (Y+1) < 101 ->
  random(1, 101, X), write('You got a '), retract(currGold(Gold)), NewGold is (Gold-200), asserta(currGold(NewGold)),
  (X < 31 -> random(55, 59, Id), !,item(Id, B, C, _), addToInvent(Id), write(C), write(' '), write(B), nl
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
  ; !, write('You cant afford a HP potion (100 gold)')).

potion :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

potion :-
  \+isShop,
  write('You must go to the shop first!'), nl, !.

xpotion :-
  isShop, item(56, B, C, _), inventCounter(Y), currGold(Gold),
  (Gold > 99 -> !,
  ( (Y+1) < 101 -> !, retract(currGold(Gold)), NewGold is (Gold-100), asserta(currGold(NewGold)),
  write('You got a '), write(C), write(' '), write(B), addToInvent(56), nl
  ; !, write('Your inventory is full'), nl)
  ; !, write('You cant afford a XP potion (100 gold)')).

xpotion :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

xpotion :-
  \+isShop,
  write('You must go to the shop first!'), nl, !.

spotion :-
  isShop, item(57, B, C, _), inventCounter(Y), currGold(Gold),
  (Gold > 99 -> !,
  ( (Y+1) < 101 -> !, retract(currGold(Gold)), NewGold is (Gold-100), asserta(currGold(NewGold)),
  write('You got a '), write(C), write(' '), write(B), addToInvent(57), nl
  ; !, write('Your inventory is full'), nl)
  ; !, write('You cant afford a Strength potion (100 gold)')).

spotion :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

spotion :-
  \+isShop,
  write('You must go to the shop first!'), nl, !.

rpotion :-
  isShop, item(58, B, C, _), inventCounter(Y), currGold(Gold),
  (Gold > 99 -> !,
  ( (Y+1) < 101 -> !, retract(currGold(Gold)), NewGold is (Gold-100), asserta(currGold(NewGold)),
  write('You got a '), write(C), write(' '), write(B), addToInvent(58), nl
  ; !, write('Your inventory is full'), nl)
  ; !, write('You cant afford a potion (100 gold)')).

rpotion :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

rpotion :-
  \+isShop,
  write('You must go to the shop first!'), nl, !.

exitShop :-
  \+isShop,
  write('Exit from what?!, Youre not even in the shop!'), nl, !.

exitShop :-
  isShop,
  retract(isShop), write('Thanks for coming.'), !.
