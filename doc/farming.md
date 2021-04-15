# Farming program
Farming program is an software for manage harvesting crops.

# Download
Type in computer of turtle :
> pastebin get https://pastebin.com/LyCGMPBN farming

or if the wget program is installed, used wget for download program in the repository.

# Usage
## Defintion of actions
Create actions.txt (relative to directory to call program) :
The list of orders is delimiter for a pipe (|). All orders in one line.
The orders is :
* D : Move down
* U : Move up
* L : Turn left
* R : Turn right
* F : Move forward
* B : Move backward
* T : Picks up item in front of turle (ground or inventory)
* G : Drop item in front of turtle (ground or inventory)
* S : Select slot number
* I : Breaks the block in front of turtle
* J : Breaks the block in down of turtle
* K : Breaks the block in up of turtle
* P : Place a block in front or tutle

For T & G, the number used for indicate the number of block has picks up or drop.

For S, the number used for indicate the slot number at selected.

For I, J, K & P, number is not used.

For other commands, number is used for indicate the number of times action should be performed. 

The number is indicate with the space separation of command, for example :
> L 2

Indicate turn left x2.

> G

Indicate drop one item.
Number is default one action if not specified.

> L 2|F|U 2

Indicate turn left x2, move forward x1, move up x2.

## Program
Simply run program after creating & configuring **actions.txt**.
