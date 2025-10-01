/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Engine Room 10 Old'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 144;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 464;
    global.spawn_arr[1,1] = 256;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 175;
    global.mark_arr[0,1] = 213;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 268;
    global.mark_arr[1,1] = 193;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 365;
    global.mark_arr[2,1] = 311;
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
// Floors
room_instance_add(argument0,144,256,floor_obj);
room_instance_add(argument0,464,256,floor_obj);
room_instance_add(argument0,176,256,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,176,320,floor_obj);
room_instance_add(argument0,176,224,floor_obj);
room_instance_add(argument0,176,192,floor_obj);
room_instance_add(argument0,208,192,floor_obj);
room_instance_add(argument0,208,320,floor_obj);
room_instance_add(argument0,240,320,floor_obj);
room_instance_add(argument0,240,192,floor_obj);
room_instance_add(argument0,272,192,floor_obj);
room_instance_add(argument0,272,320,floor_obj);
room_instance_add(argument0,304,192,floor_obj);
room_instance_add(argument0,272,224,floor_obj);
room_instance_add(argument0,272,256,floor_obj);
room_instance_add(argument0,240,256,floor_obj);
room_instance_add(argument0,304,256,floor_obj);
room_instance_add(argument0,272,288,floor_obj);
room_instance_add(argument0,304,320,floor_obj);
room_instance_add(argument0,336,320,floor_obj);
room_instance_add(argument0,336,192,floor_obj);
room_instance_add(argument0,368,192,floor_obj);
room_instance_add(argument0,368,224,floor_obj);
room_instance_add(argument0,368,256,floor_obj);
room_instance_add(argument0,368,320,floor_obj);
room_instance_add(argument0,368,288,floor_obj);
room_instance_add(argument0,400,256,floor_obj);
room_instance_add(argument0,432,256,floor_obj);
// Ceilings
room_instance_add(argument0,144,256,ceil_obj);
room_instance_add(argument0,464,256,ceil_obj);
room_instance_add(argument0,176,256,ceil_obj);
room_instance_add(argument0,176,288,ceil_obj);
room_instance_add(argument0,176,320,ceil_obj);
room_instance_add(argument0,176,224,ceil_obj);
room_instance_add(argument0,176,192,ceil_obj);
room_instance_add(argument0,208,192,ceil_obj);
room_instance_add(argument0,208,320,ceil_obj);
room_instance_add(argument0,240,320,ceil_obj);
room_instance_add(argument0,240,192,ceil_obj);
room_instance_add(argument0,272,192,ceil_obj);
room_instance_add(argument0,272,320,ceil_obj);
room_instance_add(argument0,304,192,ceil_obj);
room_instance_add(argument0,272,224,ceil_obj);
room_instance_add(argument0,272,256,ceil_obj);
room_instance_add(argument0,240,256,ceil_obj);
room_instance_add(argument0,304,256,ceil_obj);
room_instance_add(argument0,272,288,ceil_obj);
room_instance_add(argument0,304,320,ceil_obj);
room_instance_add(argument0,336,320,ceil_obj);
room_instance_add(argument0,336,192,ceil_obj);
room_instance_add(argument0,368,192,ceil_obj);
room_instance_add(argument0,368,224,ceil_obj);
room_instance_add(argument0,368,256,ceil_obj);
room_instance_add(argument0,368,320,ceil_obj);
room_instance_add(argument0,368,288,ceil_obj);
room_instance_add(argument0,400,256,ceil_obj);
room_instance_add(argument0,432,256,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,240,wall_hor_obj);
room_instance_add(argument0,144,272,wall_hor_obj);
room_instance_add(argument0,464,272,wall_hor_obj);
room_instance_add(argument0,464,240,wall_hor_obj);
room_instance_add(argument0,176,176,wall_hor_obj);
room_instance_add(argument0,240,240,wall_hor_obj);
room_instance_add(argument0,240,272,wall_hor_obj);
room_instance_add(argument0,240,304,wall_hor_obj);
room_instance_add(argument0,208,304,wall_hor_obj);
room_instance_add(argument0,208,208,wall_hor_obj);
room_instance_add(argument0,240,208,wall_hor_obj);
room_instance_add(argument0,240,176,wall_hor_obj);
room_instance_add(argument0,208,176,wall_hor_obj);
room_instance_add(argument0,272,176,wall_hor_obj);
room_instance_add(argument0,304,240,wall_hor_obj);
room_instance_add(argument0,304,272,wall_hor_obj);
room_instance_add(argument0,304,176,wall_hor_obj);
room_instance_add(argument0,304,208,wall_hor_obj);
room_instance_add(argument0,336,208,wall_hor_obj);
room_instance_add(argument0,336,176,wall_hor_obj);
room_instance_add(argument0,368,176,wall_hor_obj);
room_instance_add(argument0,368,336,wall_hor_obj);
room_instance_add(argument0,336,336,wall_hor_obj);
room_instance_add(argument0,400,272,wall_hor_obj);
room_instance_add(argument0,400,240,wall_hor_obj);
room_instance_add(argument0,432,240,wall_hor_obj);
room_instance_add(argument0,432,272,wall_hor_obj);
room_instance_add(argument0,304,304,wall_hor_obj);
room_instance_add(argument0,336,304,wall_hor_obj);
room_instance_add(argument0,304,336,wall_hor_obj);
room_instance_add(argument0,272,336,wall_hor_obj);
room_instance_add(argument0,240,336,wall_hor_obj);
room_instance_add(argument0,208,336,wall_hor_obj);
room_instance_add(argument0,176,336,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,128,256,wall_vert_obj);
room_instance_add(argument0,480,256,wall_vert_obj);
room_instance_add(argument0,192,224,wall_vert_obj);
room_instance_add(argument0,224,256,wall_vert_obj);
room_instance_add(argument0,192,256,wall_vert_obj);
room_instance_add(argument0,192,288,wall_vert_obj);
room_instance_add(argument0,256,288,wall_vert_obj);
room_instance_add(argument0,256,224,wall_vert_obj);
room_instance_add(argument0,288,224,wall_vert_obj);
room_instance_add(argument0,320,256,wall_vert_obj);
room_instance_add(argument0,288,288,wall_vert_obj);
room_instance_add(argument0,352,288,wall_vert_obj);
room_instance_add(argument0,352,256,wall_vert_obj);
room_instance_add(argument0,352,224,wall_vert_obj);
room_instance_add(argument0,384,224,wall_vert_obj);
room_instance_add(argument0,384,192,wall_vert_obj);
room_instance_add(argument0,384,288,wall_vert_obj);
room_instance_add(argument0,384,320,wall_vert_obj);
room_instance_add(argument0,160,320,wall_vert_obj);
room_instance_add(argument0,160,288,wall_vert_obj);
room_instance_add(argument0,160,224,wall_vert_obj);
room_instance_add(argument0,160,192,wall_vert_obj);
// Engineering
room_instance_add(argument0,224,320,bar_vert_obj);
room_instance_add(argument0,256,256,bar_vert_obj);
room_instance_add(argument0,288,256,bar_vert_obj);
room_instance_add(argument0,288,192,bar_vert_obj);
room_instance_add(argument0,352,192,bar_vert_obj);
room_instance_add(argument0,256,320,bar_vert_obj);
room_instance_add(argument0,240,320,engine_rand_obj);
room_instance_add(argument0,240,256,engine_rand_obj);
room_instance_add(argument0,304,256,engine_rand_obj);
room_instance_add(argument0,304,192,engine_rand_obj);
room_instance_add(argument0,336,192,engine_rand_obj);
room_instance_add(argument0,240,320,runner_obj);
room_instance_add(argument0,240,256,runner_obj);
room_instance_add(argument0,304,256,runner_obj);
room_instance_add(argument0,304,192,runner_obj);
room_instance_add(argument0,336,192,runner_obj);
room_instance_add(argument0,240,320,pole_metal_obj);
room_instance_add(argument0,240,256,pole_metal_obj);
room_instance_add(argument0,304,256,pole_metal_obj);
room_instance_add(argument0,304,192,pole_metal_obj);
room_instance_add(argument0,336,192,pole_metal_obj);
// Not yet
/*room_instance_add(argument0,320,336,random_scare_mark1);*/