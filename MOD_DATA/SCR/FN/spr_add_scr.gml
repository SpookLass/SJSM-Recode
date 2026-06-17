/*
Argument 0: Path (no file extension)
Argument 1: Image Number
Argument 2: Remove Back
Argument 3: Smooth
Argument 4: X Origin
Argument 5: Y Origin
*/
if file_exists(argument0+".gml") { return execute_file(argument0+".gml",argument0,argument1,argument2,argument3,argument4,argument5); }
if file_exists(argument0+".png") { return sprite_add(argument0+".png",argument1,argument2,argument3,argument4,argument5); }
if file_exists(argument0+".gif") { return sprite_add(argument0+".gif",argument1,argument2,argument3,argument4,argument5); }
if file_exists(argument0+".jpg") { return sprite_add(argument0+".jpg",argument1,argument2,argument3,argument4,argument5); }
fmod_update_take_over_when_lock_scr();
show_error("Sprite does not exist!",false);
global.last_time_var = current_time;
display_mouse_set(display_get_width()/2,display_get_height()/2);
fmod_update_take_over_done_scr();
return noone;