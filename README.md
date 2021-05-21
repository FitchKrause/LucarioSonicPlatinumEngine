# Lucario's Sonic Platinum Engine

It's a now open source classic Sonic 2 engine for GameMaker Studio 2.

Based on Sonic Studio Engine by Joevan Salmon-Johnson ("VectorSatyr").

It tries to give a classic Sonic experience with some additions like Dropdash, Instashield and the use of shield's abilities for other characters like Knuckles and Tails.


# Installation
1. Get Game Maker Studio 2 with Windows Desktop. *Minimum version: 2.3.0.*
2. Clone or fork this repository.
3. Open the project file into Game Maker Studio 2.
4. If you want, test it by compiling it.
5. Be free for modifiying it.
6. Important, just please give me credits when you use it in your fangame.


# Current features

## General
- Sonic 2's physics with modifications to work kinda better with slopes and ramps.
- Extended music system.
- A work in progress main menu and pause menu.
- Experimental splitscreen mode.
- Experimental controller support.
- Debug mode. (Only places a defined list of objects).

## Objects
- Standard rings with their classic Sonic's mechanics.
- Standard checkpoints for respawning.
- Standard springs from Sonic 2, inclusing diagonal springs. And custom springs added.
- Monitors from Sonic 1, 2 and 3k using Sonic 2's monitor sprite design.
- Mobious spirals from Sonic 2's Emerald Hill Zone.
- Marble block pushable.
- Marble blocks breakable.
- Signpost and animal capsule from Sonic 2.
- Spikes from Sonic 2 with a special flag to activate Sonic 1's spike bug behaviour.

## Visuals
- Toggleable powerup indicator at the bottom right.
- CUstomizable HUD, ScoreCard and TitleCard. (Only custom defined, sonic 1 style and sonic 2 style works for the moment).
- Toggleable option to display continues counter above lives counter.
- Toggleable option to show leading zeroes on all the counters.
- Transparency optio for the HUD, doesn't afects titlecard and scorecard.

## Characters
- Sonic the hedgehog.
- Miles "Tails" Prower.
- Knuckles the echidna.

### General abilities
- Make spindash on looking down.
- Spin when running or walking.
- Use shield's abilities if they have a shield.
- Can break every breakeable floor while spinning.

### Sonic abilities
- Has the dropdash and works like Sonic Mania's behaviour. (B button).
- Have the ability of Sonic 3's instashield if he doesn't have any shield. (A button).
- Can transform into Super Sonic when he collect all the seven Chaos Emeralds. (Z button).

### Tails abilities
- Can use flight while on air, and ascend while flighting. (A button).
- It's actually posible to cancel flight. (C button).
- While flighting you can decend. (B button).

### Knuckles abilities
- Can glide while on air. (A button).
- Can climb walls after collising with it while gliding, after reaching to a corner it will climb at the top of it.
- Can destroy breakable walls without spinning.
