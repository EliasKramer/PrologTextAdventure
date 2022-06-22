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
finish() :- write('Well that does not work either. It seems like there is something happening. ').

items() :- 
write('location         coordinates             \n'),
write('Room 1           -10     5 \n'),
write('Room 2            10    15 \n'),
write('Room 2            20   -15 \n').

object_coordinates(0, 0, flashlight).
object_coordinates(-10, 5, weapon).
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



take(X) :- current_position_X(XValue), current_position_Y(YValue), 
object_coordinates(XValue, YValue, X),
                                assert(add_to_inventory(X)).








