:- dynamic(battle/1).
:- dynamic(monster/1).
:- dynamic(sAttack/1).
:- dynamic(gagalRun/1).
:- dynamic(pilih/1).
:- dynamic(turn/1).
:- dynamic(enemyturn/1).

:- discontiguous(levelUp/1).
:- discontiguous(decide/0).
:- discontiguous(run/0).
:- discontiguous(enemyAttack/0).
:- discontiguous(serang/2).
:- discontiguous(attack/0).
:- discontiguous(specialAttack/0).
:- discontiguous(checklose/0).
:- discontiguous(checkvictory/0).

turn(0).
id(goblin,1).
id(orc,2).
id(undead,3).
id(dragon,4).
currHP(goblin,100).
currHP(orc,150).
currHP(undead,200).
currHP(dragon,4200).
baseHP(goblin,100).
baseHP(orc,150).
baseHP(undead,200).
baseHP(dragon,4200).
currAtt(goblin,20).
currAtt(orc,25).
currAtt(undead,30).
currAtt(dragon,690).
currDef(goblin,5).
currDef(orc,10).
currDef(undead,15).
currDef(dragon,420).
level(goblin,1).
level(orc,1).
level(undead,1).
level(dragon,69).
gold(goblin,10).
gold(orc,15).
gold(undead,20).
exp(goblin,10).
exp(orc,15).
exp(undead,20).

randomenemy :-
    repeat,
        random(1, 4, Nomer),
        id(Monster, Nomer),
        retractall(monster(_)),
        asserta(monster(Monster)), !,
        write('You found a '),
        monster(Monster),
        write(Monster), nl,
        write('Level : '), level(Monster, A), write(A), nl,
        write('Health : '), currHP(Monster, B), write(B), nl,
        write('Attack : '), currAtt(Monster, C), write(C), nl,
        write('Defense : '), currDef(Monster, D), write(D), nl,
        asserta(battle(1)).

decide :-
    randomenemy,
    write('What will you do?'), nl,
    asserta(pilih(1)).

run:-
	\+playing(_),
	write('This command can only be used after the game starts.'), nl,
	write('use "start." to start the game.'), nl, !.
run :-
    random(0,4,Result),	
	(Result =:= 0 -> berhasilrun; gagalrun).


berhasilrun :-
    write('You successfully fled.'), nl,
    retractall(gagalRun(_)),
    retractall(sAttack(_)),
    retractall(battle(_)),
    retractall(monster(_)),
    retractall(turn(_)),
    asserta(turn(0)),
    retractall(enemyturn(_)),
    asserta(enemyturn(0)),
    retract(pilih(1)),
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
    job(Player),
    monster(Monster),
    currAtt(Player,Att),
    currDef(Monster,Def),
    calculate(Att,Def,X),
    NewAtt is X,
    serang(Monster,NewAtt),
    nl,
    !,
    (\+checkvictory ->
        write('You deal '),
        write(NewAtt),
        write(' damage'),
        nl,
        !,
        enemyAttack, 
        !, fail
        ;
        !, fail
    ),
    retract(pilih(1)),
    turn(Turn),
    NewTurn is Turn + 1,
    retractall(turn(_)),
    asserta(turn(NewTurn)),
    !.

enemyAttack :-
    job(Player),
    monster(Monster),
    currAtt(Monster, Att),    
    currDef(Player, Def),
    enemyturn(Enemyturn),
    (Enemyturn mod 3 == 0 ->
        SAtt is Att * 2
        ;
        SAtt is Att
    ),
    calculate(SAtt, Def, X),
    NewAtt is X,
    serang(Player, NewAtt),
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
    currHP(T, HP),
    NewHP is HP - Att,
    (NewHP =< 0 ->
        FinalHP is 0
        ;
        FinalHP is NewHP
    ),
    retractall(currHP(T, HP)),
    asserta(currHP(T, FinalHP)).

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
    job(Player),
    turn(Turn),
    Turn > 2,
    monster(Monster),
    currDef(Monster,Def),
    currAtt(Player,Att),
    SAtt is Att * 2,
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

levelUp(Player,Exp) :-
    job(Player),
    exp(Player,CurrentExp),
    NewExp is CurrentExp + Exp,
    (NewExp >= 100 ->
        level(Player,CurrentLevel),
        NewLevel is CurrentLevel + (NewExp // 100),
        retractall(level(Player,_)),
        asserta(level(Player,NewLevel)),
        retractall(level(goblin,_)),
        asserta(level(goblin,NewLevel)),
        retractall(level(orc,_)),
        asserta(level(orc,NewLevel)),
        retractall(level(undead,_)),
        asserta(level(undead,NewLevel)),
        FinalExp is NewExp mod 100,
        retractall(exp(Player,_)),
        asserta(exp(Player,FinalExp)),
        write('Congratulations, you leveled up!'),
        write('You are now level '),
        write(NewLevel)
        ;
        retractall(exp(Player,_)),
        asserta(exp(Player,NewExp))
    ).

checkvictory :-
    job(Player),
    monster(Monster),
    currHP(Monster, Health),
    baseHP(Monster,BaseHealth),
    exp(Monster, Exp),
    gold(Player, GoldPlayer),
    gold(Monster, GoldMonster),
    NewGold is GoldPlayer + GoldMonster,
    retractall(gold(Player,_)),
    asserta(gold(Player,NewGold)),
    levelUp(Player,Exp),
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
        retractall(turn(_)),
        asserta(turn(0)),
        retractall(currHP(Monster,_)),
        asserta(currHP(Monster,BaseHealth)),
        retractall(monster(_)),!
        
    ).

checklose :-
    job(Player),
    currHP(Player, Health),
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
        write('Health : '), currHP(Monster, B), write(B), nl,
        write('Attack : '), currAtt(Monster, C), write(C), nl,
        write('Defense : '), currDef(Monster, D), write(D), nl,
        asserta(battle(1)).

quitwin :-
    halt.

usepotion:-
    itemCounter(potion,X),
    X is 0,
    write('You currently do not have any potions.'), nl,
    !, fail.


usepotion :-
    job(Player),
    maxHP(Player,MaxHP),
    currHP(Player,CurrentHP),
    item(55, potion, health, AddHP),
    retractall(itemCounter(potion,_)),
    delFromInvent(55),
    NewHP is CurrentHP + AddHP,
    (NewHP > MaxHP ->
        NewCurrentHP is MaxHP 
        ;
        NewCurrentHP is NewHP
    ),
    retractall(currHP(Player,_)),
    asserta(currHP(Player,NewCurrentHP)),
    turn(Turn),
    NewTurn is Turn + 1,
    retractall(turn(_)),
    asserta(turn(NewTurn)),
    enemyAttack,
    !.
