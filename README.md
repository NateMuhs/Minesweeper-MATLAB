# MATLAB Minesweeper

A simple **text–based Minesweeper game** implemented in MATLAB using basic matrices, loops, and conditionals.  
The game is played on a **5 × 5 grid** with **3 randomly placed mines**. Each turn, the player chooses to either:

- **Investigate** a location (reveal it), or  
- **Diffuse** a suspected mine.

The goal is to successfully diffuse all mines **without triggering one**.

---

## Features

- 5 × 5 game board stored as MATLAB matrices  
- 3 randomly placed mines at the start of each game  
- Two actions per turn: **Investigate** or **Diffuse**  
- Automatic counting of mines surrounding each cell  
- Flood-fill–style reveal when a zero–mine cell is investigated  
- Input validation for row/column entries  
- Clear text instructions printed to the Command Window

---

## Game Rules (How It Works)

1. At the start of the game, a **5 × 5 hidden board** is created:
   - Exactly **3 cells** are randomly chosen to contain mines.
   - All other cells store the **number of mines in the surrounding 8 neighbors**.

2. The player does **not** see the mines or numbers directly. Instead, they see:
   - `#` for unrevealed cells
   - A number (`0–8`) for revealed cells
   - A special marker (e.g., `F`) for diffused/flagged cells (depending on your implementation)

3. On each turn the player:
   - Chooses **Investigate** or **Diffuse**
   - Enters a **row** and **column** (1–5)

4. Possible outcomes when **Investigating**:
   - If the location has a **mine**, it explodes → **Game Over**.
   - If the location has **0 neighboring mines**, the game automatically reveals nearby zero cells (and their neighbors).
   - Otherwise, the cell simply shows the **number of neighboring mines**.

5. Possible outcomes when **Diffusing**:
   - If a mine is actually there, it is **successfully diffused**.
   - If there is no mine, you **waste a diffusion** (and may lose, depending on your rules).

6. **Win Condition**:
   - All mines have been diffused (or, depending on your rules, all safe cells are revealed).

---

## Project Structure

Example file layout (adapt these names to match your project):

```text
Minesweeper.m             % Main script: starts and runs the game loop
PopulateGameBoard.m       % Creates the minefield & counts neighboring mines
DisplayGameBoard.m        % Shows the current visible board to the player
ProcessMove.m             % Handles investigate/diffuse logic for a move
CheckWinCondition.m       % Checks if the player has won
