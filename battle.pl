:- include('quest.pl').
:- dynamic(battle/1).
:- dynamic(monster/1).
:- dynamic(sAttack/1).
:- dynamic(gagalRun/1).
:- dynamic(turn/1).
:- dynamic(enemyturn/1).
:- dynamic(currHPM/2).
:- dynamic(level/2).
:- discontiguous(levelUp/1).
:- discontiguous(decide/0).
:- discontiguous(run/0).
:- discontiguous(enemyAttack/0).
:- discontiguous(serang/2).
:- discontiguous(serangM/1).
:- discontiguous(attack/0).
:- discontiguous(specialAttack/0).
:- discontiguous(checklose/0).
:- discontiguous(checkvictory/0).


id(goblin,1).
id(orc,2).
id(undead,3).
id(dragon,4).
baseHPM(goblin,100).
baseHPM(orc,150).
baseHPM(undead,200).
baseHPM(dragon,4200).
currAttM(goblin,20).
currAttM(orc,25).
currAttM(undead,30).
currAttM(dragon,690).
currDefM(goblin,5).
currDefM(orc,10).
currDefM(undead,15).
currDefM(dragon,420).
gold(goblin,10).
gold(orc,15).
gold(undead,20).
gold(dragon,9001).
exp(goblin,10).
exp(orc,15).
exp(undead,20).
exp(dragon,0).

initBattle :-
    asserta(currHPM(goblin,100)),
    asserta(currHPM(orc,150)),
    asserta(currHPM(undead,200)),
    asserta(curHPM(dragon,4200)),
    asserta(level(goblin,1)),
    asserta(level(orc,1)),
    asserta(level(undead,1)),
    asserta(level(dragon,69)),
    asserta(turn(0)), asserta(enemyturn(0)).

randomenemy :-
    repeat,
        random(1, 4, Nomer),
        id(Monster, Nomer),
        retractall(monster(_)),
        asserta(monster(Monster)), !,
        write('You found an evil '),
        write(Monster), nl,
        write('Level : '), level(Monster, A), write(A), nl,
        write('Health : '), currHPM(Monster, B), write(B), nl,
        write('Attack : '), currAttM(Monster, C), write(C), nl,
        write('Defense : '), currDefM(Monster, D), write(D), nl,
        asserta(battle(1)).

decide :-
    randomenemy,
    write('What will you do?'), nl.

run:-
	\+isPlay,
	write('This command can only be used after the game starts.'), nl,
	write('use "start." to start the game.'), nl, !.
run:-
    monster(dragon),
    write('You cannot run from a boss battle!'),nl,!.
run :-
    random(0,5,Result),
	(Result =:= 0 -> berhasilrun; gagalrun).


berhasilrun :-
    write('You successfully fled.'), nl,
    monster(Monster),
    baseHPM(Monster,BaseHP),
    retractall(currHPM(Monster,_)),
    asserta(currHPM(Monster,BaseHP)),
    retractall(gagalRun(_)),
    retractall(sAttack(_)),
    retractall(battle(_)),
    retractall(monster(_)),
    retractall(turn(_)),
    asserta(turn(0)),
    retractall(enemyturn(_)),
    asserta(enemyturn(0)),
    !, fail.

gagalrun :-
    write('Your attempt to flee failed.'), nl,
    turn(Turn),
    NewTurn is Turn + 1,
    retractall(turn(_)),
    asserta(turn(NewTurn)),
    enemyAttack.

attack :-
    \+battle(_),
    write('You are not currently battling.'),nl,!.

attack :-
    monster(Monster),
    currAtt(Att),
    currDefM(Monster,Def),
    calculate(Att,Def,X),
    NewAtt is X,
    serang(Monster,NewAtt),
    nl,
    turn(Turn),
    NewTurn is Turn + 1,
    retractall(turn(_)),
    asserta(turn(NewTurn)),
    !,
    (\+checkvictory ->
        write('You deal '),
        write(NewAtt),
        write(' damage'),
        nl,
        !,
        enemyAttack,
        !
        ;
        !
    ),
    !.

enemyAttack :-
    monster(Monster),
    currAttM(Monster, Att),
    currDef(Def),
    enemyturn(Enemyturn),
    (Enemyturn mod 3 == 0 ->
        SAtt is Att * 2
        ;
        SAtt is Att
    ),
    calculate(SAtt, Def, X),
    NewAtt is X,
    serangM(NewAtt),
    NewEnemyturn is Enemyturn + 1,
    retractall(enemyturn(_)),
    asserta(enemyturn(NewEnemyturn)),
    !,
    (\+checklose ->
        write(Monster),
        write(' deal '),
        write(NewAtt),
        write(' damage'),
        nl,
        !, fail
        ;
        !, fail
    ),
    !.

serang(T, Att) :-
    currHPM(T, HP),
    NewHP is HP - Att,
    (NewHP =< 0 ->
        FinalHP is 0
        ;
        FinalHP is NewHP
    ),
    retractall(currHPM(T,_)),
    asserta(currHPM(T, FinalHP)).

serangM(Att) :-
    currHP(HP),
    NewHP is HP - Att,
    (NewHP =< 0 ->
        FinalHP is 0
        ;
        FinalHP is NewHP
    ),
    retractall(currHP(_)),
    asserta(currHP(FinalHP)).

calculate(Att,Def,X) :-
    NewAtt is Att - Def,
    (NewAtt =< 0 ->
        X is 0
        ;
        X is NewAtt
    ).


specialAttack :-
    \+battle(_),
    write('You are not currently battling.'), nl,
    !, fail.

specialAttack :-
    turn(Turn),
    Turn < 3,
    write('You can only use special attack once every 3 turns.'), nl,
    !, fail.

specialAttack :-
    turn(Turn),
    Turn > 2,
    monster(Monster),
    currDefM(Monster,Def),
    currAtt(Att),
    SAtt is Att * 3,
    calculate(SAtt, Def, X),
    NewAtt is X,
    serang(Monster, NewAtt),
    nl,
    !,
    write(' You use your special attack.'),
    write('You deal '),
    write(NewAtt),
    write(' damage'),
    retractall(turn(_)),
    asserta(turn(0)),
    !,
    \+checkvictory,
    !, fail.

levelUp(Exp) :-
    currExp(CurrentExp),
    NewExp is CurrentExp + Exp,
    (NewExp >= 100 ->
        currLevel(CurrentLevel),
        NewLevel is CurrentLevel + (NewExp // 100),
        retractall(currLevel(_)),
        asserta(currLevel(NewLevel)),
        retractall(level(goblin,_)),
        asserta(level(goblin,NewLevel)),
        retractall(level(orc,_)),
        asserta(level(orc,NewLevel)),
        retractall(level(undead,_)),
        asserta(level(undead,NewLevel)),
        FinalExp is NewExp mod 100,
        retractall(currExp(_)),
        asserta(currExp(FinalExp)),
        write('Congratulations, you leveled up!'),
        write('You are now level '),
        write(NewLevel)
        ;
        retractall(currExp(_)),
        asserta(currExp(NewExp))
    ).


checkvictory :-
    monster(Monster),
    currHPM(Monster, Health),
    baseHPM(Monster,BaseHealth),
    exp(Monster, Exp),
    currGold(GoldPlayer),
    gold(Monster, GoldMonster),
    Health =< 0,
    (id(Monster,4) ->
        write('The battle is over. You defeated the ancient '),
        write(Monster),
        write('.'),
        write('You are the chosen one. You will become the savior of this world.'),nl,
        write('Thank you for playing.'),
        quitwin
        ;
        write('The '),
        write(Monster),
        write(' is defeated.') ,nl,
        write('You gain '),
        write(Exp),
        write(' exp'),nl,
        write('You gain '),
        write(GoldMonster),
        write(' gold coins'),nl,
        levelUp(Exp),
        NewGold is GoldPlayer + GoldMonster,
        retractall(currGold(_)),
        asserta(currGold(NewGold)),
        (haveQuest -> retract(goalCounter(X,Y,Z)), (Monster == goblin -> X1 is X+1, asserta(goalCounter(X1,Y,Z));
        Monster == orc -> Y1 is Y+1, asserta(goalCounter(X,Y1,Z));
        Z1 is Z+1, asserta(goalCounter(X,Y,Z1))), goalCounter(A,B,C), goalQuest(D,E,F,_,_), (A >= D, B >= E, C>= F -> questDone;showQuest)
        ;write('')),
        retractall(turn(_)),
        asserta(turn(0)),
        retractall(currHPM(Monster,_)),
        asserta(currHPM(Monster,BaseHealth)),
        retractall(battle(_)),
        retractall(monster(_)),!
    ).

checklose :-
    currHP(Health),
    Health =< 0,
    write('You died!'),nl,
    write('GAME OVER'),nl,
    halt.

bossbattle:-
    repeat,
        id(Monster, 4),
        retractall(monster(_)),
        asserta(monster(Monster)), !,
        write('You awaken the ancient '),
        monster(Monster),
        write(Monster), nl,
        write('Level : '), level(Monster, A), write(A), nl,
        write('Health : '), currHPM(Monster, B), write(B), nl,
        write('Attack : '), currAttM(Monster, C), write(C), nl,
        write('Defense : '), currDefM(Monster, D), write(D), nl,
        asserta(battle(1)).

quitwin :-
    halt.

usepotion:-
    itemCounter(potion,X),
    X is 0,
    write('You currently do not have any potions.'), nl,
    !, fail.


usepotion :-
    \+isPlay,
    maxHP(MaxHP),
    currHP(CurrentHP),
    item(55, potion, health, AddHP),
    delFromInvent(55),
    NewHP is CurrentHP + AddHP,
    (NewHP > MaxHP ->
        NewCurrentHP is MaxHP
        ;
        NewCurrentHP is NewHP
    ),
    retractall(currHP(_)),
    asserta(currHP(NewCurrentHP)),
    turn(Turn),
    NewTurn is Turn + 1,
    retractall(turn(_)),
    asserta(turn(NewTurn)),
    enemyAttack,
    !.
