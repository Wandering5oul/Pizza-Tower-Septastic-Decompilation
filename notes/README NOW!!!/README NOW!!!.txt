Pizza Tower Sep-Tastic Decompilation by BananaBoiGames

GameMaker Version: 2023.6.0.139

Scribble Version seems to be at most v8.8.3, which this decomp uses
DO NOT USE ANYTHING HIGHER

Main Enum Declaration in the Project is located in obj_player (Step Event)
This Decomp currently uses UnderAnalyzer's Stock UnknownEnum, but that might change in the future



CURRENT ISSUES:

NONE!
(that I can find now)

you're lucky I fixed a shitton of bullshit

POSSIBLE ISSUES THAT MIGHT RISE:

Basically a lot of Sprites and some TileSets were completely fucked, but I did fix A LOT of broken shit
Tilesets are just aligned wrong (so just reload it on one room, and it'll fix it across the project)
and sprites are in the Old Sprite Order, which doesn't work here, so you have to use UTMT to read the
Sprite order number of a given sprite

Sound does use Old Resource Order for a lot of instances, but they seem to be behaving