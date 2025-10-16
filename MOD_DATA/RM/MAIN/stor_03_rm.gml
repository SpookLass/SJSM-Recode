/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','stor','ROOM_stor')+' 3';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 304;
    global.spawn_arr[0,1] = 320;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 464;
    global.spawn_arr[1,1] = 320;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
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
room_instance_add(argument0,304,288,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,304,320,floor_obj);
room_instance_add(argument0,336,320,floor_obj);
room_instance_add(argument0,368,320,floor_obj);
room_instance_add(argument0,368,288,floor_obj);
room_instance_add(argument0,304,352,floor_obj);
room_instance_add(argument0,336,352,floor_obj);
room_instance_add(argument0,368,352,floor_obj);
room_instance_add(argument0,400,352,floor_obj);
room_instance_add(argument0,400,320,floor_obj);
room_instance_add(argument0,400,288,floor_obj);
room_instance_add(argument0,432,288,floor_obj);
room_instance_add(argument0,432,320,floor_obj);
room_instance_add(argument0,432,352,floor_obj);
room_instance_add(argument0,464,352,floor_obj);
room_instance_add(argument0,464,320,floor_obj);
room_instance_add(argument0,464,288,floor_obj);
// Ceilings
room_instance_add(argument0,304,288,ceil_2high_obj);
room_instance_add(argument0,336,288,ceil_2high_obj);
room_instance_add(argument0,304,320,ceil_2high_obj);
room_instance_add(argument0,336,320,ceil_2high_obj);
room_instance_add(argument0,368,320,ceil_2high_obj);
room_instance_add(argument0,368,288,ceil_2high_obj);
room_instance_add(argument0,304,352,ceil_2high_obj);
room_instance_add(argument0,336,352,ceil_2high_obj);
room_instance_add(argument0,368,352,ceil_2high_obj);
room_instance_add(argument0,400,352,ceil_2high_obj);
room_instance_add(argument0,400,320,ceil_2high_obj);
room_instance_add(argument0,400,288,ceil_2high_obj);
room_instance_add(argument0,432,288,ceil_2high_obj);
room_instance_add(argument0,432,320,ceil_2high_obj);
room_instance_add(argument0,432,352,ceil_2high_obj);
room_instance_add(argument0,464,352,ceil_2high_obj);
room_instance_add(argument0,464,320,ceil_2high_obj);
room_instance_add(argument0,464,288,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,464,368,wall_2high_hor_obj);
room_instance_add(argument0,432,368,wall_2high_hor_obj);
room_instance_add(argument0,400,368,wall_2high_hor_obj);
room_instance_add(argument0,368,368,wall_2high_hor_obj);
room_instance_add(argument0,336,368,wall_2high_hor_obj);
room_instance_add(argument0,304,368,wall_2high_hor_obj);
room_instance_add(argument0,304,272,wall_2high_hor_obj);
room_instance_add(argument0,336,272,wall_2high_hor_obj);
room_instance_add(argument0,368,272,wall_2high_hor_obj);
room_instance_add(argument0,400,272,wall_2high_hor_obj);
room_instance_add(argument0,432,272,wall_2high_hor_obj);
room_instance_add(argument0,464,272,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,288,288,wall_2high_vert_obj);
room_instance_add(argument0,288,320,wall_2high_vert_obj);
room_instance_add(argument0,288,352,wall_2high_vert_obj);
room_instance_add(argument0,480,352,wall_2high_vert_obj);
room_instance_add(argument0,480,320,wall_2high_vert_obj);
room_instance_add(argument0,480,288,wall_2high_vert_obj);
// Torches
// Props
room_instance_add(argument0,304,352,crate_rand_obj);
room_instance_add(argument0,336,352,crate_rand_obj);
room_instance_add(argument0,304,288,crate_rand_obj);
room_instance_add(argument0,464,352,crate_rand_obj);
room_instance_add(argument0,416,304,pole_wood_obj);
room_instance_add(argument0,352,304,pole_wood_obj);
room_instance_add(argument0,352,336,pole_wood_obj);
room_instance_add(argument0,416,336,pole_wood_obj);
// Not Yet