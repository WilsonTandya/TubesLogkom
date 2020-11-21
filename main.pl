:- include('shop.pl').
:- include('walk.pl').
:- include('status.pl').
:- include('item.pl').

:- dynamic(isPlay/0).

start :-
  spawnItem,
  item(1, X, Y, _),
  write(Y), write(' '), write(X), nl,
  asserta(isPlay).