w :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

w :-
  \+jobIsSelected,
  write('You must choose your job first!'), nl, !.

w :-
  isShop,
  write('You must exitShop. first!'), nl, !.
w :-
    isQuest,
    write('You must exitQuest. first!'), nl, !.
w :-
  isDungeon,
  write('You must exitDungeon. first!'), nl, !.

w :-
  monster(_),
  write('You have an ongoing battle!'), nl, !.

w :-
  isPlay, player(_, Y),
  Y =:= 1,
  write('You cant move north! there is an obstacle in front of you'), nl, !.

w :-
  isPlay, player(X, Y), obstacle(X, Z),
  Y-1 =:= Z,
  write('You cant move north! there is an obstacle in front of you'), nl, !.

w :-
  isPlay, retract(player(X,Y)),
	NewY is Y - 1,
	write('You move north'), nl,
	asserta(player(X, NewY)),
  random(1,3, Enemy), (Enemy =:= 1 -> decide;write('')),
	!.

a :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

a :-
  \+jobIsSelected,
  write('You must choose your job first!'), nl, !.

a :-
  isShop,
  write('You must exitShop. first!'), nl, !.
a :-
      isQuest,
      write('You must exitQuest. first!'), nl, !.
a :-
    isDungeon,
    write('You must exitDungeon. first!'), nl, !.
a :-
  monster(_),
  write('You have an ongoing battle!'), nl, !.

a :-
  isPlay, player(X, _),
  X =:= 1,
  write('You cant move west! there is an obstacle on your left'), nl, !.

a :-
  isPlay, player(X, Y), obstacle(Z, Y),
  X-1 =:= Z,
  write('You cant move west! there is an obstacle on your left'), nl, !.

a :-
  isPlay, retract(player(X,Y)),
	NewX is X - 1,
	write('You move west'), nl,
	asserta(player(NewX, Y)),
  random(1,3, Enemy), (Enemy =:= 1 -> decide;write('')),
	!.

s :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

s :-
  \+jobIsSelected,
  write('You must choose your job first!'), nl, !.

s :-
  isShop,
  write('You must exitShop. first!'), nl, !.
s :-
      isQuest,
      write('You must exitQuest. first!'), nl, !.
s :-
    isDungeon,
    write('You must exitDungeon. first!'), nl, !.
s :-
  monster(_),
  write('You have an ongoing battle!'), nl, !.

s :-
  isPlay, player(_, Y),
  Y =:= 15,
  write('You cant move south! there is an obstacle behind you'), nl, !.

s :-
  isPlay, player(X, Y), obstacle(X, Z),
  Y+1 =:= Z,
  write('You cant move south! there is an obstacle behind you'), nl, !.

s :-
  isPlay, retract(player(X,Y)),
	NewY is Y + 1,
	write('You move south'), nl,
	asserta(player(X, NewY)),
  random(1,3, Enemy), (Enemy =:= 1 -> decide;write('')),
	!.

d :-
  \+isPlay,
  write('You must start the game first!'), nl, !.

d :-
  \+jobIsSelected,
  write('You must choose your job first!'), nl, !.

d :-
  isShop,
  write('You must exitShop. first!'), nl, !.
d :-
      isQuest,
      write('You must exitQuest. first!'), nl, !.
 d :-
    isDungeon,
    write('You must exitDungeon. first!'), nl, !.
d :-
  monster(_),
  write('You have an ongoing battle!'), nl, !.

d :-
  isPlay, player(X, _),
  X =:= 15,
  write('You cant move east! there is an obstacle on your right'), nl, !.

d :-
  isPlay, player(X, Y), obstacle(Z, Y),
  X+1 =:= Z,
  write('You cant move east! there is an obstacle on your right'), nl, !.

d :-
  isPlay, retract(player(X,Y)),
	NewX is X + 1,
	write('You move east'), nl,
	asserta(player(NewX, Y)),
  random(1,3, Enemy), (Enemy =:= 1 -> decide;write('')),
	!.
