TODO: update this readme

Gravity Maze!

This project completes the Haskell assignment for CSCE 322 at UNL.

The object of this program is to take a maze with players, and rotate that maze a given number of times (set in the test file).  If a player reaches the goal of the maze they have won the game.


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

