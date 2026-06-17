/*
Argument 0: Path (no file extension)
Argument 1: Remove Back
Argument 2: Smooth
*/
if file_exists(argument0+".gml") { return execute_file(argument0+".gml",argument0,argument1,argument2); }
if file_exists(argument0+".png") { return background_add(argument0+".png",argument1,argument2); }
if file_exists(argument0+".jpg") { return background_add(argument0+".jpg",argument1,argument2); }
fmod_update_take_over_when_lock_scr();
show_error("Background does not exist!",false);
global.last_time_var = current_time;
display_mouse_set(display_get_width()/2,display_get_height()/2);
fmod_update_take_over_done_scr();
return noone;