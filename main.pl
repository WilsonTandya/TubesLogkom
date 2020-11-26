:- include('battle.pl').
:- include('walk.pl').
:- include('dungeon.pl').
:- include('player.pl').
:- include('map.pl').
:- dynamic(isPlay/0).
start :-
    \+(isPlay),
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
    write('# 13. quit        : Quit                                                       #'),nl,
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
    write('# 13. quit        : Quit                                                       #'),nl,
    write('################################################################################'),nl,nl, !.
help:-
    \+isPlay,
    write('You must start the game first!'), nl, !.

quit:-
    isPlay,
    halt.
quit:-
    \+isPlay,
    write('You must start the game first!'), nl, !.
