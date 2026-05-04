
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","sm","ROOM_sm")+" 21?"
    ini_close();
    // Spawns
    global.spawn_len_var = 1;
    global.spawn_arr[0,0] = 160;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
    // Exit
    with instance_create(320,152,spawn_leave_door_trig_obj)
    {
        lock_var = (global.diff_var != 0);
        ini_open(global.lang_var);
        txt_lock_var = ini_read_string("UI","gel","UI_gel");
        ini_close();
    }
');
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
// Floors
room_instance_add(argument0,160,256,floor_obj);
room_instance_add(argument0,192,256,floor_obj);
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,224,224,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,224,288,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,288,192,floor_obj);
room_instance_add(argument0,224,192,floor_obj);
room_instance_add(argument0,256,192,floor_obj);
room_instance_add(argument0,224,320,floor_obj);
room_instance_add(argument0,256,320,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,320,320,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,320,192,floor_obj);
room_instance_add(argument0,320,160,floor_obj);
room_instance_add(argument0,352,192,floor_obj);
room_instance_add(argument0,384,192,floor_obj);
room_instance_add(argument0,384,224,floor_obj);
room_instance_add(argument0,352,224,floor_obj);
room_instance_add(argument0,416,192,floor_obj);
room_instance_add(argument0,416,224,floor_obj);
room_instance_add(argument0,416,256,floor_obj);
room_instance_add(argument0,384,256,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,352,288,floor_obj);
room_instance_add(argument0,384,288,floor_obj);
room_instance_add(argument0,416,288,floor_obj);
room_instance_add(argument0,416,320,floor_obj);
room_instance_add(argument0,384,320,floor_obj);
room_instance_add(argument0,352,320,floor_obj);
// Ceilings
room_instance_add(argument0,160,256,ceil_obj);
room_instance_add(argument0,192,256,ceil_obj);
room_instance_add(argument0,224,256,ceil_obj);
room_instance_add(argument0,224,224,ceil_obj);
room_instance_add(argument0,256,224,ceil_obj);
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,224,288,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,288,224,ceil_obj);
room_instance_add(argument0,288,192,ceil_obj);
room_instance_add(argument0,224,192,ceil_obj);
room_instance_add(argument0,256,192,ceil_obj);
room_instance_add(argument0,224,320,ceil_obj);
room_instance_add(argument0,256,320,ceil_obj);
room_instance_add(argument0,288,320,ceil_obj);
room_instance_add(argument0,320,320,ceil_obj);
room_instance_add(argument0,320,288,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,320,224,ceil_obj);
room_instance_add(argument0,320,192,ceil_obj);
room_instance_add(argument0,320,160,ceil_obj);
room_instance_add(argument0,352,192,ceil_obj);
room_instance_add(argument0,384,192,ceil_obj);
room_instance_add(argument0,384,224,ceil_obj);
room_instance_add(argument0,352,224,ceil_obj);
room_instance_add(argument0,416,192,ceil_obj);
room_instance_add(argument0,416,224,ceil_obj);
room_instance_add(argument0,416,256,ceil_obj);
room_instance_add(argument0,384,256,ceil_obj);
room_instance_add(argument0,352,256,ceil_obj);
room_instance_add(argument0,352,288,ceil_obj);
room_instance_add(argument0,384,288,ceil_obj);
room_instance_add(argument0,416,288,ceil_obj);
room_instance_add(argument0,416,320,ceil_obj);
room_instance_add(argument0,384,320,ceil_obj);
room_instance_add(argument0,352,320,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,160,240,wall_hor_obj);
room_instance_add(argument0,192,240,wall_hor_obj);
room_instance_add(argument0,224,176,wall_hor_obj);
room_instance_add(argument0,320,144,wall_hor_obj);
room_instance_add(argument0,288,176,wall_hor_obj);
room_instance_add(argument0,256,176,wall_hor_obj);
room_instance_add(argument0,224,336,wall_hor_obj);
room_instance_add(argument0,256,336,wall_hor_obj);
room_instance_add(argument0,288,336,wall_hor_obj);
room_instance_add(argument0,320,336,wall_hor_obj);
room_instance_add(argument0,192,272,wall_hor_obj);
room_instance_add(argument0,160,272,wall_hor_obj);
room_instance_add(argument0,352,176,wall_hor_obj);
room_instance_add(argument0,384,176,wall_hor_obj);
room_instance_add(argument0,416,176,wall_hor_obj);
room_instance_add(argument0,416,336,wall_hor_obj);
room_instance_add(argument0,384,336,wall_hor_obj);
room_instance_add(argument0,352,336,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,336,160,wall_vert_obj);
room_instance_add(argument0,304,160,wall_vert_obj);
room_instance_add(argument0,208,224,wall_vert_obj);
room_instance_add(argument0,208,192,wall_vert_obj);
room_instance_add(argument0,208,288,wall_vert_obj);
room_instance_add(argument0,208,320,wall_vert_obj);
room_instance_add(argument0,144,256,wall_vert_obj);
room_instance_add(argument0,432,192,wall_vert_obj);
room_instance_add(argument0,432,224,wall_vert_obj);
room_instance_add(argument0,432,256,wall_vert_obj);
room_instance_add(argument0,432,288,wall_vert_obj);
room_instance_add(argument0,432,320,wall_vert_obj);
// Torches
room_instance_add(argument0,224,176,torch_north_obj);
room_instance_add(argument0,288,176,torch_north_obj);
room_instance_add(argument0,352,176,torch_north_obj);
room_instance_add(argument0,416,176,torch_north_obj);
room_instance_add(argument0,224,336,torch_south_obj);
room_instance_add(argument0,288,336,torch_south_obj);
room_instance_add(argument0,352,336,torch_south_obj);
room_instance_add(argument0,416,336,torch_south_obj);
room_instance_add(argument0,208,320,torch_west_obj);
room_instance_add(argument0,208,192,torch_west_obj);
room_instance_add(argument0,432,320,torch_east_obj);
room_instance_add(argument0,432,192,torch_east_obj);
// Props
room_instance_add(argument0,320,144,door_north_obj);
room_instance_add(argument0,320,256,spawn_slime_obj);
room_instance_add(argument0,416,256,gel_note_obj);
room_instance_add(argument0,416,256,table_obj);
room_instance_add(argument0,256,192,chair_rand_obj);
room_instance_add(argument0,256,320,chair_rand_obj);
room_instance_add(argument0,320,320,chair_rand_obj);
room_instance_add(argument0,384,320,chair_rand_obj);
room_instance_add(argument0,384,192,chair_rand_obj);