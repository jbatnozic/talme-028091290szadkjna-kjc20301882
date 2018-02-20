/*

BACKGROUND: 100 .. 16

- Parallax backgrounds      -> 100  

- "Far back" particles      -> 75   **

- Background objects/tiles  -> ~50  []

- "Back" particles          -> 25   **

MIDDLE: 15 .. -15

- "Close back" particles    -> 8    **

- Enemies NPCs, Other       -> 2

- Player/Reggie     !!!     -> 0
  (Note: Player weapons -> +1, Their projectiles -> -1, with late recoil)
  
- Enemies, NPCs, Other      -> -2

- "Close fore" particles    -> -8   **

- Terrain                   -> -10  []

- Terrain detail tiles      -> -12  []

FOREGROUND: -16 .. -89

- "Fore" particles          -> -25  **

- Foreground objects/tiles  -> ~-50 []

- "Far fore" particles      -> -75  **

CONTROLLERS: -90 .. -200

- Various

TILE LAYERS AT:

  50, -50, -10 (automatic), -12, Other if needed
  
PARTICLE SYSTEMS AT:
  
  75, 25, 8, -8, -25, -75
  
*/








