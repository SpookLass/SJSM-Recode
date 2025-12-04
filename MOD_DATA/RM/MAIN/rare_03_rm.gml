/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Lets-Player Room'
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 208;
    global.spawn_arr[0,1] = 240;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 496;
    global.spawn_arr[1,1] = 320;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
");
// Room settings
room_set_width(argument0,1280);
room_set_height(argument0,720);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Effects
room_instance_add(argument0,0,0,fog_white_obj);
room_instance_add(argument0,0,0,maze_color_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,208,240,floor_obj);
room_instance_add(argument0,208,272,floor_obj);
room_instance_add(argument0,240,240,floor_obj);
room_instance_add(argument0,240,272,floor_obj);
room_instance_add(argument0,272,240,floor_obj);
room_instance_add(argument0,272,272,floor_obj);
room_instance_add(argument0,304,272,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
room_instance_add(argument0,336,272,floor_obj);
room_instance_add(argument0,208,304,floor_obj);
room_instance_add(argument0,240,304,floor_obj);
room_instance_add(argument0,272,304,floor_obj);
room_instance_add(argument0,304,304,floor_obj);
room_instance_add(argument0,336,304,floor_obj);
room_instance_add(argument0,336,336,floor_obj);
room_instance_add(argument0,304,336,floor_obj);
room_instance_add(argument0,272,336,floor_obj);
room_instance_add(argument0,240,336,floor_obj);
room_instance_add(argument0,208,336,floor_obj);
room_instance_add(argument0,368,336,floor_obj);
room_instance_add(argument0,400,336,floor_obj);
room_instance_add(argument0,432,336,floor_obj);
room_instance_add(argument0,464,336,floor_obj);
room_instance_add(argument0,496,336,floor_obj);
room_instance_add(argument0,368,304,floor_obj);
room_instance_add(argument0,400,304,floor_obj);
room_instance_add(argument0,432,304,floor_obj);
room_instance_add(argument0,496,304,floor_obj);
room_instance_add(argument0,464,304,floor_obj);
//Ceilings
room_instance_add(argument0,208,240,ceil_obj);
room_instance_add(argument0,208,272,ceil_obj);
room_instance_add(argument0,240,240,ceil_obj);
room_instance_add(argument0,240,272,ceil_obj);
room_instance_add(argument0,272,240,ceil_obj);
room_instance_add(argument0,272,272,ceil_obj);
room_instance_add(argument0,304,272,ceil_obj);
room_instance_add(argument0,304,240,ceil_obj);
room_instance_add(argument0,336,240,ceil_obj);
room_instance_add(argument0,336,272,ceil_obj);
room_instance_add(argument0,208,304,ceil_obj);
room_instance_add(argument0,240,304,ceil_obj);
room_instance_add(argument0,272,304,ceil_obj);
room_instance_add(argument0,304,304,ceil_obj);
room_instance_add(argument0,336,304,ceil_obj);
room_instance_add(argument0,336,336,ceil_obj);
room_instance_add(argument0,304,336,ceil_obj);
room_instance_add(argument0,272,336,ceil_obj);
room_instance_add(argument0,240,336,ceil_obj);
room_instance_add(argument0,208,336,ceil_obj);
room_instance_add(argument0,368,336,ceil_obj);
room_instance_add(argument0,400,336,ceil_obj);
room_instance_add(argument0,432,336,ceil_obj);
room_instance_add(argument0,464,336,ceil_obj);
room_instance_add(argument0,496,336,ceil_obj);
room_instance_add(argument0,368,304,ceil_obj);
room_instance_add(argument0,400,304,ceil_obj);
room_instance_add(argument0,432,304,ceil_obj);
room_instance_add(argument0,496,304,ceil_obj);
room_instance_add(argument0,464,304,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,208,224,wall_hor_obj);
room_instance_add(argument0,496,352,wall_hor_obj);
room_instance_add(argument0,368,352,wall_hor_obj);
room_instance_add(argument0,400,352,wall_hor_obj);
room_instance_add(argument0,432,352,wall_hor_obj);
room_instance_add(argument0,464,352,wall_hor_obj);
room_instance_add(argument0,336,352,wall_hor_obj);
room_instance_add(argument0,304,352,wall_hor_obj);
room_instance_add(argument0,272,352,wall_hor_obj);
room_instance_add(argument0,240,352,wall_hor_obj);
room_instance_add(argument0,208,352,wall_hor_obj);
room_instance_add(argument0,368,288,wall_hor_obj);
room_instance_add(argument0,400,288,wall_hor_obj);
room_instance_add(argument0,432,288,wall_hor_obj);
room_instance_add(argument0,464,288,wall_hor_obj);
room_instance_add(argument0,496,288,wall_hor_obj);
room_instance_add(argument0,240,224,window_lp_hor_obj);
room_instance_add(argument0,272,224,window_lp_hor_obj);
room_instance_add(argument0,304,224,window_lp_hor_obj);
room_instance_add(argument0,336,224,window_lp_hor_obj);
room_instance_add(argument0,368,256,wall_white_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,192,240,wall_vert_obj);
room_instance_add(argument0,192,272,wall_vert_obj);
room_instance_add(argument0,192,304,wall_vert_obj);
room_instance_add(argument0,192,336,wall_vert_obj);
room_instance_add(argument0,512,336,wall_vert_obj);
room_instance_add(argument0,512,304,wall_vert_obj);
room_instance_add(argument0,352,272,wall_vert_obj);
room_instance_add(argument0,352,240,window_lp_vert_obj);
room_instance_add(argument0,384,240,wall_white_vert_obj);
room_instance_add(argument0,224,208,wall_white_vert_obj);
// Props
room_instance_add(argument0,240,208,bush_obj);
room_instance_add(argument0,288,144,bush_obj);
room_instance_add(argument0,336,192,bush_obj);
room_instance_add(argument0,368,240,bush_obj);
room_instance_add(argument0,316,211,bush_obj);
room_instance_add(argument0,272,205,bush_obj);
room_instance_add(argument0,385,192,bush_obj);
room_instance_add(argument0,440,167,bush_obj);
room_instance_add(argument0,373,121,bush_obj);
room_instance_add(argument0,229,139,bush_obj);
room_instance_add(argument0,384,288,lp_pic1_obj);
room_instance_add(argument0,408,288,lp_pic2_obj);
room_instance_add(argument0,432,288,lp_pic3_obj);
room_instance_add(argument0,456,288,lp_pic4_obj);
room_instance_add(argument0,224,336,table_obj);
room_instance_add(argument0,272,344,seat_obj);