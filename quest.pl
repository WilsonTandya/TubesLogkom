:- dynamic(isQuest/0).
:- dynamic(haveQuest/0).
:- dynamic(goalQuest/5).
:- dynamic(goalCounter/3).

:- discontiguous(questInfo/0).
:- discontiguous(quest/0).
:- discontiguous(takeQuest/0).
:- discontiguous(questDone/0).
:- discontiguous(showQuest/0).
:- discontiguous(exitQuest/0).
questInfo :-
    \+isPlay,
    write('You must start the game first!'), nl, !.

questInfo :-
    write('Lv 1-5 : 3 Goblin, 1 Orc, 1 Undead (Reward: 70Exp, 70 Gold)'), nl,
    write('Lv 5-10 : 5 Goblin, 2 Orc, 2 Undead (Reward: 120Exp, 100 Gold)'), nl,
    write('Lv 10-15 :8 Goblin, 4 Orc, 3 Undead (Reward: 200Exp, 150 Gold)'), nl,
    write('Lv 15-20 :10 Goblin, 6 Orc, 4 Undead (Reward: 300Exp, 210 Gold)'), nl.

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
    write('"showQuest." to see current quest status'), nl,
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
      currLevel(X), write('You just took a quest'), asserta(haveQuest), nl,
      (X < 6 -> !, write('Your quest : kill 3 Goblin, 1 Orc, 1 Undead (70Exp, 70 Gold)'), asserta(goalQuest(3,1,1,70,70)), nl
      ; 5 < X, X < 11 -> !, write('Your quest : kill 5 Goblin, 2 Orc, 2 Undead (120Exp, 100 Gold)'), asserta(goalQuest(5,2,2,120,100)), nl
      ; 10 < X, X < 16 -> !, write('Your quest : kill 8 Goblin, 4 Orc, 3 Undead (200Exp, 150 Gold)'), asserta(goalQuest(8,4,3,200,150)), nl
      ; 15 < X -> !, write('Your quest : kill 10 Goblin, 6 Orc, 4 Undead (300Exp, 210 Gold)'),asserta(goalQuest(10,6,4,300,210)), nl),
      asserta(goalCounter(0,0,0)).

questDone :-
    retract(goalQuest(_,_,_,Exp,Gold)),
    retract(goalCounter(_,_,_)),
    write('Congratulation your quest is completed!'), nl, write('You receive '), write(Exp),
    write(' EXP and '), write(Gold), write(' Gold!'),
    retract(haveQuest),
    retract(currGold(X)), Z is X + Gold;
    asserta(currGold(Z)),
    levelUp(Exp).

showQuest :-
    isPlay, haveQuest,
    goalCounter(A,B,C),
    goalQuest(D,E,F,Exp,Gold),
    write('Your quest : kill '), write(D), write(' Goblin, '), write(E), write(' Orc, '), write(F), write(' Undead'),nl,
    write('Your quest kill counter : '), write(A), write(' Goblin, '), write(B), write(' Orc, '), write(C), write(' Undead'),nl
    ,write('Complete this quest to get '), write(Exp), write(' Exp and '), write(Gold), write(' Gold'), nl, !.
showQuest :-
    isPlay, \+haveQuest,
    write('You dont have any quest right now'), nl, !.
showQuest :-
        \+isPlay,
        write('You must start the game first!'), nl, !.

exitQuest :- retract(isQuest), write('Exiting quest station'), !.
