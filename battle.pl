:- include('player.pl').

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

randomenemy :-
    repeat,
        random(1, 3, Nomer),
        id(Monster, Nomer),
        retractall(monster(_)),
        asserta(monster(Monster)), !,
        write('You found a '),
        monster(Monster),
        write(Monster), nl,
        write('Level : '), level(Monster, A), write(Y), nl,
        write('Health : '), health(Monster, B), write(Z), nl,
        write('Attack : '), att(Monster, C), write(Y), nl,
        write('Defense : '), def(Monster, D), write(Z), nl.

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
    monster(Monster),
    att(Player,Att),
    def(Monster,Def),
    calculate(Att,Def,X),
    NewAtt is X,
    serang(Monster,NewAtt),
    nl,
    !,
    (\+checkvictory ->
        write('You deal '),
        write(NewAtt),
        write(' damage')
        nl,
        !,
        enemyAttack, 
        !, fail
        ;
        !, fail
    ),
    !.

enemyAttack :-
    monster(Monster),
    att(Monster, Att),    
    def(Player, Def),
    enemyturn(Enemyturn),
    (Enemyturn mod 3 == 0 ->
        SAtt is Att * 2
        ;
        SAtt is Att
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
    health(T, HP),
    NewHP is HP - Att,
    (NewHP =< 0 ->
        FinalHP is 0
        ;
        FinalHP is NewHP
    ),
    retractall(health(T, HP)),
    asserta(health(T, FinalHP)).

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
    def(Monster,Def),
    att(Player,Att),
    SAtt is Att * 2,
    calculate(SAtt, Def, X),
    NewAtt is X,
    serang(Monster, NewAtt),
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
    exp(Player,CurrentExp),
    NewExp is CurrentExp + Exp,
    (NewExp >= 100 ->
        level(Player,CurrentLevel),
        NewLevel is CurrentLevel + (NewExp // 100),
        retractall(level(Player,_)),
        asserta(level(Player,NewLevel)),
        FinalExp is NewExp mod 100,
        retractall(exp(Player,_)),
        asserta(exp(Player,FinalExp))
        ;
        retractall(exp(Player,_)),
        asserta(exp(Player,NewExp))
    ).

checkvictory :-
    monster(Monster),
    health(Monster, Health),
    exp(Monster, Exp),
    levelUp(Player,Exp),
    Health =< 0,
    (id(Monster,4) ->
        write('The battle is over. You defeated the ancient '),
        write(Monster),
        write('.'),
        write('You are the chosen one. You will become the savior of this world.').
        write('Thank you for playing.'),
        quitwin
        ;
        write('The ')
        write(Monster),
        write(' is defeated.') ,nl,
        write('You gain '),
        write(Exp), 
        write(' exp'),nl,
        retractall(turn(_)),
        asserta(turn(0)),!
    ).

checklose :-
    player(Player),
    health(Player, Health),
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
        write('Level : '), level(Monster, A), write(Y), nl,
        write('Health : '), health(Monster, B), write(Z), nl,
        write('Attack : '), att(Monster, C), write(Y), nl,
        write('Defense : '), def(Monster, D), write(Z), nl.

quitwin :-
    halt.