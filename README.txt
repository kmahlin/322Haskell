TODO: update this readme

Gravity Maze!

This project completes the Haskell assignment for CSCE 322 at UNL.

The object of this program is to take a maze with player(s), and rotate that maze a given number of times (set in the test file).  If a player reaches the goal of the maze they have won the game.

This Assignment is comprised of 3 parts:
Part01 - One player and only one move is made.
Part02 - One player and multiple moves are made.
Part03 - Multiple players and multiple moves are made.


To run:

Load a Haskell File (i.e. csce322homework03part01)
Type, :main /testFiles/part01/part01test01.g



A maze would look like:

"xxxxxxxxxxxxxxxxxxxx",
"x---x----x---x-----x",
"x----x--x----------x",
"x------------x-----x",
"x-------xx-----x---x",
"xx------x--------1-x",
"xg----------x--xx--x",
"x------x-----x-----x",
"x------------------x",
"x-x------xx---xx--xx",
"x-xx-x--x----------x",
"x------x-x--------xx",
"x-------------x---xx",
"x----x-xx---x------x",
"x---------------x--x",
"xx---xx-----x----x-x",
"x------------x-----x",
"xxxxxxxxxxxxxxxxxxxx"


Rotations Look like:

"180",
"c",
"cc",

Where c and cc are clockwise and counter-clockwise moves respectively.

