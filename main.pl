:- include('battle.pl').
:- include('walk.pl').
:- include('quest.pl').
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
    asserta(isPlay),!.

start :-
    isPlay,
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
    write('# 3.  map         : Opens Map                                                  #'),nl,
    write('# 4.  status      : Shows Player Status                                        #'),nl,
    write('# 5.  inventory   : Shows Player Inventory                                     #'),nl,
    write('# 6.  w           : Move 1 Step to the North                                   #'),nl,
    write('# 7.  a           : Move 1 Step to the West                                    #'),nl,
    write('# 8.  s           : Move 1 Step to the South                                   #'),nl,
    write('# 9.  d           : Move 1 Step to the East                                    #'),nl,
    write('# 10. help        : Shows Help Menu                                            #'),nl,
    write('# 11. questInfo   : Shows Quest Information                                    #'),nl,
    write('# 12. quit        : Quit                                                       #'),nl,
    write('################################################################################'),nl,nl,


    write('Dont Forget to Have Fun!'), nl.

help:-
    isPlay,
    write('################################################################################'),nl,
    write('#                              ~Bensin Impact~                                 #'),nl,
    write('#                                                                              #'),nl,
    write('# 1.  start       : Start the Game                                             #'),nl,
    write('# 2.  shop        : Opens Shop                                                 #'),nl,
    write('# 3.  map         : Opens Map                                                  #'),nl,
    write('# 4.  status      : Shows Player Status                                        #'),nl,
    write('# 5.  inventory   : Shows Player Inventory                                     #'),nl,
    write('# 6.  w           : Move 1 Step to the North                                   #'),nl,
    write('# 7.  a           : Move 1 Step to the West                                    #'),nl,
    write('# 8.  s           : Move 1 Step to the South                                   #'),nl,
    write('# 9.  d           : Move 1 Step to the East                                    #'),nl,
    write('# 10. help        : Shows help menu                                            #'),nl,
    write('# 11. questInfo   : Shows Quest Information                                    #'),nl,
    write('# 12. quit        : Quit                                                       #'),nl,
    write('################################################################################'),nl,nl.
quit:-
    isPlay,
    halt.
