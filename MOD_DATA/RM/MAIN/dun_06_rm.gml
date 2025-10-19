/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','dun','ROOM_dun')+' 6';
    ini_close();
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 496;
    global.spawn_arr[1,1] = 320;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    global.spawn_arr[2,0] = 496;
    global.spawn_arr[2,1] = 192;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    // Mark
    global.mark_len_var = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    local.entrance = instance_create(global.spawn_arr[0,0]-lengthdir_x(16,global.spawn_arr[0,3]),global.spawn_arr[0,1]-lengthdir_y(16,global.spawn_arr[0,3]),door_entrance_obj);
    local.entrance.z = global.spawn_arr[0,2];
    local.entrance.direction = global.spawn_arr[0,3]+180;
    for (local.i=1; local.i<global.spawn_len_var; local.i+=1;)
    {
        local.exitdoor = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(16,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(16,global.spawn_arr[local.i,3]),door_obj);
        local.exitdoor.direction = global.spawn_arr[local.i,3]+180;
        local.exittrig = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),door_trig_obj);
        local.exittrig.z = global.spawn_arr[local.i,2];
    }
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,224,224,floor_obj);
room_instance_add(argument0,224,288,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,352,224,floor_obj);
room_instance_add(argument0,352,288,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,384,224,floor_obj);
room_instance_add(argument0,384,256,floor_obj);
room_instance_add(argument0,384,288,floor_obj);
room_instance_add(argument0,416,288,floor_obj);
room_instance_add(argument0,416,256,floor_obj);
room_instance_add(argument0,416,224,floor_obj);
room_instance_add(argument0,448,192,floor_obj);
room_instance_add(argument0,480,192,floor_obj);
room_instance_add(argument0,512,192,floor_obj);
room_instance_add(argument0,544,192,floor_obj);
room_instance_add(argument0,544,224,floor_obj);
room_instance_add(argument0,544,256,floor_obj);
room_instance_add(argument0,544,288,floor_obj);
room_instance_add(argument0,544,320,floor_obj);
room_instance_add(argument0,512,320,floor_obj);
room_instance_add(argument0,480,320,floor_obj);
room_instance_add(argument0,448,320,floor_obj);
room_instance_add(argument0,448,288,floor_obj);
room_instance_add(argument0,448,256,floor_obj);
room_instance_add(argument0,448,224,floor_obj);
room_instance_add(argument0,480,224,floor_obj);
room_instance_add(argument0,512,224,floor_obj);
room_instance_add(argument0,512,256,floor_obj);
room_instance_add(argument0,480,256,floor_obj);
room_instance_add(argument0,480,288,floor_obj);
room_instance_add(argument0,512,288,floor_obj);
// Ceilings
room_instance_add(argument0,224,256,ceil_2high_obj);
room_instance_add(argument0,256,256,ceil_2high_obj);
room_instance_add(argument0,288,256,ceil_2high_obj);
room_instance_add(argument0,320,256,ceil_2high_obj);
room_instance_add(argument0,352,256,ceil_2high_obj);
room_instance_add(argument0,224,224,ceil_2high_obj);
room_instance_add(argument0,224,288,ceil_2high_obj);
room_instance_add(argument0,288,288,ceil_2high_obj);
room_instance_add(argument0,288,224,ceil_2high_obj);
room_instance_add(argument0,352,224,ceil_2high_obj);
room_instance_add(argument0,352,288,ceil_2high_obj);
room_instance_add(argument0,320,288,ceil_2high_obj);
room_instance_add(argument0,320,224,ceil_2high_obj);
room_instance_add(argument0,256,224,ceil_2high_obj);
room_instance_add(argument0,256,288,ceil_2high_obj);
room_instance_add(argument0,384,224,ceil_2high_obj);
room_instance_add(argument0,384,256,ceil_2high_obj);
room_instance_add(argument0,384,288,ceil_2high_obj);
room_instance_add(argument0,416,288,ceil_2high_obj);
room_instance_add(argument0,416,256,ceil_2high_obj);
room_instance_add(argument0,416,224,ceil_2high_obj);
room_instance_add(argument0,448,192,ceil_2high_obj);
room_instance_add(argument0,480,192,ceil_2high_obj);
room_instance_add(argument0,512,192,ceil_2high_obj);
room_instance_add(argument0,544,192,ceil_2high_obj);
room_instance_add(argument0,544,224,ceil_2high_obj);
room_instance_add(argument0,544,256,ceil_2high_obj);
room_instance_add(argument0,544,288,ceil_2high_obj);
room_instance_add(argument0,544,320,ceil_2high_obj);
room_instance_add(argument0,512,320,ceil_2high_obj);
room_instance_add(argument0,480,320,ceil_2high_obj);
room_instance_add(argument0,448,320,ceil_2high_obj);
room_instance_add(argument0,448,288,ceil_2high_obj);
room_instance_add(argument0,448,256,ceil_2high_obj);
room_instance_add(argument0,448,224,ceil_2high_obj);
room_instance_add(argument0,480,224,ceil_2high_obj);
room_instance_add(argument0,512,224,ceil_2high_obj);
room_instance_add(argument0,512,256,ceil_2high_obj);
room_instance_add(argument0,480,256,ceil_2high_obj);
room_instance_add(argument0,480,288,ceil_2high_obj);
room_instance_add(argument0,512,288,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,448,176,wall_2high_hor_obj);
room_instance_add(argument0,480,176,wall_2high_hor_obj);
room_instance_add(argument0,512,176,wall_2high_hor_obj);
room_instance_add(argument0,544,176,wall_2high_hor_obj);
room_instance_add(argument0,544,336,wall_2high_hor_obj);
room_instance_add(argument0,512,336,wall_2high_hor_obj);
room_instance_add(argument0,480,336,wall_2high_hor_obj);
room_instance_add(argument0,448,336,wall_2high_hor_obj);
room_instance_add(argument0,416,304,wall_2high_hor_obj);
room_instance_add(argument0,384,304,wall_2high_hor_obj);
room_instance_add(argument0,352,304,wall_2high_hor_obj);
room_instance_add(argument0,320,304,wall_2high_hor_obj);
room_instance_add(argument0,288,304,wall_2high_hor_obj);
room_instance_add(argument0,256,304,wall_2high_hor_obj);
room_instance_add(argument0,224,304,wall_2high_hor_obj);
room_instance_add(argument0,224,208,wall_2high_hor_obj);
room_instance_add(argument0,256,208,wall_2high_hor_obj);
room_instance_add(argument0,288,208,wall_2high_hor_obj);
room_instance_add(argument0,320,208,wall_2high_hor_obj);
room_instance_add(argument0,352,208,wall_2high_hor_obj);
room_instance_add(argument0,384,208,wall_2high_hor_obj);
room_instance_add(argument0,416,208,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,224,wall_2high_vert_obj);
room_instance_add(argument0,208,256,wall_2high_vert_obj);
room_instance_add(argument0,208,288,wall_2high_vert_obj);
room_instance_add(argument0,432,192,wall_2high_vert_obj);
room_instance_add(argument0,432,320,wall_2high_vert_obj);
room_instance_add(argument0,560,192,wall_2high_vert_obj);
room_instance_add(argument0,560,224,wall_2high_vert_obj);
room_instance_add(argument0,560,256,wall_2high_vert_obj);
room_instance_add(argument0,560,288,wall_2high_vert_obj);
room_instance_add(argument0,560,320,wall_2high_vert_obj);
// Props
room_instance_add(argument0,320,208,chain_hor_rand_obj);
room_instance_add(argument0,320,304,chain_hor_rand_obj);
room_instance_add(argument0,256,304,chain_hor_rand_obj);
room_instance_add(argument0,256,208,chain_hor_rand_obj);