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
    asserta(item(1, sword, common, 10)),
    asserta(item(2, bow, common, 10)),
    asserta(item(3, staff, common, 10)),
    asserta(item(4, shield, common, 10)),
    asserta(item(5, gauntlet, common, 10)),
    asserta(item(6, robe, common, 10)),
    asserta(item(7, ring, common, 10)),
    asserta(item(8, bracelet, common, 10)),
    asserta(item(9, pendant, common, 10)),
    asserta(item(10, sword, uncommon, 25)),
    asserta(item(11, bow, uncommon, 25)),
    asserta(item(12, staff, uncommon, 25)),
    asserta(item(13, shield, uncommon, 25)),
    asserta(item(14, gauntlet, uncommon, 25)),
    asserta(item(15, robe, uncommon, 25)),
    asserta(item(16, ring, uncommon, 25)),
    asserta(item(17, bracelet, uncommon, 25)),
    asserta(item(18, pendant, uncommon, 25)),
    asserta(item(19, sword, rare, 50)),
    asserta(item(20, bow, rare, 50)),
    asserta(item(21, staff, rare, 50)),
    asserta(item(22, shield, rare, 50)),
    asserta(item(23, gauntlet, rare, 50)),
    asserta(item(24, robe, rare, 50)),
    asserta(item(25, ring, rare, 50)),
    asserta(item(26, bracelet, rare, 50)),
    asserta(item(27, pendant, rare, 50)),
    asserta(item(28, sword, enchanted, 100)),
    asserta(item(29, bow, enchanted, 100)),
    asserta(item(30, staff, enchanted, 100)),
    asserta(item(31, shield, enchanted, 100)),
    asserta(item(32, gauntlet, enchanted, 100)),
    asserta(item(33, robe, enchanted, 100)),
    asserta(item(34, ring, enchanted, 100)),
    asserta(item(35, bracelet, enchanted, 100)),
    asserta(item(36, pendant, enchanted, 100)),
    asserta(item(37, sword, epic, 200)),
    asserta(item(38, bow, epic, 200)),
    asserta(item(39, staff, epic, 200)),
    asserta(item(40, shield, epic, 200)),
    asserta(item(41, gauntlet, epic, 200)),
    asserta(item(42, robe, epic, 200)),
    asserta(item(43, ring, epic, 200)),
    asserta(item(44, bracelet, epic, 200)),
    asserta(item(45, pendant, epic, 200)),
    asserta(item(46, sword, ultimate, 400)),
    asserta(item(47, bow, ultimate, 400)),
    asserta(item(48, staff, ultimate, 400)),
    asserta(item(49, shield, ultimate, 400)),
    asserta(item(50, gauntlet, ultimate, 400)),
    asserta(item(51, robe, ultimate, 400)),
    asserta(item(52, ring, ultimate, 400)),
    asserta(item(53, bracelet, ultimate, 400)),
    asserta(item(54, pendant, ultimate, 400)),
    asserta(item(55, potion, health, 100)).