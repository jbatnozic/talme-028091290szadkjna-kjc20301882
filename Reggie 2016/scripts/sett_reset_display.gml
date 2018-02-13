///sett_reset_display()
/*

*/

display_reset( real(string_digits(sett_get_value("Anti-Alias")))
             , sett_get_value("V-Sync")=="On"
             ) ;
