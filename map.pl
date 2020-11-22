:- dynamic(quest/2).
:- dynamic(dungeon/2).
:- dynamic(store/2).
:- dynamic(player/2).
:- dynamic(isMulai/0).

lebarpeta(15).
tinggipeta(15).

mulai :- asserta(isMulai),
	asserta(player(3,2)),
	asserta(quest(5,10)),
	asserta(dungeon(13,13)),
	asserta(store(12,4)),
	!.

borderatas(_,Y) :-
	Y =:= 0,!.
borderbawah(_,Y) :-
	tinggipeta(T),
	Ymax is T+1,
	Y =:= Ymax,!.
borderkiri(X,_) :-
	X =:= 0,!.
borderkanan(X,_) :-
	lebarpeta(L),
	Xmax is L+1,
	X =:= Xmax,!.

printpeta(X,Y) :-
	borderatas(X,Y), !, write('#').
printpeta(X,Y) :-
	borderbawah(X,Y), !, write('#').
printpeta(X,Y) :-
	borderkiri(X,Y), !, write('#').
printpeta(X,Y) :-
	borderkanan(X,Y), !, write('#').

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

map:-
	\+isMulai,
	write('jalankan command (mulai.) terlebih dahulu'), nl, !.
map:-
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
