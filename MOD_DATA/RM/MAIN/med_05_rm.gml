/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Med Room 5'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 128;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 384;
    global.spawn_arr[1,1] = 288;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 155;
    global.mark_arr[0,1] = 258;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 228;
    global.mark_arr[1,1] = 317;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 267;
    global.mark_arr[2,1] = 260;
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
room_instance_add(argument0,0,0,water_obj);
// Floors
room_instance_add(argument0,128,288,floor_obj);
room_instance_add(argument0,160,288,floor_obj);
room_instance_add(argument0,160,256,floor_obj);
room_instance_add(argument0,160,320,floor_obj);
room_instance_add(argument0,192,256,floor_obj);
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,224,288,floor_obj);
room_instance_add(argument0,224,320,floor_obj);
room_instance_add(argument0,192,320,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,256,320,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,352,288,floor_obj);
room_instance_add(argument0,320,320,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,352,320,floor_obj);
room_instance_add(argument0,384,288,floor_obj);
// Ceilings
room_instance_add(argument0,128,288,ceil_obj);
room_instance_add(argument0,160,288,ceil_obj);
room_instance_add(argument0,160,256,ceil_obj);
room_instance_add(argument0,160,320,ceil_obj);
room_instance_add(argument0,192,256,ceil_obj);
room_instance_add(argument0,224,256,ceil_obj);
room_instance_add(argument0,224,288,ceil_obj);
room_instance_add(argument0,224,320,ceil_obj);
room_instance_add(argument0,192,320,ceil_obj);
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,288,320,ceil_obj);
room_instance_add(argument0,256,320,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,352,288,ceil_obj);
room_instance_add(argument0,320,320,ceil_obj);
room_instance_add(argument0,352,256,ceil_obj);
room_instance_add(argument0,352,320,ceil_obj);
room_instance_add(argument0,384,288,ceil_obj);
room_instance_add(argument0,192,288,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,320,288,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,160,240,wall_hor_obj);
room_instance_add(argument0,128,272,wall_hor_obj);
room_instance_add(argument0,128,304,wall_hor_obj);
room_instance_add(argument0,160,336,wall_hor_obj);
room_instance_add(argument0,384,272,wall_hor_obj);
room_instance_add(argument0,384,304,wall_hor_obj);
room_instance_add(argument0,352,336,wall_hor_obj);
room_instance_add(argument0,320,336,wall_hor_obj);
room_instance_add(argument0,288,336,wall_hor_obj);
room_instance_add(argument0,256,336,wall_hor_obj);
room_instance_add(argument0,224,336,wall_hor_obj);
room_instance_add(argument0,192,336,wall_hor_obj);
room_instance_add(argument0,192,240,wall_hor_obj);
room_instance_add(argument0,224,240,wall_hor_obj);
room_instance_add(argument0,256,240,wall_hor_obj);
room_instance_add(argument0,288,240,wall_hor_obj);
room_instance_add(argument0,320,240,wall_hor_obj);
room_instance_add(argument0,352,240,wall_hor_obj);
room_instance_add(argument0,192,272,wall_pit_hor_obj);
room_instance_add(argument0,192,304,wall_pit_hor_obj);
room_instance_add(argument0,256,272,wall_pit_hor_obj);
room_instance_add(argument0,256,304,wall_pit_hor_obj);
room_instance_add(argument0,320,272,wall_pit_hor_obj);
room_instance_add(argument0,320,304,wall_pit_hor_obj);
room_instance_add(argument0,192,272,wall_float_hor_obj);
room_instance_add(argument0,192,304,wall_float_hor_obj);
room_instance_add(argument0,256,272,wall_float_hor_obj);
room_instance_add(argument0,256,304,wall_float_hor_obj);
room_instance_add(argument0,320,272,wall_float_hor_obj);
room_instance_add(argument0,320,304,wall_float_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,112,288,wall_vert_obj);
room_instance_add(argument0,144,256,wall_vert_obj);
room_instance_add(argument0,144,320,wall_vert_obj);
room_instance_add(argument0,368,256,wall_vert_obj);
room_instance_add(argument0,368,320,wall_vert_obj);
room_instance_add(argument0,400,288,wall_vert_obj);
room_instance_add(argument0,176,288,wall_pit_vert_obj);
room_instance_add(argument0,208,288,wall_pit_vert_obj);
room_instance_add(argument0,240,288,wall_pit_vert_obj);
room_instance_add(argument0,272,288,wall_pit_vert_obj);
room_instance_add(argument0,304,288,wall_pit_vert_obj);
room_instance_add(argument0,336,288,wall_pit_vert_obj);
room_instance_add(argument0,176,288,wall_float_vert_obj);
room_instance_add(argument0,208,288,wall_float_vert_obj);
room_instance_add(argument0,240,288,wall_float_vert_obj);
room_instance_add(argument0,272,288,wall_float_vert_obj);
room_instance_add(argument0,304,288,wall_float_vert_obj);
room_instance_add(argument0,336,288,wall_float_vert_obj);
// Not yet
//room_instance_add(argument0,384,304,random_scare_mark1);