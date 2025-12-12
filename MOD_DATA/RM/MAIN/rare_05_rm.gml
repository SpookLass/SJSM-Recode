/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","map","ROOM_map");
    ini_close();
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 496;
    global.spawn_arr[0,1] = 448;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 592;
    global.spawn_arr[1,1] = 400;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 592;
    global.spawn_arr[2,1] = 496;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    // Mark
    global.mark_len_var = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
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
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,496,448,floor_obj);
room_instance_add(argument0,528,448,floor_obj);
room_instance_add(argument0,496,416,floor_obj);
room_instance_add(argument0,528,416,floor_obj);
room_instance_add(argument0,496,480,floor_obj);
room_instance_add(argument0,528,480,floor_obj);
room_instance_add(argument0,560,480,floor_obj);
room_instance_add(argument0,560,448,floor_obj);
room_instance_add(argument0,560,416,floor_obj);
room_instance_add(argument0,592,416,floor_obj);
room_instance_add(argument0,592,448,floor_obj);
room_instance_add(argument0,592,480,floor_obj);
room_instance_add(argument0,528,384,floor_obj);
room_instance_add(argument0,560,384,floor_obj);
room_instance_add(argument0,592,384,floor_obj);
room_instance_add(argument0,592,512,floor_obj);
room_instance_add(argument0,560,512,floor_obj);
room_instance_add(argument0,528,512,floor_obj);
//Ceilings
room_instance_add(argument0,496,448,ceil_2high_obj);
room_instance_add(argument0,528,448,ceil_2high_obj);
room_instance_add(argument0,496,416,ceil_2high_obj);
room_instance_add(argument0,528,416,ceil_2high_obj);
room_instance_add(argument0,496,480,ceil_2high_obj);
room_instance_add(argument0,528,480,ceil_2high_obj);
room_instance_add(argument0,560,480,ceil_2high_obj);
room_instance_add(argument0,560,448,ceil_2high_obj);
room_instance_add(argument0,560,416,ceil_2high_obj);
room_instance_add(argument0,592,416,ceil_2high_obj);
room_instance_add(argument0,592,448,ceil_2high_obj);
room_instance_add(argument0,592,480,ceil_2high_obj);
room_instance_add(argument0,528,384,ceil_2high_obj);
room_instance_add(argument0,560,384,ceil_2high_obj);
room_instance_add(argument0,592,384,ceil_2high_obj);
room_instance_add(argument0,592,512,ceil_2high_obj);
room_instance_add(argument0,560,512,ceil_2high_obj);
room_instance_add(argument0,528,512,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,496,400,wall_2high_hor_obj);
room_instance_add(argument0,496,496,wall_2high_hor_obj);
room_instance_add(argument0,528,528,wall_2high_hor_obj);
room_instance_add(argument0,560,528,wall_2high_hor_obj);
room_instance_add(argument0,592,528,wall_2high_hor_obj);
room_instance_add(argument0,592,368,wall_2high_hor_obj);
room_instance_add(argument0,560,368,wall_2high_hor_obj);
room_instance_add(argument0,528,368,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,512,384,wall_2high_vert_obj);
room_instance_add(argument0,480,416,wall_2high_vert_obj);
room_instance_add(argument0,480,448,wall_2high_vert_obj);
room_instance_add(argument0,480,480,wall_2high_vert_obj);
room_instance_add(argument0,512,512,wall_2high_vert_obj);
room_instance_add(argument0,608,512,wall_2high_vert_obj);
room_instance_add(argument0,608,480,wall_2high_vert_obj);
room_instance_add(argument0,608,448,wall_2high_vert_obj);
room_instance_add(argument0,608,416,wall_2high_vert_obj);
room_instance_add(argument0,608,384,wall_2high_vert_obj);
// Props
room_instance_add(argument0,292,520,table_obj);
room_instance_add(argument0,240,512,chair_east_obj);
room_instance_add(argument0,292,508,fan_obj);
room_instance_add(argument0,292,508,table_obj);
// Phone
room_instance_add(argument0,272,512,phone_trig_obj);
room_instance_add(argument0,292,517,phone_obj);
// Map
room_instance_add(argument0,608,448,map_obj);


// Unused
room_instance_add(argument0,0,0,map_control);
room_instance_add(argument0,0,-16,map_mini_01);
room_instance_add(argument0,160,80,map_mini_02);
room_instance_add(argument0,32,48,map_mini_03);
room_instance_add(argument0,64,144,map_mini_04);
room_instance_add(argument0,96,48,map_mini_05);
room_instance_add(argument0,176,176,map_mini_06);
room_instance_add(argument0,224,16,map_mini_07);