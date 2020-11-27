:- include('battle.pl').
:- include('walk.pl').
:- include('dungeon.pl').
:- include('player.pl').
:- include('map.pl').
:- dynamic(isPlay/0).
start :-
    \+(isPlay),
    write('################################################################### STORY LINE ##################################################################'),nl,
    write('#                                                                                                                                               #'),nl,
    write('# Once upon a time when the forest was still lush, the river was still clear, and the air was still clean.                                      #'),nl,
    write('# There lived a child with his grandfather in a small village called Kusuma Bangsa Village.                                                     #'),nl,
    write('#                                                                                                                                               #'),nl,
    write('# This child has extraordinary abilities. He was a child who was good at hunting and fighting for his young age.                                #'),nl,
    write('# But every night, sadness always came to him because he had never seen the faces of his parents who died right after his birth.                #'),nl,
    write('# The cause of their death was kept secret by his grandfather.                                                                                  #'),nl,
    write('#                                                                                                                                               #'),nl,
    write('# Long story short, the grandfather suffered from a chronic COVID-19 and the doctor said that he does not have much time left.                  #'),nl,
    write('# Right before death, the grandfather chatted with his grandson.                                                                                #'),nl,
    write('#                                                                                                                                               #'),nl,
    write('# "My grandson, I have to tell you the truth."                                                                                                  #'),nl,
    write('# "What truth grandpa?"                                                                                                                         #'),nl,
    write('# "Your father and mother are still alive, and they are kept in a dungeon, guarded by the ancient dragon."                                      #'),nl,
    write('# "Whaa... Whaaa.. What?! in a dungeon? by the ancient dragon?"                                                                                 #'),nl,
    write('# "Yes my grandson. Your parents made a deal with the ancient dragon to get a baby in return the ancient dragon kept them as prisoners"         #'),nl,
    write('# "Then how can I free my parents?"                                                                                                             #'),nl,
    write('# "You need to go to the dungeon to beat the ancient dragon, but many people have tried and failed"                                             #'),nl,
    write('# "I must free them!"                                                                                                                           #'),nl,
    write('# His grandfather died. The boy decided to train everyday in order to defeat the ancient dragon and free his parents.                           #'),nl,
    write('#                                                                                                                                               #'),nl,    
    write('#################################################################################################################################################'),nl,
    spawnMilik,
    spawnItem,
    playerInit,
    asserta(player(3,2)),
    asserta(isPlay),initBattle,!.
start :-
    \+jobIsSelected,
    write('Choose your job first!'),!.
start :-
    isPlay, jobIsSelected,
    write(' /$$      /$$           /$$                                                     /$$              '),nl,
    write('| $$  /$ | $$          | $$                                                    | $$              '),nl,
    write('| $$ /$$$| $$  /$$$$$$ | $$  /$$$$$$$  /$$$$$$  /$$$$$$/$$$$   /$$$$$$        /$$$$$$    /$$$$$$ '),nl,
    write('| $$/$$ $$ $$ /$$__  $$| $$ /$$_____/ /$$__  $$| $$_  $$_  $$ /$$__  $$      |_  $$_/   /$$__  $$'),nl,
    write('| $$$$_  $$$$| $$$$$$$$| $$| $$      | $$  \\ $$| $$ \\ $$ \\ $$| $$$$$$$$        | $$    | $$  \\ $$'),nl,
    write('| $$$/ \\  $$$| $$_____/| $$| $$      | $$  | $$| $$ | $$ | $$| $$_____/        | $$ /$$| $$  | $$'),nl,
    write('| $$/   \\  $$|  $$$$$$$| $$|  $$$$$$$|  $$$$$$/| $$ | $$ | $$|  $$$$$$$        |  $$$$/|  $$$$$$/'),nl,
    write('|__/     \\__/ \\_______/|__/ \\_______/ \\______/ |__/ |__/ |__/ \\_______/         \\___/   \\______/ '),nl,nl,

    write('                  /$$$$$$$                                /$$          '),nl,
    write('                 | $$__  $$                              |__/          '),nl,
    write('                 | $$  \\ $$  /$$$$$$  /$$$$$$$   /$$$$$$$ /$$ /$$$$$$$ '),nl,
    write('                 | $$$$$$$  /$$__  $$| $$__  $$ /$$_____/| $$| $$__  $$'),nl,
    write('                 | $$__  $$| $$$$$$$$| $$  \\ $$|  $$$$$$ | $$| $$  \\ $$'),nl,
    write('                 | $$  \\ $$| $$_____/| $$  | $$ \\____  $$| $$| $$  | $$'),nl,
    write('                 | $$$$$$$/|  $$$$$$$| $$  | $$ /$$$$$$$/| $$| $$  | $$'),nl,
    write('                 |_______/  \\_______/|__/  |__/|_______/ |__/|__/  |__/'),nl,nl,

    write('              /$$$$$$                                               /$$   '),nl,
    write('             |_  $$_/                                              | $$    '),nl,
    write('               | $$   /$$$$$$/$$$$   /$$$$$$   /$$$$$$   /$$$$$$$ /$$$$$$   '),nl,
    write('               | $$  | $$_  $$_  $$ /$$__  $$ |____  $$ /$$_____/|_  $$_/  '),nl,
    write('               | $$  | $$ \\ $$ \\ $$| $$  \\ $$  /$$$$$$$| $$      | $$    '),nl,
    write('               | $$  | $$ | $$ | $$| $$  | $$ /$$__  $$| $$        | $$ /$$'),nl,
    write('              /$$$$$$| $$ | $$ | $$| $$$$$$$/|  $$$$$$$|  $$$$$$$  |  $$$$/'),nl,
    write('             |______/|__/ |__/ |__/| $$____/  \\_______/ \\_______/  \\___/  '),nl,
    write('                                   | $$                                    '),nl,
    write('                                   | $$                                    '),nl,
    write('                                   |__/                                    '),nl,nl,

    write('################################################################################'),nl,
    write('#                              ~Bensin Impact~                                 #'),nl,
    write('#                                                                              #'),nl,
    write('# 1.  start       : Start the Game                                             #'),nl,
    write('# 2.  shop        : Opens Shop                                                 #'),nl,
    write('# 3.  quest       : Opens Quest                                                #'),nl,
    write('# 4.  dungeon     : Opens Dungeon                                              #'),nl,
    write('# 5.  map         : Opens Map                                                  #'),nl,
    write('# 6.  status      : Shows Player Status                                        #'),nl,
    write('# 7.  inventory   : Shows Player Inventory                                     #'),nl,
    write('# 8.  w           : Move 1 Step to the North                                   #'),nl,
    write('# 9.  a           : Move 1 Step to the West                                    #'),nl,
    write('# 10. s           : Move 1 Step to the South                                   #'),nl,
    write('# 11. d           : Move 1 Step to the East                                    #'),nl,
    write('# 12. help        : Shows Help Menu                                            #'),nl,
    write('# 13. *save        : Save Your Progress                                        #'),nl,
    write('# 14. *loads       : Loads Your Progress                                       #'),nl,
    write('# 15. quit        : Quit                                                       #'),nl,
    write('#                                                                              #'),nl,
    write('# pengunaan command bertanda * dapat dilihat pada laporan                      #'),nl,
    write('################################################################################'),nl,nl,


    write('Goodluck! Dont Forget to Have Fun!'), nl, !.

help:-
    isPlay,
    write('################################################################################'),nl,
    write('#                              ~Bensin Impact~                                 #'),nl,
    write('#                                                                              #'),nl,
    write('# 1.  start       : Start the Game                                             #'),nl,
    write('# 2.  shop        : Opens Shop                                                 #'),nl,
    write('# 3.  quest       : Opens Quest                                                #'),nl,
    write('# 4.  dungeon     : Opens Dungeon                                              #'),nl,
    write('# 5.  map         : Opens Map                                                  #'),nl,
    write('# 6.  status      : Shows Player Status                                        #'),nl,
    write('# 7.  inventory   : Shows Player Inventory                                     #'),nl,
    write('# 8.  w           : Move 1 Step to the North                                   #'),nl,
    write('# 9.  a           : Move 1 Step to the West                                    #'),nl,
    write('# 10. s           : Move 1 Step to the South                                   #'),nl,
    write('# 11. d           : Move 1 Step to the East                                    #'),nl,
    write('# 12. help        : Shows Help Menu                                            #'),nl,
    write('# 13. *save        : Save Your Progress                                        #'),nl,
    write('# 14. *loads       : Loads Your Progress                                       #'),nl,
    write('# 15. quit        : Quit                                                       #'),nl,
    write('#                                                                              #'),nl,
    write('# pengunaan command bertanda * dapat dilihat pada laporan                      #'),nl,
    write('################################################################################'),nl,nl, !.
help:-
    \+isPlay,
    write('You must start the game first!'), nl, !.

save(_) :-
    \+isPlay,
    write('You must start the game first!'),nl,!.

save(_) :-
    \+jobIsSelected,
    write('You must choose your job first!'), nl, !.

save(_) :-
    battle(1),
    write('You cannot save the game while in battle mode!'), nl, !.

save(File) :-
    atom_concat('data/', File, FileName),
    open(FileName, write, FileContent),
    saveData(FileContent),
    close(FileContent),
    write('Game saved to '),
    write(FileName), nl.

saveData(_) :-
    \+jobIsSelected,
    write('Save failed, you must choose your job first!'), nl, !.

saveData(FileContent) :-
    write(FileContent,jobIsSelected), write(FileContent,'.'), nl(FileContent),
    job(Job), write(FileContent,job(Job)), write(FileContent, '.'), nl(FileContent),
    player(X,Y), write(FileContent, player(X,Y)), write(FileContent, '.'), nl(FileContent),
    currLevel(Level), write(FileContent, currLevel(Level)), write(FileContent, '.'), nl(FileContent),
    currHP(CurrHP), write(FileContent, currHP(CurrHP)), write(FileContent, '.'), nl(FileContent),
    currExp(XP), write(FileContent, currExp(XP)), write(FileContent, '.'), nl(FileContent),
    currGold(Gold), write(FileContent,currGold(Gold)), write(FileContent, '.'), nl(FileContent),
    (isArmorEquip -> write(FileContent,isArmorEquip), write(FileContent, '.'), nl(FileContent),
    armor(Armor), write(FileContent,armor(Armor)), write(FileContent, '.'), nl(FileContent); !),
    (isWeaponEquip -> write(FileContent,isWeaponEquip), write(FileContent,'.'), nl(FileContent),
    weapon(Weapon), write(FileContent,weapon(Weapon)), write(FileContent, '.'), nl(FileContent); !),
    (isAccessoryEquip -> write(FileContent, isAccessoryEquip), write(FileContent, '.'), nl(FileContent),
    accessory(Accessory), write(FileContent,accessory(Accessory)), write(FileContent, '.'), nl(FileContent); !),
    (haveQuest -> write(FileContent, haveQuest), write(FileContent,'.'), nl(FileContent),
    goalQuest(Goblin,Orc,Undead, Exp, Gld), write(FileContent, goalQuest(Goblin,Orc,Undead,Exp,Gld)), write(FileContent,'.'), nl(FileContent),
    goalCounter(Gob,Or,Un), write(FileContent,goalCounter(Gob,Or,Un)), write(FileContent,'.'), nl(FileContent); !),
    forall(milik(ID, Banyak), (write(FileContent,milik(ID,Banyak)), write(FileContent,'.'), nl(FileContent))).

loads(_) :-
    \+isPlay,
    write('Try to start the game first!'), nl,!.

loads(_) :-
    \+jobIsSelected,
    write('Try to choose job first, then you can load your game'), nl,!.

loads(_) :-
    battle(1),
    write('You cannot load the game while in the battle mode!'), nl, !.

loads(File) :-
    atom_concat('data/', File ,FileName),
    open(FileName, read, FileContent),
    resetState,
    repeat,
    read(FileContent,In),
    asserta(In),
    at_end_of_stream(FileContent),
    close(FileContent),
    write('Game loaded!'), nl,!.

loads(File) :-
    write('File '),
    write(File),
    write(' no\'t found!'), nl, fail.

resetState :-
    retractall(job(_)),
    retractall(player(_,_)),
    retractall(currLevel(_)),
    retractall(currHP(_)),
    retractall(currExp(_)),
    retractall(currGold(_)),
    (isArmorEquip -> retractall(isArmorEquip), retractall(armor(_)); !),
    (isWeaponEquip -> retractall(isWeaponEquip), retractall(weapon(_)); !),
    (isAccessoryEquip -> retractall(isAccessoryEquip), retractall(accessory(_)); !),
    (haveQuest -> retractall(haveQuest), retractall(goalQuest(_,_,_,_,_)), retractall(goalCounter(_,_,_)); !),
    retractall(milik(_,_)).

quit:-
    isPlay, write('Thanks for playing Bensin Impact'),nl,
    halt.
quit:-
    \+isPlay,
    write('You must start the game first!'), nl, !.
