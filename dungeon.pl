:- dynamic(isDungeon/0).

dungeon :-
    \+isPlay,
    write('You must start the game first!'), nl, !.

 dungeon :-
    isPlay, player(X, Y),
    (X =:= 13, Y =:= 13 -> !, asserta(isDungeon),nl,
    write('== WELCOME TO THE DUNGEON =='),nl,
    write('Once you fight the boss, you cant run or escape the dungeon'),nl,
    write('type "fightBoss." again if you are ready to fight the boss'),nl,
    write('type "exitDungeon." to exit the dungeon'),nl
    ; !, write('You must go to the dungeon first!'), nl).

fightBoss :-
        \+isPlay,
        write('You must start the game first!'), nl, !.
fightBoss :-
        \+isDungeon,
        write('You must do "dungeon." first'), nl, !.
fightBoss :-
      write('Goodluck!'),nl,
      decideboss, !.

exitDungeon :- retract(isDungeon), write('Exiting dungeon...'), !.

/* Test bossbattle nya masih error pas dijalanin*/
