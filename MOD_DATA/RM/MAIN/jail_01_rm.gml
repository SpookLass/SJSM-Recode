/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','jail','ROOM_jail')+' 1';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 368;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 146;
    global.mark_arr[0,1] = 306;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 225;
    global.mark_arr[1,1] = 312;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 286;
    global.mark_arr[2,1] = 306;
    global.mark_arr[2,2] = 0;
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
")
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
room_instance_add(argument0,144,304,floor_obj);
room_instance_add(argument0,208,304,floor_obj);
room_instance_add(argument0,240,304,floor_obj);
room_instance_add(argument0,272,304,floor_obj);
room_instance_add(argument0,304,304,floor_obj);
room_instance_add(argument0,336,304,floor_obj);
room_instance_add(argument0,176,272,floor_obj);
room_instance_add(argument0,368,304,floor_obj);
room_instance_add(argument0,112,304,floor_obj);
room_instance_add(argument0,176,304,floor_obj);
room_instance_add(argument0,240,272,floor_obj);
room_instance_add(argument0,304,272,floor_obj);
room_instance_add(argument0,176,240,floor_obj);
room_instance_add(argument0,240,240,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
// Ceilings
room_instance_add(argument0,144,304,ceil_obj);
room_instance_add(argument0,208,304,ceil_obj);
room_instance_add(argument0,240,304,ceil_obj);
room_instance_add(argument0,272,304,ceil_obj);
room_instance_add(argument0,304,304,ceil_obj);
room_instance_add(argument0,336,304,ceil_obj);
room_instance_add(argument0,176,272,ceil_obj);
room_instance_add(argument0,368,304,ceil_obj);
room_instance_add(argument0,112,304,ceil_obj);
room_instance_add(argument0,176,304,ceil_obj);
room_instance_add(argument0,240,272,ceil_obj);
room_instance_add(argument0,304,272,ceil_obj);
room_instance_add(argument0,176,240,ceil_obj);
room_instance_add(argument0,240,240,ceil_obj);
room_instance_add(argument0,304,240,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,288,wall_hor_obj);
room_instance_add(argument0,112,288,wall_hor_obj);
room_instance_add(argument0,112,320,wall_hor_obj);
room_instance_add(argument0,144,320,wall_hor_obj);
room_instance_add(argument0,368,288,wall_hor_obj);
room_instance_add(argument0,368,320,wall_hor_obj);
room_instance_add(argument0,336,320,wall_hor_obj);
room_instance_add(argument0,304,320,wall_hor_obj);
room_instance_add(argument0,272,320,wall_hor_obj);
room_instance_add(argument0,240,320,wall_hor_obj);
room_instance_add(argument0,208,320,wall_hor_obj);
room_instance_add(argument0,176,320,wall_hor_obj);
room_instance_add(argument0,336,288,wall_hor_obj);
room_instance_add(argument0,272,288,wall_hor_obj);
room_instance_add(argument0,208,288,wall_hor_obj);
room_instance_add(argument0,176,224,wall_hor_obj);
room_instance_add(argument0,240,224,wall_hor_obj);
room_instance_add(argument0,304,224,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,304,wall_vert_obj);
room_instance_add(argument0,160,272,wall_vert_obj);
room_instance_add(argument0,192,272,wall_vert_obj);
room_instance_add(argument0,224,272,wall_vert_obj);
room_instance_add(argument0,256,272,wall_vert_obj);
room_instance_add(argument0,288,272,wall_vert_obj);
room_instance_add(argument0,320,272,wall_vert_obj);
room_instance_add(argument0,384,304,wall_vert_obj);
room_instance_add(argument0,160,240,wall_vert_obj);
room_instance_add(argument0,192,240,wall_vert_obj);
room_instance_add(argument0,224,240,wall_vert_obj);
room_instance_add(argument0,256,240,wall_vert_obj);
room_instance_add(argument0,288,240,wall_vert_obj);
room_instance_add(argument0,320,240,wall_vert_obj);
// Props
room_instance_add(argument0,176,288,bar_hor_obj);
room_instance_add(argument0,240,288,bar_hor_obj);
room_instance_add(argument0,304,288,bar_hor_obj);
room_instance_add(argument0,309,254,chair_rand_obj);
room_instance_add(argument0,181,265,chair_rand_obj);
room_instance_add(argument0,232,272,table_rand_obj);
room_instance_add(argument0,180,248,bone_rand_obj);
room_instance_add(argument0,304,273,bone_rand_obj);
room_instance_add(argument0,167,234,web_rand_obj);
room_instance_add(argument0,250,296,web_rand_obj);
room_instance_add(argument0,312,234,web_rand_obj);
// Jumpscare
room_instance_add(argument0,336,320,js_obj);