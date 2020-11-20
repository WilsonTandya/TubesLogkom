:- dynamic(isShop/0).

shop :- asserta(isShop), 
  write('What do you want to buy?'), nl, 
  write('1. Gacha (500 gold)'), nl,
  write('2. Potion (100 gold)'), nl.

gacha :- 
  isShop, 
  write('You got a'), random(1,3,X), write(X), nl, !.

gacha :-
  \+isShop,
  write('You must go to the shop first!'), nl, !.

potion :- 
  isShop, 
  write('You got a potion'), nl, !.

potion :-
  \+isShop,
  write('You must go to the shop first!'), nl, !.

/* 
Todo
1. probabilitas
2. ngecek di map apakah lagi posisi di shop
3. ngecek uang cukup
4. ngecek inventory cukup
5. masuk ke inventory
*/