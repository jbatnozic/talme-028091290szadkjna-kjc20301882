///sett_reset_display()
/*

*/

var w  = window_get_width(),
    h  = window_get_height(),
    xx = window_get_x(),
    yy = window_get_y();

display_reset( real(string_digits(sett_get_value("Anti-Alias")))
             , sett_get_value("V-Sync")=="On"
             ) ;
             
window_set_rectangle(xx, yy, w, h);
