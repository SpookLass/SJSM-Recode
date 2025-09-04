/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Jail Room 7 A'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 336;
    global.spawn_arr[1,1] = 240;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 242;
    global.mark_arr[0,1] = 302;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 272;
    global.mark_arr[1,1] = 267;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 275;
    global.mark_arr[2,1] = 206;
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
room_instance_add(argument0,0,0,color_control_02_obj);
// Floors
room_instance_add(argument0,144,304,floor_obj);
room_instance_add(argument0,112,304,floor_obj);
room_instance_add(argument0,176,304,floor_obj);
room_instance_add(argument0,208,304,floor_obj);
room_instance_add(argument0,240,304,floor_obj);
room_instance_add(argument0,272,304,floor_obj);
room_instance_add(argument0,272,272,floor_obj);
room_instance_add(argument0,272,240,floor_obj);
room_instance_add(argument0,272,208,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
room_instance_add(argument0,336,176,floor_obj);
room_instance_add(argument0,240,176,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,240,240,floor_obj);
room_instance_add(argument0,208,240,floor_obj);
room_instance_add(argument0,304,304,floor_obj);
room_instance_add(argument0,336,304,floor_obj);
// Ceilings
room_instance_add(argument0,144,304,ceil_obj);
room_instance_add(argument0,112,304,ceil_obj);
room_instance_add(argument0,176,304,ceil_obj);
room_instance_add(argument0,208,304,ceil_obj);
room_instance_add(argument0,240,304,ceil_obj);
room_instance_add(argument0,272,304,ceil_obj);
room_instance_add(argument0,272,272,ceil_obj);
room_instance_add(argument0,272,240,ceil_obj);
room_instance_add(argument0,272,208,ceil_obj);
room_instance_add(argument0,304,240,ceil_obj);
room_instance_add(argument0,272,176,ceil_obj);
room_instance_add(argument0,304,176,ceil_obj);
room_instance_add(argument0,336,240,ceil_obj);
room_instance_add(argument0,336,176,ceil_obj);
room_instance_add(argument0,240,176,ceil_obj);
room_instance_add(argument0,208,176,ceil_obj);
room_instance_add(argument0,240,240,ceil_obj);
room_instance_add(argument0,208,240,ceil_obj);
room_instance_add(argument0,304,304,ceil_obj);
room_instance_add(argument0,336,304,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,288,wall_hor_obj);
room_instance_add(argument0,112,288,wall_hor_obj);
room_instance_add(argument0,112,320,wall_hor_obj);
room_instance_add(argument0,144,320,wall_hor_obj);
room_instance_add(argument0,176,288,wall_hor_obj);
room_instance_add(argument0,176,320,wall_hor_obj);
room_instance_add(argument0,208,320,wall_hor_obj);
room_instance_add(argument0,240,320,wall_hor_obj);
room_instance_add(argument0,240,288,wall_hor_obj);
room_instance_add(argument0,208,288,wall_hor_obj);
room_instance_add(argument0,240,256,wall_hor_obj);
room_instance_add(argument0,240,224,wall_hor_obj);
room_instance_add(argument0,208,224,wall_hor_obj);
room_instance_add(argument0,208,256,wall_hor_obj);
room_instance_add(argument0,272,320,wall_hor_obj);
room_instance_add(argument0,304,288,wall_hor_obj);
room_instance_add(argument0,336,288,wall_hor_obj);
room_instance_add(argument0,336,320,wall_hor_obj);
room_instance_add(argument0,304,320,wall_hor_obj);
room_instance_add(argument0,304,256,wall_hor_obj);
room_instance_add(argument0,336,256,wall_hor_obj);
room_instance_add(argument0,336,224,wall_hor_obj);
room_instance_add(argument0,304,224,wall_hor_obj);
room_instance_add(argument0,304,192,wall_hor_obj);
room_instance_add(argument0,336,192,wall_hor_obj);
room_instance_add(argument0,336,160,wall_hor_obj);
room_instance_add(argument0,304,160,wall_hor_obj);
room_instance_add(argument0,272,160,wall_hor_obj);
room_instance_add(argument0,240,160,wall_hor_obj);
room_instance_add(argument0,208,160,wall_hor_obj);
room_instance_add(argument0,240,192,wall_hor_obj);
room_instance_add(argument0,208,192,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,304,wall_vert_obj);
room_instance_add(argument0,192,240,wall_vert_obj);
room_instance_add(argument0,256,272,wall_vert_obj);
room_instance_add(argument0,288,272,wall_vert_obj);
room_instance_add(argument0,352,304,wall_vert_obj);
room_instance_add(argument0,352,240,wall_vert_obj);
room_instance_add(argument0,352,176,wall_vert_obj);
room_instance_add(argument0,192,176,wall_vert_obj);
room_instance_add(argument0,256,208,wall_vert_obj);
room_instance_add(argument0,288,208,wall_vert_obj);
// Torches
room_instance_add(argument0,208,288,torch_north_obj);
room_instance_add(argument0,144,288,torch_north_obj);
room_instance_add(argument0,144,320,torch_south_obj);
room_instance_add(argument0,208,320,torch_south_obj);
// Props
room_instance_add(argument0,288,304,bar_vert_obj);
room_instance_add(argument0,288,176,bar_vert_obj);
room_instance_add(argument0,256,176,bar_vert_obj);
room_instance_add(argument0,256,240,bar_vert_obj);
room_instance_add(argument0,208,240,chair_rand_obj);
room_instance_add(argument0,208,176,chair_rand_obj);
room_instance_add(argument0,312,304,bone_rand_obj);
room_instance_add(argument0,312,176,bone_rand_obj);
room_instance_add(argument0,232,176,bone_rand_obj);
room_instance_add(argument0,180,294,web_rand_obj);
room_instance_add(argument0,265,232,web_rand_obj);
room_instance_add(argument0,275,169,web_rand_obj);
// Doors
room_instance_add(argument0,352,176,door_east_obj);
room_instance_add(argument0,344,176,door_trig_obj);
room_instance_add(argument0,352,304,door_east_obj);
room_instance_add(argument0,344,304,door_trig_obj);