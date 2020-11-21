:- include('item.pl').
:- dynamic(jobIsSelected/0).
:- dynamic(job/1).
:- dynamic(isStarterPack/0).

:- discontiguous(isMilik/1).
:- discontiguous(addToInvent/1).
:- discontiguous(invent/1).
:- discontiguous(delFromInvent/1).

isJob(swordman).
isJob(archer).
isJob(sorcerer).

baseHP(X,Y) :-
    isJob(X),
    (X == swordman -> Y is 500
    ; X == archer -> Y is 300
    ; Y is 200).

baseAtt(X,Y) :-
    isJob(X),
    (X == swordman -> Y is 10
    ; X == archer -> Y is 15
    ; Y is 20).

baseDef(X,Y) :-
    isJob(X),
    (X == swordman -> Y is 15
    ; X == archer -> Y is 10
    ; Y is 5).

pilih(X) :-
    \+(jobIsSelected),
    isJob(X),
    write('Selamat, Anda telah menjadi '),
    (X == swordman -> write('Swordman!')
    ; X == archer -> write('Archer!')
    ; write('Sorcerer')), nl,
    asserta(job(X)),
    asserta(jobIsSelected),
    starterPack,!.

pilih(_) :-
    \+(jobIsSelected),
    write('Pilihan job hanya 3, tolong ulangi pemilihan lagi'),!.

pilih(_) :-
    jobIsSelected,
    write('Anda telah memilih job!'), nl,
    write('Anda adalah '), job(X),
    (X == swordman -> write('Swordman')
    ; X == archer -> write('Archer')
    ; write('Sorcerer')), nl.

statInit(X) :-
    isJob(X),
    (X == swordman -> write('Swordman')
    ; X == archer -> write('Archer')
    ; write('Sorcerer')), nl,
    write('Base HP \t: '), baseHP(X,Y), write(Y), nl,
    write('Base Att \t: '), baseAtt(X,Z),write(Z), nl,
    write('Base Deff \t: '), baseDef(X,A), write(A), nl, !.

playerInit :- 
    nl,
    write('Pilihan job yang tersedia :'), nl,
    statInit(swordman),nl,
    statInit(archer),nl,
    statInit(sorcerer), !,
    write('Silahkan pilih menggunakan perintah pilih(job) dengan huruf kecil semua').

starterPack :-
    \+(isStarterPack),
    asserta(milik(55,1)),
    asserta(milik(55,2)),
    asserta(milik(55,3)),
    job(X),
    (X == swordman -> asserta(milik(1,1)), asserta(milik(4,1)),asserta(milik(7,1))
    ; X == archer -> asserta(milik(2,1)), asserta(milik(5,1)),asserta(milik(8,1))
    ; asserta(milik(3,1)), asserta(milik(6,1)),asserta(milik(9,1))),
    asserta(isStarterPack).

starterPack :-
    isStarterPack,
    write('Starter pack telah diberikan!'), nl.
showFreq([]).
showFreq([X|Y]) :- milik(X,Z),!, Z>0, item(X, A,B,_),write(Z), write(' '), (
    (B == common -> write('Common ');
    B == uncommon -> write('Uncommon ');
    B == rare -> write('Rare');
    B == enchanted -> write('Enchanted ');
    B == epic -> write('Epic ');
    B == ultimate -> write('Ultimate ');
    B == health -> write('Health Potion')),

    (A == sword -> write('Sword');
    A == bow -> write('Bow');
    A == staff -> write('Staff');
    A == shield -> write('Shield');
    A == gauntlet -> write('Gauntlet');
    A == robe -> write('Robe');
    A == ring -> write('Ring');
    A == bracelet -> write('Bracelet');
    A == pendant -> write('Pendant'))   
), nl, showFreq(Y). 


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