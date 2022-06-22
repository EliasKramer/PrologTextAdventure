:- dynamic add_to_inventory/1.

:- dynamic current_position_X/1.   
:- dynamic current_position_Y/1.
    
current_position_X(0).
current_position_Y(0).

room(0, 5, hallway) :- add_to_inventory(flashlight), write('You have made your decision. You are in a very dark room right now. What I did not tell you is that the flashlight you have put in your bag
has magic features. It can tell you for example how dangerous the room is which you are currently in. Just read the guide book I threw inside your bag by typing flashlight. Each room has its own hazards 
which might lead to death. But you might also find helpful tools to leave the escape room. You can find the exit with your magic flashlight.'), assert(add_to_inventory("guide book")).
room(-5, 5, hallway) :- true.
room(0, 10, hallway) :- true.
room(0, 15, hallway) :- true.
room(0, 20, hallway) :- true.


room(-5, 10, room1) :- write('You have entered room 1. Dont forget to use the flashlight.').
room(-15, 10, room1) :- true.
room(-10, 10, room1) :- true.
room(-10, 5, room1) :- true.
room(-20, -10, room1) :- true.
room(-5, 15, room1) :- true.
room(-10, 15, room1) :- true.
room(-15, 15, room1) :- true.
room(-20, 15, room1) :- true.
room(-5, 20, room1) :- true.
room(-10, 20, room1) :- true.
room(-15, 20, room1) :- true.
room(-20, 20, room1) :- true.


room(5, 10, room2) :- write('You have entered room 2. Dont forget to use the flashlight.').
room(15, 10, room2) :- true.
room(10, 10, room2) :- true.
room(20, 10, room2) :- true.
room(5, 15, room2) :- true.
room(10, 15, room2) :- true.
room(15, 15, room2) :- true.
room(20, 15, room2) :- true.
room(5, 20, room2) :- true.
room(10, 20, room2) :- true.
room(15, 20, room2) :- true.
room(20, 20, room2) :- true.

room(0, 25, 'exit') :-  write('You have reached the exit. You will need a key in your inventory in order to pass this door. Try to go forward the door will open automatically.').
 
room(0, 30, end) :- add_to_inventory(mystreious_key), write('Good Job you have reached the end. End the game by typing end. '). 

coordinates() :-  (current_position_X(Char_Pos_X), current_position_Y(Char_Pos_Y)), write(Char_Pos_X), write(' '), write(Char_Pos_Y).

end() :- write('Ok, that did not work, maybe the command finish. might work. ').
finish() :- 
writeln('Well that does not work either. It seems like there is something happening. '),
writeln('___________________________________________________________________________'),
continueWithBossFight().

items() :- 
write('location         coordinates             \n'),
write('Room 1           -10     5 \n'),
write('Room 2            10    15 \n'),
write('Room 2            20   -15 \n').

object_coordinates(0, 0, flashlight).
object_coordinates(-10, 5, sword).
object_coordinates(10, 15, mystreious_key).

room_distance(10, 0, "Room 1") :- write("Distance to Room 1: "), current_position_X(Char_Pos_X), X is (integer(10) - Char_Pos_X) / integer(5), write(X).


flashlight() :- write('This is your magic flashlight. Just use the following commands in order to get trough this escape room: 

-> hazards.                     Shows hazards in current room
-> scan.                        Shows scan of room.

You can only use your flashlight when you are next to a door.').

scan() :- add_to_inventory(flashlight), (current_position_X(Char_Pos_X), current_position_Y(Char_Pos_Y)), current_room_map(Char_Pos_X, Char_Pos_Y).

inventory() :- add_to_inventory(X), write('\n> '), write(X), nl, fail.

hazards() :- room_hazards().

collect() :-  (current_position_X(Char_Pos_X), current_position_Y(Char_Pos_Y)), object_coordinates(Char_Pos_X, Char_Pos_Y, X), write('A '), write(X), write(' has been added to your inventory'), take(X).

current_room_haradz(10, -5, "There is a strange figure in fornt of you. Try to talk to it by using talk. But dont trust it too much."). 
current_room_haradz(10, 5, "Some hazard").

room_hazards() :- (current_position_X(Char_Pos_X), current_position_Y(Char_Pos_Y)), current_room_haradz(Char_Pos_X, Char_Pos_Y, X), write(X).

doors() :- write('Door Name          Coordinates \n'), 
           write('Hallway                0   5 \n'), 
           write('Hallway                0  10 \n'), 
           write('Room 1                -5  10 \n'), 
           write('Room 2                 5  10 \n').

current_room_map(0, 5) :- 

write('          ________________________|    |______________________  \n'),
write('         |                         Exit                       | \n'),
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    |  \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write(' Room 1  |                                                    | Room 2 \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                         You                        | \n'), 
write('         +----------------------------------------------------+ \n').

current_room_map(0, 10) :- 

write('          ________________________|    |______________________  \n'),
write('         |                         Exit                       | \n'),
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    |  \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write(' Room 1  |                        You                         | Room 2 \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         +----------------------------------------------------+ \n').

current_room_map(-5, 10) :- 

write('                                 West  \n'                         ),
write('          ____________________________________________________  \n'),
write('         |                                                    | \n'),
write('         |                                                    | \n'), 
write('         |                      ________                      | \n'), 
write('         |                     |!HAZARD!|                     | \n'), 
write('         |                     |________|                     |  \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write(' South   |                                                    | \n'), 
write('         |     ???                                            | North\n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    |  \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                        You                         | \n'), 
write('         |                                                    | \n'), 
write('         |                       Hallway                      | \n'), 
write('         +-----------------------|    |-----------------------+ \n'),
write('                                                                \n'),
write('                                  East                            \n').


current_room_map(5, 10) :- 
write('                                 East  \n'),
write('          ____________________________________________________  \n'),
write('         |                                                    | \n'),
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                           	     | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('  North  |                                                    |  South\n'), 
write('         |     ???                               ???          | \n'), 
write('         |                                                    | \n'), 
write('         |     ________                                       | \n'), 
write('         |    |!HAZARD!|                                      |  \n'), 
write('         |    |________|                                      | \n'), 
write('         |                                                    | \n'), 
write('         |                                                    | \n'), 
write('         |                         You                        | \n'), 
write('         |                       Hallway                      | \n'), 
write('         +-----------------------|    |-----------------------+ \n'),
write('                                                                \n'),
write('                                  West                           \n').
                                                            






:- write('Hello, my name is Rainer Zufall and I will assist you through this escape room. 
You can use the flashlight on the desk next to you. Dont consider the bodies laying around.
As you are in a very old dungeon, there might be other partcipant, who tried to escape this room. 
Make sure you dont starve. If you dont feel brave enough attending this you can also leave. 


Type accept. to approve the offer or decline by typing decline. the offer.').


accept() :- write('Very Tough. Go ahead and start the adventure. You can ask for instructions by
typing instruction. There is a flashlight just next to you. You might need it in order to enter the room in front.').



instruction() :- write('I knew you wont make it without asking me. Nevermind here you can find
all your commands you need to stay alive. Good Luck!

-> collect.                     Use to pick up objetcs
-> coordinates.                 Use to display current coordinates
-> n.                           Use to walk forward.
-> s.                           Use to walk backward.
-> w.                           Use to walk left
-> e.                           Use to walk right.
-> inventory.                   Use to get content of inventory
-> doors.                       Use in order to get the location of all doors').






e() :- (current_position_X(Char_Pos_X), current_position_Y(Char_Pos_Y)),
                                         integer(5), New_Char_Pos_X is Char_Pos_X + 5,
                                         room(New_Char_Pos_X, Char_Pos_Y, _), 
                                         (retract(current_position_X(Char_Pos_X)),
                                         assert(current_position_X(New_Char_Pos_X))).

w() :- (current_position_X(Char_Pos_X), current_position_Y(Char_Pos_Y)),
                                         integer(5), New_Char_Pos_X is Char_Pos_X - 5,
                                         room(New_Char_Pos_X, Char_Pos_Y, _), 
                                         (retract(current_position_X(Char_Pos_X)),
                                         assert(current_position_X(New_Char_Pos_X))).

s() :- (current_position_X(Char_Pos_X), current_position_Y(Char_Pos_Y)),
                                         integer(5), New_Char_Pos_Y is Char_Pos_Y - 5,
                                         room(Char_Pos_X, New_Char_Pos_Y, _), 
                                         (retract(current_position_Y(Char_Pos_Y)),
                                         assert(current_position_Y(New_Char_Pos_Y))).

n() :- (current_position_X(Char_Pos_X), current_position_Y(Char_Pos_Y)),
                                         integer(5), New_Char_Pos_Y is Char_Pos_Y + 5,
                                         room(Char_Pos_X, New_Char_Pos_Y, _), 
                                         (retract(current_position_Y(Char_Pos_Y)),
                                         assert(current_position_Y(New_Char_Pos_Y))).

take(X) :- 
    current_position_X(XValue), current_position_Y(YValue), 
    object_coordinates(XValue, YValue, X),
    assert(add_to_inventory(X)),
    check_if_sword_and_add(X).

check_if_sword_and_add(X) :- 
    weapon_damage(X, _),
    pickup(X).

/*boss fight section*/
continueWithBossFight() :- print_start_text.

/* notas malus boss fight */
:- retractall(player_hp(_)).
:- retractall(enemy_hp(_)).
:- retractall(weapon_in_hand(_,_)).
:- retractall(saved_enemy_move(_,_)).
:- retractall(preparing_for_next_move()).
:- retractall(current_player_state(_)).
:- retractall(enemy_attack_to_execute(_,_)).
:- retractall(player_move_to_execute(_,_)).

:- dynamic saved_enemy_move/2.

:- dynamic preparing_for_next_move/0.

:- dynamic player_hp/1.
player_hp(100).

:- dynamic enemy_hp/1.
enemy_hp(200).

:- dynamic weapon_in_hand/2.
weapon_in_hand(hand, 5).

damage_per_hit() :-
    weapon_in_hand(Weapon,Dmg),
    write('Damage with '),
    write(Weapon),
    writeln(''),
    write('normal hit: '),
    writeln(Dmg),
    write('critical hit: '),
    CritHit is Dmg * 2,
    writeln(CritHit).
    
weapon_damage(sword,45).
/*weapon_damage(mace,20).
weapon_damage(axe,40).
weapon_damage(dagger,10).*/

print_start_text() :-
    writeln(''),
    writeln('This is a boss arena. you have to defeat notas malus'),
    /*writeln('There are 4 weapons to choose from : '),
    writeln('A chunky Mace, a sharp Sword, a huge axe and a sleek dagger - choose wisely'),*/
    writeln('You can get all allowed commands by typing "get_info."'),
    writeln('').

get_info :-
    writeln('You can do the following commands:'),
    writeln(''),
    writeln('get_player_hp - get your hp'),
    writeln('get_enemy_hp - get enemy hp'),
    writeln('is_alive - check if you are alive'),
    writeln('is_enemy_alive - check if enemy is alive'),
    writeln('damage_per_hit - get damage per hit/your weapon'),
    /*writeln('pickup - pick up a weapon'),*/
    writeln('get_all_moves - get all possible moves you can do'),
    writeln('do_move - select a move to do in the next fighting step'),
    writeln('next_fighting_step - fight the boss'),
    writeln('').

is_alive :- player_hp(Hp) , Hp > 0.
is_enemy_alive :- enemy_hp(Hp) , Hp > 0.

get_player_hp :- 
    player_hp(Hp),
    writeln('Your HP: '),
    writeln(Hp).
get_enemy_hp :- 
    enemy_hp(Hp),
    writeln('Enemy HP: '),
    writeln(Hp).

get_all_moves :-
    writeln(''),
    writeln('Moves:'),
    writeln(''),
    writeln('roll - roll to dodge the next attack'),
    writeln('block_attack - block the next attack'),
    writeln('attack - attack the enemy'),
    writeln('jump - jump to doge the next attack'),
    writeln('idle - just the normal state of your player'),
    writeln('-----------'),
    writeln('Note: You have to look for free attack windows in the enemy moveset, where you can hit it.'),
    writeln('Not every dodge can avoid every attack. choose wisely how you avoid damage.'),
    writeln('').

set_new_hp(NewHp) :-
    retractall(player_hp(_)),
    assert(player_hp(NewHp)).
set_new_boss_hp(NewHp) :-
    retractall(enemy_hp(_)),
    assert(enemy_hp(NewHp)).

do_damage_to_player(Dmg) :-
    player_hp(CurrHp),
    (CurrHp - Dmg) =< 0,
    set_new_hp(0),
    writeln('*-*-*-*-*'),
    writeln('You Died!'),
    writeln('*-*-*-*-*'),
    !.
do_damage_to_player(Dmg) :- 
    player_hp(OldHp),
    Temp is OldHp - Dmg,
    set_new_hp(Temp).

do_damage_to_boss(Dmg) :-
    enemy_hp(CurrHp),
    (CurrHp - Dmg) =< 0,
    set_new_boss_hp(0),
    writeln('*-*-*-*-*-*-*-*'),
    writeln('The Boss DIED!'),
    writeln('*-*-*-*-*-*-*-*'),
    writeln('You Won!'),
    !.
do_damage_to_boss(Dmg) :- 
    enemy_hp(OldHp),
    Temp is OldHp - Dmg,
    set_new_boss_hp(Temp).

give_random(X) :-
    random(1,3,X).
random_choise() :-
    give_random(Rand),
    Rand = 1.

pickup(Thing) :-
    not(weapon_damage(Thing,_)),
    write('Thats not a weapon'),
    !.
pickup(Thing) :-
    weapon_damage(Thing,Dmg),
    retractall(weapon_in_hand(_,_)),
    assert(weapon_in_hand(Thing,Dmg)),
    write('You picked up '),
    write(Thing).


/*enemy move. randomly chooses a move and executes it*/
/*just enter "get_current_enemy_move." to get a new action*/
:- dynamic enemy_attack_to_execute/2.

get_current_enemy_move():-
    saved_enemy_move(Move,Dmg),
    do_enemy_move(Move,Dmg),
    !.
get_current_enemy_move() :-
    choose_a_random_new_move_for_enemy(),
    !.

follow_up_move(bigSwingWindupStart,bigSwingWindupContinue).
follow_up_move(bigSwingWindupContinue,bigSwing).
follow_up_move(stompWindup,stomp).
follow_up_move(normalAttackWindup,normalAttack).

do_enemy_move(_,_) :-
    preparing_for_next_move(),
    retractall(preparing_for_next_move()),
    write('Enemy prepares for next move'),
    writeln(''),
    !.

do_enemy_move(Move,Dmg) :-
    follow_up_move(Move,NextMove),
    set_saved_enemy_move(NextMove,Dmg),
    write('Enemy did '),
    write(Move),
    writeln(''),
    !.

do_enemy_move(Move,Dmg) :- 
    /*will execute attack*/
    assert(enemy_attack_to_execute(Move,Dmg)),
    retractall(saved_enemy_move(_,_)),
    assert(preparing_for_next_move()),
    !.

set_saved_enemy_move(Move,Dmg) :-
    retractall(saved_enemy_move(_,_)),
    assert(saved_enemy_move(Move,Dmg)).

choose_a_random_new_move_for_enemy() :-
    random(1,6,NextEnemyMove),
    set_enemy_windup(NextEnemyMove).

set_enemy_windup(MoveNr) :-
    MoveNr = 1,
    set_saved_enemy_move(bigSwingWindupStart,50),
    do_enemy_move(bigSwingWindupStart,50),
    
    !.

set_enemy_windup(MoveNr) :-
    (MoveNr = 2 ; MoveNr = 3),
    set_saved_enemy_move(stompWindup,20),
    do_enemy_move(stompWindup,20),
    !.

set_enemy_windup(_) :-
    set_saved_enemy_move(normalAttackWindup,10),
    do_enemy_move(normalAttackWindup,10),
    !.

/*player moves*/
:- dynamic current_player_state/1.
current_player_state(idle).
:- dynamic player_move_to_execute/2.

player_state(roll).
player_state(jump).
player_state(attack).
player_state(block_attack).
player_state(idle).

player_damage_negation(roll,stomp,10).
player_damage_negation(roll,normalAttack,100).
player_damage_negation(roll,bigSwing,100).

player_damage_negation(jump,stomp,100).
player_damage_negation(jump,normalAttack,10).
player_damage_negation(jump,bigSwing,10).

player_damage_negation(block_attack,stomp,10).
player_damage_negation(block_attack,normalAttack,100).
player_damage_negation(block_attack,bigSwing,0).

player_damage_negation(idle,stomp,0).
player_damage_negation(idle,normalAttack,0).
player_damage_negation(idle,bigSwing,0).

player_damage_negation(attack,stomp,0).
player_damage_negation(attack,normalAttack,0).
player_damage_negation(attack,bigSwing,0).

do_move(Move) :-
    retractall(player_move_to_execute(_,_)),
    set_player_state(Move),
    !.

set_player_state(State) :-
    not(player_state(State)),
    write('Invalid player state'),
    !.

set_player_state(State) :-
    retractall(current_player_state(_)),
    assert(current_player_state(State)),
    select_player_move_to_execute(State),
    !.

select_player_move_to_execute(State) :-
    State = attack,
    weapon_in_hand(_,Dmg),
    assert(player_move_to_execute(State,Dmg)),
    !.
select_player_move_to_execute(State) :-
    State = block_attack,
    assert(player_move_to_execute(State,-1)),
    !.
select_player_move_to_execute(State) :-
    State = roll,
    assert(player_move_to_execute(State,-1)),
    !.
select_player_move_to_execute(State) :-
    State = jump,
    assert(player_move_to_execute(State,-1)),
    !.
select_player_move_to_execute(State) :-
    State = idle,
    assert(player_move_to_execute(State,-1)),
    !.

/*actual fight management*/
next_fighting_step() :-
    not(is_alive),
    writeln('fighting cant happen. you are dead'),
    !.
next_fighting_step() :-
    not(is_enemy_alive),
    writeln('fighting cant happen. enemy is dead'),
    !.
next_fighting_step() :-
    not(player_move_to_execute(_,_)),
    assert(player_move_to_execute(idle,-1)),
    next_fighting_step(),
    !.
next_fighting_step() :-
    get_current_enemy_move(),
    enemy_damage_dealing(),
    retractall(enemy_attack_to_execute(_,_)).
next_fighting_step() :-
    player_damage_dealing(),
    retractall(player_move_to_execute(_,_)).
next_fighting_step() :- 
    writeln('fighting round done'),
    !.
    
enemy_damage_dealing() :-
    enemy_attack_to_execute(EnemyMove,EnemyDmg),
    player_move_to_execute(PlayerMove,_),
    player_damage_negation(PlayerMove,EnemyMove,PlayerDmgNegation),
    DmgForPlayer is EnemyDmg - (EnemyDmg*(PlayerDmgNegation/100)),
    do_damage_to_player(DmgForPlayer),
    writeln('Enemy did move: '),
    write(EnemyMove),
    writeln(''),
    write('Damage: '),
    write(DmgForPlayer),
    writeln(''),
    !.
player_damage_dealing() :-
    player_move_to_execute(PlayerMove,PlayerDmg),
    PlayerDmg > 0,
    player_get_damage(ActualDamage),
    do_damage_to_boss(ActualDamage),
    write('Player did move: '),
    write(PlayerMove),
    writeln(''),
    write('Damage: '),
    write(ActualDamage),
    writeln(''),
    !.

player_get_damage(ReturnDamage) :-
    random(1,4,DmgRoll),
    handle_player_damage_roll(DmgRoll,ReturnDamage),
    !.
handle_player_damage_roll(DmgRoll,ReturnVal) :-
    (DmgRoll == 1),
    weapon_in_hand(_,Dmg),
    ReturnVal is Dmg*2,
    writeln('Critical hit!'),
    !.
handle_player_damage_roll(_,ReturnVal) :-
    weapon_in_hand(_,Dmg),
    ReturnVal is Dmg,
    !.