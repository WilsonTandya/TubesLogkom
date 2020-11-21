:- include('shop.pl').
:- include('walk.pl').
:- include('status.pl').
:- include('player.pl').

:- dynamic(isPlay/0).

start :-
    \+(isPlay),
    spawnItem,
    playerInit,
    asserta(isPlay),!.

start :-
    isPlay,
    write('Game telah distart! Silahkan keluar dan mulai game baru'), nl.