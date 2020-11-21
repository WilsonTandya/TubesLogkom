:- include('item.pl').

:- dynamic(isShop/0).

shop :- 
  isPlay, asserta(isShop), 
  write('What do you want to buy?'), nl, 
  write('1. Gacha (500 gold)'), nl,
  write('2. Potion (100 gold)'), nl.

shop :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

gacha :- 
  isPlay, isShop, 
  random(1, 101, X), random(1, 10, Y),
  (X < 31 -> write('You got a '),  write('Potion'), nl
  ; 30 < X, X < 61 -> write('You got a '),  write('Uncommon'), nl
  ; 60 < X, X < 81 -> write('You got a '),  write('Rare'), nl
  ; 80 < X, X < 94 -> write('You got a '),  write('Enchanted'), nl
  ; 93 < X, X < 99 -> write('You got a '),  write('Epic'), nl
  ; 98 < X, X < 101 -> write('You got a '),  write('Ultimate'), nl).

gacha :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

gacha :-
  \+isShop,
  write('You must go to the shop first!'), nl, !.

potion :- 
  isShop, 
  write('You got a potion'), nl, !.

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