:- dynamic(quest/2).
:- dynamic(dungeon/2).
:- dynamic(store/2).
:- dynamic(player/2).
:- dynamic(obstacle/2).

lebarpeta(15).
tinggipeta(15).

/* pagaratas Y = 0 */
pagaratas(_,Y) :-
	Y =:= 0,!.
/* pagarbawah tinggipeta+1 */
pagarbawah(_,Y) :-
	tinggipeta(T),
	Ymax is T+1,
	Y =:= Ymax,!.
/* pagarkiri X = 0 */
pagarkiri(X,_) :-
	X =:= 0,!.
/* pagarkiri lebarpeta+1 */
pagarkanan(X,_) :-
	lebarpeta(L),
	Xmax is L+1,
	X =:= Xmax,!.

/* print peta untuk pager */
printpeta(X,Y) :-
	pagaratas(X,Y), !, write('#').
printpeta(X,Y) :-
	pagarbawah(X,Y), !, write('#').
printpeta(X,Y) :-
	pagarkiri(X,Y), !, write('#').
printpeta(X,Y) :-
	pagarkanan(X,Y), !, write('#').
printpeta(X,Y) :-
	obstacle(X,Y), !, write('#').

/* print peta untuk objek */
printpeta(X,Y) :-
	player(X,Y), !, write('P').
printpeta(X,Y) :-
	quest(X,Y), !, write('Q').
printpeta(X,Y) :-
	dungeon(X,Y), !, write('D').
printpeta(X,Y) :-
	store(X,Y), !, write('S').
/*Print sisa peta*/
printpeta(_,_) :-
	write('-').

map :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

map:-
	asserta(isMulai),
	asserta(player(3,2)),
	asserta(quest(5,10)),
	asserta(dungeon(13,13)),
	asserta(store(12,4)),
	/* Obstacle atas kiri */
	asserta(obstacle(6,2)),asserta(obstacle(6,3)),asserta(obstacle(6,4)),
	asserta(obstacle(6,5)),asserta(obstacle(5,5)),asserta(obstacle(4,5)),
	asserta(obstacle(3,5)),
	/* Obstacle Quest */
	asserta(obstacle(4,9)),asserta(obstacle(5,9)),asserta(obstacle(6,9)),
	asserta(obstacle(7,9)),asserta(obstacle(7,10)),asserta(obstacle(7,11)),
	asserta(obstacle(3,9)),asserta(obstacle(3,10)),asserta(obstacle(3,11)),
	/* Obstacle Dungeon */
	asserta(obstacle(11,14)),asserta(obstacle(11,13)),
	asserta(obstacle(12,14)),asserta(obstacle(13,14)),asserta(obstacle(14,14)),
	asserta(obstacle(11,12)),asserta(obstacle(12,12)),asserta(obstacle(13,12)),
	asserta(obstacle(14,12)),asserta(obstacle(15,12)),
	tinggipeta(T),
	lebarpeta(L),
	X is 0,
	Xmax is L+1,
	Y is 0,
	Ymax is T+1,
	forall(between(Y, Ymax, J), (
		forall(between(X, Xmax, I), (
			printpeta(I,J))),nl)),
	write(' Legenda:'), nl,
	write('    P = Player'), nl,
	write('    Q = Quest'), nl,
	write('    D = Dungeon'), nl,
	write('    S = Store'), nl, nl,
	!.
