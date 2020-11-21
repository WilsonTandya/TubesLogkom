:- dynamic(item/1).
:- dynamic(milik/2).
:- dynamic(tipe/2).

:- discontiguous(spawnItem/0).

spawnItem :-
    asserta(milik(potion,0)),
    asserta(milik(sword,0)),
    asserta(milik(bow,0)),
    asserta(milik(staff,0)).

