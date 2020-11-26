:- dynamic(isQuest/0).

questInfo :-
    \+isPlay,
    write('You must start the game first!'), nl, !.

questInfo :-
    write('Lv 1-5 : 3 Goblin, 1 Orc, 1 Undead (70Exp, 70 Gold)'), nl,
    write('Lv 5-10 : 5 Goblin, 2 Orc, 2 Undead (120Exp, 100 Gold)'), nl,
    write('Lv 10-15 :8 Goblin, 4 Orc, 3 Undead (200Exp, 150 Gold)'), nl,
    write('Lv 15-20 :10 Goblin, 6 Orc, 4 Undead (300Exp, 210 Gold)'), nl.

quest :-
    \+isPlay,
    write('You must start the game first!'), nl, !.


 quest :-
    isPlay, player(X, Y),
    (X =:= 5, Y =:= 10 -> !, asserta(isQuest), nl
    ; !, write('You must go to the quest first!'), nl).

quest :-
      isPlay, isQuest,
      currentLevel(X),
      (X < 6 -> !, write('Your quest is kill 3 Goblin, 1 Orc, 1 Undead (70Exp, 70 Gold)'), nl
      ; 5 < X, X < 11 -> !, write('Your quest is kill 5 Goblin, 2 Orc, 2 Undead (120Exp, 100 Gold)'), nl
      ; 10 < X, X < 16 -> !, write('Your quest is kill 8 Goblin, 4 Orc, 3 Undead (200Exp, 150 Gold)'), nl
      ; 15 < X -> !, write('Your quest is kill 10 Goblin, 6 Orc, 4 Undead (300Exp, 210 Gold)'), nl).

quest :-
      \+isPlay,
      write('You must start the game first!'), nl, !.

quest :-
      \+isQuest,
      write('You must go to the shop first!'), nl, !.
