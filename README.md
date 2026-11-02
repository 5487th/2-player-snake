# Snake Arena

Snake Arena is a local two-player arcade snake game built with Godot 4. The goal is simple: collect apples, grow your tail, and avoid crashing into walls, your own body, or the opponent.

This project includes a title screen, a game arena, winner/replay flow, and audio feedback for movement and consumption events.

## Features

- Local 2-player gameplay
- Separate controls for Player 1 and Player 2
- Dynamic apple spawning and snake growth
- Collision detection for self, opponent, and arena boundaries
- Win/draw logic with transition to a replay screen
- Audio cues for movement and eating
- Clean Godot scene-based project structure

## Controls

Player 1:
- W / A / S / D to move

Player 2:
- Arrow keys to move

## Game Flow

1. Launch the game from the main menu.
2. Press any key to start the match.
3. Players compete to eat apples and survive longer than their rival.
4. A player loses when they hit a wall, their own body, or the opponent's tail.
5. The winner is shown on the replay screen, and the match can be restarted.

## Project Structure

- `project.godot` — Godot project configuration and input mappings
- `scenes/` — main game, menu, replay, and snake scene definitions
- `scripts/` — gameplay logic and scene transitions
- `assets/` — sprites, fonts, and sounds
- `addons/` — editor plugin support (includes Godot Super Wakatime)

## Main Gameplay Scripts

- `scripts/main_menu.gd` — menu button logic and transition to the game scene
- `scripts/scene_manager.gd` — handles scene changes between menu, game, and replay states
- `scripts/snake.gd` — player metadata and snake identity
- `scripts/snake_movement_manager.gd` — directional movement, wrapping, rotation, and segment updates
- `scripts/snake_interaction_manager.gd` — collision detection, apples, win/draw conditions, and scene transitions
- `scripts/apple_spawner.gd` — random apple placement that avoids both snakes and their bodies
- `scripts/replay_menu.gd` — displays the final result and transitions back to the game

## Technical Notes

The game uses:

- Godot 4 project configuration (`project.godot`)
- Node2D-based gameplay architecture
- Timer-driven movement updates for consistent snake motion
- Autoloaded scene data for passing winner information between game and replay screens

## Running the Project

1. Install Godot 4.x.
2. Open the project folder in the Godot editor.
3. Press F5 or click Run to launch the game.

## Credits

- Game design and implementation: custom project code and scene assets in this repository
- Audio and visuals: included in the `assets/` folder
- Editor support: `addons/godot_super-wakatime` plugin

## License

This project currently does not include a custom license file. Check the repository root and any third-party asset/plugin documentation before distributing or publishing the project.
