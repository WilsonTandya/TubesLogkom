:- dynamic(isShop/0).

shop :- asserta(isShop), 
  write('What do you want to buy?'), nl, 
  write('1. Gacha (500 gold)'), nl,
  write('2. Potion (100 gold)'), nl.

gacha :- 
  isShop, 
  random(1, 101, X),
  (X < 31 -> write('You got a '),  write('Potion'), write(X), nl
  ; 30 < X, X < 61 -> write('You got a '),  write('Uncommon'), write(X), nl
  ; 60 < X, X < 81 -> write('You got a '),  write('Rare'), write(X), nl
  ; 80 < X, X < 94 -> write('You got a '),  write('Enchanted'), write(X), nl
  ; 93 < X, X < 99 -> write('You got a '),  write('Epic'), write(X), nl
  ; 98 < X, X < 101 -> write('You got a '),  write('Ultimate'), write(X), nl).

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