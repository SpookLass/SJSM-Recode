// execute_file(main_directory_const+"\SCR\LOAD\scr_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\set_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\spr_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\bg_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\snd_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\mdl_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\coll_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\obj_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\rm_load_scr.gml");
// Set variables
texture_set_repeat(true);
action_set_cursor(-1,false);
draw_set_color(c_white);
draw_set_alpha(1);
d3d_set_lighting(false);
d3d_set_culling(false);
d3d_set_hidden(false);
draw_set_font(main_font);
// Load in the STUFF
instance_create(0,0,global.control_obj);
instance_create(0,0,global.player_obj);
instance_create(0,0,global.hud_obj);
caster_loop(amb_10_snd,global.vol_var,1);
room_goto(global.hall_01_rm);