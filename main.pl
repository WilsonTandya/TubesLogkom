:- include('shop.pl').
:- include('walk.pl').
:- include('status.pl').
:- include('player.pl').
:- include('map.pl').
:- dynamic(isPlay/0).

start :-
    \+(isPlay),
    spawnItem,
    playerInit,
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
    write('# 1. start       : Untuk Mulai Permainan                                       #'),nl,
    write('# 2. map         : Menampilkan Peta                                            #'),nl,
    write('# 3. status      : Menampilkan Status Pemain                                   #'),nl,
    write('# 4. inventory   : Menampilkan Isi Inventory Pemain                            #'),nl,
    write('# 4. w           : Bergerak ke Utara 1 Langkah                                 #'),nl,
    write('# 5. a           : Bergerak ke Barat 1 Langkah                                 #'),nl,
    write('# 6. s           : Bergerak ke Selatan 1 Langkah                               #'),nl,
    write('# 7. d           : Bergerak ke Timur 1 Langkah                                 #'),nl,
    write('# 8. help        : Menampilkan Segala Bantuan                                  #'),nl,
    write('################################################################################'),nl,nl.


    write('Game telah dimulai!'), nl.

help:-
    isPlay,
    write('################################################################################'),nl,
    write('#                              ~Bensin Impact~                                 #'),nl,
    write('#                                                                              #'),nl,
    write('# 1. start       : Untuk Mulai Permainan                                       #'),nl,
    write('# 2. map         : Menampilkan Peta                                            #'),nl,
    write('# 3. status      : Menampilkan Status Pemain                                   #'),nl,
    write('# 4. inventory   : Menampilkan Isi Inventory Pemain                            #'),nl,
    write('# 4. w           : Bergerak ke Utara 1 Langkah                                 #'),nl,
    write('# 5. a           : Bergerak ke Barat 1 Langkah                                 #'),nl,
    write('# 6. s           : Bergerak ke Selatan 1 Langkah                               #'),nl,
    write('# 7. d           : Bergerak ke Timur 1 Langkah                                 #'),nl,
    write('# 8. help        : Menampilkan Segala Bantuan                                  #'),nl,
    write('################################################################################'),nl,nl.
