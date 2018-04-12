///place_meeting_solid(X, Y)
/*
NOTE: Caller must have _width and _height variables and its collision mask must be centered.
*/

return HG_collision_rectangle(-1, 
                              argument0 - _width / 2,
                              argument1 - _height / 2,
                              argument0 + _width / 2,
                              argument1 + _height / 2,
                              GLOBAL.precision);
