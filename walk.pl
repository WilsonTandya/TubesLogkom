w :-  
  isPlay, retract(player(X,Y)),
	NewY is Y - 1,
	write('You move forward'), nl,
	asserta(player(X, NewY)),
	!.
a :- 
  isPlay, retract(player(X,Y)),
	NewX is X - 1,
	write('You move west'), nl,
	asserta(player(NewX, Y)), 
	!.
s :- 
  isPlay, retract(player(X,Y)),
	NewY is Y + 1,
	write('You move backward'), nl,
	asserta(player(X, NewY)),
	!.
d :- 
  isPlay, retract(player(X,Y)),
	NewX is X + 1,
	write('You move east'), nl,
	asserta(player(NewX, Y)), 
	!.

/*
Todo
1. move beneran di map
2. cek tembok
3. random ketemu musuh(apakah disini?)
*/
