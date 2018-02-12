///place_meeting_terrain(X, Y)
/*
Check whether a dynamic instance placed at (X,Y) position would
collide with any terrain cells.
*/

return HG_collision_rectangle(-1,
                              argument0-_width/2,
                              argument1-_height/2,
                              argument0+_width/2,
                              argument1+_height/2,
                              12);
