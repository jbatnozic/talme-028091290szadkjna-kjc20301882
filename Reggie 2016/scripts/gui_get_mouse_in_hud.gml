///gui_get_mouse_in_hud()
/*
Returns false if the mouse cursor is not in the HUD, otherwise:
 1 - Top left, info window.
 2 - Bottom left, item selection.
 3 - Heart (Pending).
*/

return obj_game_controller._mouseHudPos;
