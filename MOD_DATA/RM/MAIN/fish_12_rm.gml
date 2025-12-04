/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','fish','ROOM_fish')+' 12';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 416;
    global.spawn_arr[1,1] = 384;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 374;
    global.mark_arr[0,1] = 262;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 477;
    global.mark_arr[1,1] = 260;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 477;
    global.mark_arr[2,1] = 450;
    global.mark_arr[2,2] = 0;
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
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,color_control_med_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,352,224,floor_obj);
room_instance_add(argument0,384,224,floor_obj);
room_instance_add(argument0,384,256,floor_obj);
room_instance_add(argument0,384,288,floor_obj);
room_instance_add(argument0,352,288,floor_obj);
room_instance_add(argument0,416,256,floor_obj);
room_instance_add(argument0,416,288,floor_obj);
room_instance_add(argument0,448,256,floor_obj);
room_instance_add(argument0,480,256,floor_obj);
room_instance_add(argument0,480,288,floor_obj);
room_instance_add(argument0,480,320,floor_obj);
room_instance_add(argument0,480,352,floor_obj);
room_instance_add(argument0,480,384,floor_obj);
room_instance_add(argument0,480,416,floor_obj);
room_instance_add(argument0,480,448,floor_obj);
room_instance_add(argument0,448,448,floor_obj);
room_instance_add(argument0,416,448,floor_obj);
room_instance_add(argument0,384,448,floor_obj);
room_instance_add(argument0,384,416,floor_obj);
room_instance_add(argument0,384,384,floor_obj);
room_instance_add(argument0,416,384,floor_obj);
room_instance_add(argument0,416,224,floor_obj);
// Ceilings
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,352,256,ceil_obj);
room_instance_add(argument0,352,224,ceil_obj);
room_instance_add(argument0,384,224,ceil_obj);
room_instance_add(argument0,384,256,ceil_obj);
room_instance_add(argument0,384,288,ceil_obj);
room_instance_add(argument0,352,288,ceil_obj);
room_instance_add(argument0,416,256,ceil_obj);
room_instance_add(argument0,416,288,ceil_obj);
room_instance_add(argument0,448,256,ceil_obj);
room_instance_add(argument0,480,256,ceil_obj);
room_instance_add(argument0,480,288,ceil_obj);
room_instance_add(argument0,480,320,ceil_obj);
room_instance_add(argument0,480,352,ceil_obj);
room_instance_add(argument0,480,384,ceil_obj);
room_instance_add(argument0,480,416,ceil_obj);
room_instance_add(argument0,480,448,ceil_obj);
room_instance_add(argument0,448,448,ceil_obj);
room_instance_add(argument0,416,448,ceil_obj);
room_instance_add(argument0,384,448,ceil_obj);
room_instance_add(argument0,384,416,ceil_obj);
room_instance_add(argument0,384,384,ceil_obj);
room_instance_add(argument0,416,384,ceil_obj);
room_instance_add(argument0,416,224,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,256,240,wall_hor_obj);
room_instance_add(argument0,256,272,wall_hor_obj);
room_instance_add(argument0,288,272,wall_hor_obj);
room_instance_add(argument0,320,272,wall_hor_obj);
room_instance_add(argument0,352,304,wall_hor_obj);
room_instance_add(argument0,384,304,wall_hor_obj);
room_instance_add(argument0,416,304,wall_hor_obj);
room_instance_add(argument0,416,400,wall_hor_obj);
room_instance_add(argument0,416,368,wall_hor_obj);
room_instance_add(argument0,384,368,wall_hor_obj);
room_instance_add(argument0,352,208,wall_hor_obj);
room_instance_add(argument0,320,240,wall_hor_obj);
room_instance_add(argument0,288,240,wall_hor_obj);
room_instance_add(argument0,384,208,wall_hor_obj);
room_instance_add(argument0,416,208,wall_hor_obj);
room_instance_add(argument0,448,240,wall_hor_obj);
room_instance_add(argument0,448,272,wall_hor_obj);
room_instance_add(argument0,480,240,wall_hor_obj);
room_instance_add(argument0,480,464,wall_hor_obj);
room_instance_add(argument0,448,432,wall_hor_obj);
room_instance_add(argument0,416,432,wall_hor_obj);
room_instance_add(argument0,448,464,wall_hor_obj);
room_instance_add(argument0,416,464,wall_hor_obj);
room_instance_add(argument0,384,464,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,240,256,wall_vert_obj);
room_instance_add(argument0,368,384,wall_vert_obj);
room_instance_add(argument0,432,384,wall_vert_obj);
room_instance_add(argument0,400,416,wall_vert_obj);
room_instance_add(argument0,368,416,wall_vert_obj);
room_instance_add(argument0,368,448,wall_vert_obj);
room_instance_add(argument0,464,416,wall_vert_obj);
room_instance_add(argument0,464,384,wall_vert_obj);
room_instance_add(argument0,464,352,wall_vert_obj);
room_instance_add(argument0,464,320,wall_vert_obj);
room_instance_add(argument0,464,288,wall_vert_obj);
room_instance_add(argument0,496,256,wall_vert_obj);
room_instance_add(argument0,496,288,wall_vert_obj);
room_instance_add(argument0,496,320,wall_vert_obj);
room_instance_add(argument0,496,352,wall_vert_obj);
room_instance_add(argument0,496,384,wall_vert_obj);
room_instance_add(argument0,496,416,wall_vert_obj);
room_instance_add(argument0,496,448,wall_vert_obj);
room_instance_add(argument0,432,288,wall_vert_obj);
room_instance_add(argument0,432,224,wall_vert_obj);
room_instance_add(argument0,336,224,wall_vert_obj);
room_instance_add(argument0,336,288,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,416,224,tank_rand_obj);
room_instance_add(argument0,416,288,tank_rand_obj);
room_instance_add(argument0,384,288,tank_rand_obj);
room_instance_add(argument0,352,288,tank_rand_obj);