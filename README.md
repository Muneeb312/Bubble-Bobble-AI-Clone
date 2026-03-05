# Bubble-Bobble-Clone

Updated Bubble Bobble Clone made in Godot using AI-generated assets.
All 2D models were created with Google Gemini Nano Banana 2. Background music was created with Google Gemini Lyria 3. All AI sound effects were created with ElevensLab.

## How to Run

1.  Open Godot 4.x.
2.  Import the `project.godot` file from this folder.
3.  **Main Entry Point:** Run `scenes/main/Main.tscn`
4.  Press **F5** to play the default main scene.


## Controls

The game uses Godot's InputMap system with the following actions:

| Action | Key / Input | Description |
| :--- | :--- | :--- |
| **move_left** | `A` or `Left Arrow` | Move player left |
| **move_right** | `D` or `Right Arrow` | Move player right |
| **jump** | `W` or `Up Arrow` | Jump (with gravity) |
| **fire** | `Spacebar` | Shoot bubble projectile |
| **restart** | `R` | Restart the game (on Game Over) |

## Implemented Features

### Core Requirements
- **Movement & World:** - Player moves left/right and jumps with gravity.
  - TileMap collisions prevent walking through walls or falling through floors.
- **Bubble Shooting:**
  - Player shoots bubbles that travel horizontally and then float upward.
  - Bubbles have a lifetime and despawn automatically.
- **Enemies:**
  - Enemies patrol platforms and turn around at walls.
  - Enemies deal damage to the player on contact.
- **Trapping Mechanic:**
  - Hitting an enemy with a bubble traps them (replaces enemy with "Trapped Bubble").
  - Trapped enemies float upward and are disabled.
- **Scoring & Game Loop:**
  - Popping a trapped enemy increases score.
  - Player has limited lives (HUD displays hearts/lives).
  - Game Over screen appears when lives reach 0, with a Restart option.


## Project Structure

* `scenes/entities/` - Player, Enemy, and Bubble scenes.
* `scenes/world/` - Level layout and TileMap.
* `scripts/` - Logic for movement, game manager, and interactions.
* `assets/` - Sprites.
* `assets/ai/` - AI created assets
