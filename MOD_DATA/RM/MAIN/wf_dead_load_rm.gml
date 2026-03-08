/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string("ROOM","load","ROOM_load");
	ini_close();
    // 2D Draw
    d3d_end();
    global.draw_3d_var = false;
');
// Room settings
room_set_width(argument0,640);
room_set_height(argument0,480);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,640,480,0,0,640,480,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,640,480,0,0,640,480,32,32,-1,-1,noone);
// Menu
room_instance_add(argument0,0,0,wf_dead_load_obj);