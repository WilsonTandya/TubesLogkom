:- dynamic(isQuest/0).
:- dynamic(haveQuest/0).

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
    (X =:= 5, Y =:= 10 -> !, asserta(isQuest),
    write('Welcome to the quest station'),nl,
    write('You can do : '),nl,
    write('"questInfo." to see quest information'),nl,
    write('"takeQuest." to take quest'), nl,
    write('"exitQuest." to leave the quest station'), nl
    ; !, write('You must go to the quest first!'), nl).

takeQuest :-
        \+isPlay,
        write('You must start the game first!'), nl, !.
takeQuest :-
        \+isQuest,
        write('You must do "quest." first'), nl, !.
takeQuest :-
        haveQuest,
        write('You already have a quest running'), nl, !.
takeQuest :-
      \+haveQuest, isPlay, isQuest,
      currentLevel(X), write('You just took a quest'), asserta(haveQuest), nl,
      (X < 6 -> !, write('Your quest : kill 3 Goblin, 1 Orc, 1 Undead (70Exp, 70 Gold)'), nl
      ; 5 < X, X < 11 -> !, write('Your quest : kill 5 Goblin, 2 Orc, 2 Undead (120Exp, 100 Gold)'), nl
      ; 10 < X, X < 16 -> !, write('Your quest : kill 8 Goblin, 4 Orc, 3 Undead (200Exp, 150 Gold)'), nl
      ; 15 < X -> !, write('Your quest : kill 10 Goblin, 6 Orc, 4 Undead (300Exp, 210 Gold)'), nl).

exitQuest :- retract(isQuest), write('Exiting quest'), !.

/* Quest klo kelar harus hapus haveQuest*/
/* tambahin sistem quest dan ngitung udah bunuh berapanya*/
