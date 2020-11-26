/*job(X) berisi job player ketika sudah diisi, kalau belum berarti belum diassert (false)*/
/*jobIsSelected menandakan player sudah memilih job atau belum, kalau sudah maka player tidak bisa memilih job lagi
kecuali keluar dan restart game*/
/*isStarterPack menandakan player sudah dikasih starter pack atau belum, biar gak bisa dikasih lagi */
:- include('shop.pl').
:- dynamic(jobIsSelected/0).
:- dynamic(job/1).
:- dynamic(isStarterPack/0).
:- dynamic(isArmorEquip/0).
:- dynamic(isWeaponEquip/0).
:- dynamic(isAccessoryEquip/0).
:- dynamic(weapon/1).
:- dynamic(armor/1).
:- dynamic(accessory/1).
:- dynamic(currentLevel/1).
:- dynamic(currGold/1).

:- discontiguous(isMilik/1).
:- discontiguous(addToInvent/1).
:- discontiguous(invent/1).
:- discontiguous(delFromInvent/1).

/* true jika memang pekerjaan*/
isJob(swordman).
isJob(archer).
isJob(sorcerer).

maxHP(X) :-
    \+isAccessoryEquip,
    currentLevel(Y),
    job(Z),
    baseHP(Z,X,Y),!.

maxHP(X) :-
    currentLevel(Y),
    job(Z),
    baseHP(Z,A,Y),
    accessory(K),
    item(K,_,_,L),
    X is L + A.

currAtt(X) :-
    \+isWeaponEquip,
    currentLevel(Y),
    job(Z),
    baseAtt(Z,X,Y),!.

currAtt(X) :-
    currentLevel(Y),
    job(Z),
    baseAtt(Z,A,Y),
    weapon(K),
    item(K,_,_,L),
    X is L + A.

currDef(X) :-
    \+isArmorEquip,
    currentLevel(Y),
    job(Z),
    baseDef(Z,X,Y),!.

currDef(X) :-
    currentLevel(Y),
    job(Z),
    baseDef(Z,A,Y),
    armor(K),
    item(K,_,_,L),
    X is L + A.

/*base status untuk tiap job*/
baseHP(X,Y,Level) :-
    isJob(X),
    Z is Level - 1,
    (X == swordman -> Y is 500 + 50*Z
    ; X == archer -> Y is 300 + 30*Z
    ; Y is 200 + 20*Z).

baseAtt(X,Y,Level) :-
    isJob(X),
    Z is Level - 1,
    (X == swordman -> Y is 10 + 2*Z
    ; X == archer -> Y is 15 + 3*Z
    ; Y is 20+4*Z).

baseDef(X,Y,Level) :-
    isJob(X),
    Z is Level - 1,
    (X == swordman -> Y is 15 + 3*Z
    ; X == archer -> Y is 10 + 2*Z
    ; Y is 5+Z).

/* command untuk memilih job  */
choose(X) :-
    \+(jobIsSelected),
    isJob(X),
    write('Congratulations, You become a(n) '),
    (X == swordman -> write('Swordman!')
    ; X == archer -> write('Archer!')
    ; write('Sorcerer!')), nl,
    asserta(job(X)),
    asserta(jobIsSelected),
    asserta(currentLevel(1)),
    starterPack,!.
/* Jika pilihan bukan dari 3 yang disediakan, perintah gagal*/
choose(_) :-
    \+(jobIsSelected),
    write('There are only 3 jobs, please enter the correct input'),!.

/* Jika sebelumnya sudah memilih, player tidak bisa memilih lagi*/
choose(_) :-
    jobIsSelected,
    write('You have chosen a job'), nl,
    write('You are a(n) '), job(X),
    (X == swordman -> write('Swordman')
    ; X == archer -> write('Archer')
    ; write('Sorcerer')), nl.

/* Menunjukkan status awal tiap2 karakter job */
statInit(X) :-
    isJob(X),
    (X == swordman -> write('Swordman')
    ; X == archer -> write('Archer')
    ; write('Sorcerer')), nl,
    write('Base HP \t: '), baseHP(X,Y,1), write(Y), nl,
    write('Base Att \t: '), baseAtt(X,Z,1),write(Z), nl,
    write('Base Deff \t: '), baseDef(X,A,1), write(A), nl, !.

/* Inisiasi job karakter awal player (job) */
playerInit :-
    nl,
    write('Available jobs :'), nl,
    statInit(swordman),nl,
    statInit(archer),nl,
    statInit(sorcerer), !, nl,
    write('Please choose your job by typing "choose(swordman).", "choose(archer).", or choose("sorcerer").').

/*kalau belum dikasih starter pack, boleh dikasih*/
starterPack :-
    \+(isStarterPack),
    retractall(milik(55,_)),
    asserta(milik(55,3)),
    asserta(currGold(100)),
    job(X),
    (X == swordman -> retractall(milik(1,_)), retractall(milik(4,_)), retractall(milik(7,_))
    ,asserta(milik(1,1)), asserta(milik(4,1)),asserta(milik(7,1))
    ; X == archer -> retractall(milik(2,_)), retractall(milik(5,_)), retractall(milik(8,_))
    ,asserta(milik(2,1)), asserta(milik(5,1)),asserta(milik(8,1))
    ;retractall(milik(3,_)), retractall(milik(6,_)), retractall(milik(9,_))
    , asserta(milik(3,1)), asserta(milik(6,1)),asserta(milik(9,1))),
    asserta(isStarterPack).

/* kalau udah mah jangan */
starterPack :-
    isStarterPack,
    write('Starter pack has been given!'), nl.

/* ngeprint list of frequency item */
showFreq([]).
showFreq([X|Y]) :- milik(X,Z), !, item(X, A,B,_),write(Z), write(' '), (
    (B == common -> write('Common ');
    B == uncommon -> write('Uncommon ');
    B == rare -> write('Rare ');
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
    A == pendant -> write('Pendant');write(''))
    ,write(' ID = '), write(X)
), nl, showFreq(Y).

/* counter list of item*/
counter([],0).
counter([X|Y],Z) :- milik(X,A), counter(Y,B), Z is A+B.

/* Nunjukin kepunyaan player, ditandai dengan banyaknya item yang dimiliki minimal 1*/
isMilik(Item) :-
    milik(Item,X),
    X > 0.

/* Nampilin inventory ke layar tapi disort dulu sesuai ID, nampilinnya pake print list of freq item*/
inventory :-
    invent(Inven),
    sort(Inven,NI),
    showFreq(NI).

/* ngitung item */
itemCounter(Item,X) :-
    milik(Item,X), !.

/* nampilin banyak item yang dipunyai */
showItemCounter(Item) :-
    milik(Item,X),!,
    write('You got '),write(X),write(' '), write(Item).

/* ngitung banyaknya item di inventory */
inventCounter(X) :-
    invent(Inven),
    counter(Inven,X).

/* UPDATE : biar gampang dipahami, algoritmanya diubah dikit, kepunyaannya diupdate tiap add/delete */
addToInvent(Item) :-
    milik(Item,X),
    (inventCounter(Y), Y =:= 100 -> write('Your Inventory is Full! Item Failed to Get Added to Your inventory');
    X1 is X+1 ,retractall(milik(Item,_)),asserta(milik(Item,X1))).

delFromInvent(Item) :-
    milik(Item,X),
    (X > 0 -> X1 is X - 1,retractall(milik(Item,_)), asserta(milik(Item,X1));
    write('You dont have that item!'), nl)
    .
/* nah kalau ini untuk tiap item kepunyaan X dimasukin ke inventory yang namanya Inven*/
invent(Inven) :-
    findall(X,isMilik(X),Inven).

equip(Item) :-
    isMilik(Item),
    item(Item,_,_,_), Item  =\= 55,
    X is Item mod 9,
    (X >= 1 , X =< 3 -> equipWeapon(Item);
    X > 3, X =< 7 -> equipArmor(Item);
    equipAccessory(Item)),!.

equip(Item) :-
    Item =:= 55, write('Potion cant be equipped'),nl,!,fail.

equip(Item) :-
    \+isMilik(Item),
    write('You dont have that item!'), nl,!,fail.

equipWeapon(Item) :-
    \+isMilik(Item),
    write('You dont have that item!'), nl, !, fail.

equipWeapon(Item) :-
    \+isWeaponEquip, Item < 55,
    X is Item mod 9,
    job(Y),
    ((Y == swordman, X =\= 1; Y == archer, X =\= 2; Y == sorcerer, X=\= 3) -> write('Weapon isnt valid, fail to equip!')
    ; asserta(weapon(Item)), delFromInvent(Item), asserta(isWeaponEquip)).

equipWeapon(Item) :-
    isWeaponEquip, Item < 55,
    X is Item mod 9,
    job(Y),
    ((Y == swordman, X =\= 1; Y == archer, X =\= 2; Y == sorcerer, X=\= 3) -> write('Weapon isnt valid, fail to equip!')
    ; retract(weapon(A)),delFromInvent(Item),addToInvent(A)
    ,asserta(weapon(Item))).

equipArmor(Item) :-
    \+isMilik(Item),
    write('You dont have that item!'), nl, !, fail.

equipArmor(Item) :-
    \+isArmorEquip, Item < 55,
    X is Item mod 9,
    job(Y),
    ((Y == swordman, X =\= 4; Y == archer, X =\= 5; Y == sorcerer, X=\= 6) -> write('Armor isnt valid, fail to equip!')
    ; asserta(armor(Item)), delFromInvent(Item), asserta(isArmorEquip)).

equipArmor(Item) :-
    isArmorEquip, Item < 55,
    X is Item mod 9,
    job(Y),
    ((Y == swordman, X =\= 4; Y == archer, X =\= 5; Y == sorcerer, X=\= 6) -> write('Armor isnt valid, fail to equip!')
    ; retract(armor(A)), delFromInvent(Item), addToInvent(A)
    ,asserta(armor(Item))).

equipAccessory(Item) :-
    \+isMilik(Item),
    write('You dont have that item!'), nl, !, fail.

equipAccessory(Item) :-
    \+isAccessoryEquip, Item < 55,
    X is Item mod 9,
    job(Y),
    ((Y == swordman, X =\= 7; Y == archer, X =\= 8; Y == sorcerer, X=\= 0) -> write('Accessory isnt valid, fail to equip!')
    ; asserta(accessory(Item)), delFromInvent(Item), asserta(isAccessoryEquip)).

equipAccessory(Item) :-
    isAccessoryEquip, Item < 55,
    X is Item mod 9,
    job(Y),
    ((Y == swordman, X =\= 7; Y == archer, X =\= 8; Y == sorcerer, X=\= 0) -> write('Accessory isnt valid, fail to equip!')
    ; retract(accessory(A)), delFromInvent(Item),addToInvent(A)
    ,asserta(accessory(Item))).


unequipArmor :-
    \+isArmorEquip,
    write('No item in the armor slot!'),nl,!,fail.

unequipArmor :-
    isArmorEquip, write('Armor unequipped!'),nl,
    armor(X), retract(armor(X)),
    milik(X,Y), addToInvent(X),
    (milik(X,Y1), Y1 =\= Y -> write('Item is returned to your inventory');write(''))
    ,retract(isArmorEquip), nl.

unequipWeapon :-
    \+isWeaponEquip,
    write('No item in the weapon slot!'),nl,!,fail.

unequipWeapon :-
    isWeaponEquip, write('Weapon unequipped!'), nl,
    weapon(X), retract(weapon(X)),
    milik(X,Y), addToInvent(X),
    (milik(X,Y1), Y1 =\= Y -> write('Item is returned to your inventory');write(''))
    ,retract(isWeaponEquip),nl.

unequipAccessory :-
    \+isAccessoryEquip,
    write('No item in the accessory slot!'),nl,!,fail.

unequipAccessory :-
    isAccessoryEquip, write('Accessory unequipped!'), nl,
    accessory(X), retract(accessory(X)),
    milik(X,Y), addToInvent(X),
    (milik(X,Y1), Y1 =\= Y -> write('Item is returned to your inventory');write(''))
    ,retract(isAccessoryEquip),nl.

status :-
    write('Your status:'), nl,
    write('Job: '),job(X),
    (X == swordman -> write('Swordman')
    ; X == archer -> write('Archer')
    ; write('Sorcerer')), nl,

    write('Level: '), currentLevel(Y), write(Y), nl,
    write('Health: '), nl,%currHP/maxHP(X)
    write('Attack: '), currAtt(A), write(A),nl,
    write('Defense: '), currDef(D), write(D),nl,
    /*ini aksesnya dimana ya?*/
    write('Exp: '), nl,
    write('Gold: '), currGold(X),write(X),nl.
