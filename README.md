# Godot Medieval 4X Game
My first Godot medieval 4X game. First part of my project game consisting of a 4X game with 2 main parts:
* Medieval to Space Era 4X game on a single planet based on square cells around a world 
* When Space Era is reached, the game becomes a Space 4X

## Specification

### Medieval 4X

#### Abstract

The world is designed on a flat map composed by multiple square cells on wich the player can construct buildings or cities. A square cell is defined by:
* A type (rock land, mountains, plains, forest)
    For example, in cities on plains, player will be available to build farms that produce food
* An amount of availabled ressources (wood,rock,mineral)

A cell must be recognized by 'scouts' afterwhat, player will able to construct outpost, then construct building to mine minerals, cut wood and may be more (TBD : food construct by city district or by specific buildings not within the city ?). When the outpost is created, the player can next send a colony to construct new city.

Research mechanism (TBD) will grant new techs and then player will be able to pass new era 
(Medieval (Monastery) => Renaissance () => Industrial () => Space()).

Depending on the map size (N_tiles x M_tiles), there will be one or more ennemies that will try 

#### TBD