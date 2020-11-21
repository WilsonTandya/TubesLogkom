/*
:- dynamic(item/1).
:- dynamic(milik/2).
:- dynamic(tipe/3).

:- discontiguous(spawnItem/0).
:- discontiguous(spawn_item/0).
:- discontiguous(spawn_milik/0).
:- discontiguous(spawn_tipe/0).
*/

/*
spawnItem :-
    asserta(milik(potion,0)),
    asserta(milik(sword,0)),
    asserta(milik(bow,0)),
    asserta(milik(staff,0)).
*/

/*
spawnItem :-
    spawn_tipe,
    spawn_milik,
    spawn_item.

spawn_item :-
    asserta(item(potion)),
    asserta(item(sword)),
    asserta(item(bow)),
    asserta(item(staff)).

spawn_tipe :-
    asserta(tipe(potion, health)),
    asserta(tipe(sword, uncommon)),
    asserta(tipe(bow, uncommon)),
    asserta(tipe(staff, uncommon)),
    asserta(tipe(sword, rare)),
    asserta(tipe(bow, rare)),
    asserta(tipe(staff, rare)).

spawn_milik :-
    asserta(milik(potion, health, 0)),
    asserta(milik(sword, uncommon, 0)),
    asserta(milik(bow, uncommon, 0)),
    asserta(milik(staff, uncommon, 0)),
    asserta(milik(sword, rare, 0)),
    asserta(milik(bow, rare, 0)),
    asserta(milik(staff, rare, 0)).

*/

/* item -> id, jenis, rarity, damage/def/hp/potion(+) */

:- dynamic(item/4).

:- discontiguous(spawnItem/0).
:- discontiguous(spawn_item/0).

spawnItem :-
    spawn_item.

spawn_item :-
    asserta(item(1, stick, common, 10)),
    asserta(item(2, leather, common, 10)),
    asserta(item(3, sword, uncommon, 25)),
    asserta(item(4, sword, rare, 50)),
    asserta(item(5, sword, enchanted, 100)),
    asserta(item(6, sword, epic, 200)),
    asserta(item(7, sword, ultimate, 400)),
    asserta(item(8, bow, uncommon, 25)),
    asserta(item(9, bow, rare, 50)),
    asserta(item(10, bow, enchanted, 100)),
    asserta(item(11, bow, epic, 200)),
    asserta(item(12, bow, ultimate, 400)),
    asserta(item(13, staff, uncommon, 25)),
    asserta(item(14, staff, rare, 50)),
    asserta(item(15, staff, enchanted, 100)),
    asserta(item(16, staff, epic, 200)),
    asserta(item(17, staff, ultimate, 400)),
    asserta(item(18, shield, uncommon, 25)),
    asserta(item(19, shield, rare, 50)),
    asserta(item(20, shield, enchanted, 100)),
    asserta(item(21, shield, epic, 200)),
    asserta(item(22, shield, ultimate, 400)),
    asserta(item(23, gauntlet, uncommon, 25)),
    asserta(item(24, gauntlet, rare, 50)),
    asserta(item(25, gauntlet, enchanted, 100)),
    asserta(item(26, gauntlet, epic, 200)),
    asserta(item(27, gauntlet, ultimate, 400)),
    asserta(item(28, robe, uncommon, 25)),
    asserta(item(29, robe, rare, 50)),
    asserta(item(30, robe, enchanted, 100)),
    asserta(item(31, robe, epic, 200)),
    asserta(item(32, robe, ultimate, 400)),
    asserta(item(33, ring, uncommon, 25)),
    asserta(item(34, ring, rare, 50)),
    asserta(item(35, ring, enchanted, 100)),
    asserta(item(36, ring, epic, 200)),
    asserta(item(37, ring, ultimate, 400)),
    asserta(item(38, bracelet, uncommon, 25)),
    asserta(item(39, bracelet, rare, 50)),
    asserta(item(40, bracelet, enchanted, 100)),
    asserta(item(41, bracelet, epic, 200)),
    asserta(item(42, bracelet, ultimate, 400)),
    asserta(item(43, pendant, uncommon, 25)),
    asserta(item(44, pendant, rare, 50)),
    asserta(item(45, pendant, enchanted, 100)),
    asserta(item(46, pendant, epic, 200)),
    asserta(item(47, pendant, ultimate, 400)),
    asserta(item(48, potion, health, 100)).