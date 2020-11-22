:- include('item.pl').

:- discontiguous(isMilik/1).
:- discontiguous(addToInvent/1).
:- discontiguous(invent/1).
:- discontiguous(delFromInvent/1).

showFreq([]).
showFreq([X|Y]) :- milik(X,Z),!, Z>0, write(X), write(' '), write(Z), nl, showFreq(Y). 


isMilik(Item) :-
    milik(Item,X),
    X > 0.



showInvent :-
    invent(Inven),
    sort(Inven,NI),
    showFreq(NI).

itemCounter(Item,X) :-
    milik(Item,X), !.

showItemCounter(Item) :-
    milik(Item,X),!,
    write('Anda mempunyai sebanyak '),write(X),write(' '), write(Item). 

inventCounter(X) :-
    invent(Inven),
    length(Inven,X).

addToInvent(Item) :-
    milik(Item,X),!,
    (inventCounter(Y), Y =:= 100 -> write('Inventory Anda penuh! Item gagal ditambah ke inventory');
    X1 is X+1, asserta(milik(Item,X1))).

delFromInvent(Item) :-
    milik(Item,X),X >0,!,
    retract(milik(Item,X)).

invent(Inven) :-
    findall(X,isMilik(X),Inven).