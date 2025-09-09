/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Med Room 1'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 96;
    global.spawn_arr[0,1] = 432;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 288;
    global.spawn_arr[1,1] = 176;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 162;
    global.mark_arr[0,1] = 361;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 223;
    global.mark_arr[1,1] = 301;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 243;
    global.mark_arr[2,1] = 177;
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
room_instance_add(argument0,0,0,med_color_obj);
room_instance_add(argument0,0,0,water_obj);
// Floors
room_instance_add(argument0,160,368,floor_obj);
room_instance_add(argument0,160,400,floor_obj);
room_instance_add(argument0,160,432,floor_obj);
room_instance_add(argument0,224,400,floor_obj);
room_instance_add(argument0,224,368,floor_obj);
room_instance_add(argument0,224,432,floor_obj);
room_instance_add(argument0,160,464,floor_obj);
room_instance_add(argument0,224,464,floor_obj);
room_instance_add(argument0,160,496,floor_obj);
room_instance_add(argument0,192,496,floor_obj);
room_instance_add(argument0,224,496,floor_obj);
room_instance_add(argument0,224,336,floor_obj);
room_instance_add(argument0,160,336,floor_obj);
room_instance_add(argument0,160,304,floor_obj);
room_instance_add(argument0,160,272,floor_obj);
room_instance_add(argument0,224,272,floor_obj);
room_instance_add(argument0,224,304,floor_obj);
room_instance_add(argument0,224,240,floor_obj);
room_instance_add(argument0,160,240,floor_obj);
room_instance_add(argument0,160,208,floor_obj);
room_instance_add(argument0,192,368,floor_obj);
room_instance_add(argument0,192,240,floor_obj);
room_instance_add(argument0,224,208,floor_obj);
room_instance_add(argument0,224,176,floor_obj);
room_instance_add(argument0,224,144,floor_obj);
room_instance_add(argument0,160,176,floor_obj);
room_instance_add(argument0,160,144,floor_obj);
room_instance_add(argument0,160,112,floor_obj);
room_instance_add(argument0,192,112,floor_obj);
room_instance_add(argument0,224,112,floor_obj);
room_instance_add(argument0,128,432,floor_obj);
room_instance_add(argument0,96,432,floor_obj);
room_instance_add(argument0,256,176,floor_obj);
room_instance_add(argument0,288,176,floor_obj);
// Ceilings
room_instance_add(argument0,160,368,ceil_obj);
room_instance_add(argument0,160,400,ceil_obj);
room_instance_add(argument0,160,432,ceil_obj);
room_instance_add(argument0,224,400,ceil_obj);
room_instance_add(argument0,224,368,ceil_obj);
room_instance_add(argument0,224,432,ceil_obj);
room_instance_add(argument0,160,464,ceil_obj);
room_instance_add(argument0,224,464,ceil_obj);
room_instance_add(argument0,160,496,ceil_obj);
room_instance_add(argument0,192,496,ceil_obj);
room_instance_add(argument0,224,496,ceil_obj);
room_instance_add(argument0,224,336,ceil_obj);
room_instance_add(argument0,160,336,ceil_obj);
room_instance_add(argument0,160,304,ceil_obj);
room_instance_add(argument0,160,272,ceil_obj);
room_instance_add(argument0,224,272,ceil_obj);
room_instance_add(argument0,224,304,ceil_obj);
room_instance_add(argument0,224,240,ceil_obj);
room_instance_add(argument0,160,240,ceil_obj);
room_instance_add(argument0,160,208,ceil_obj);
room_instance_add(argument0,192,368,ceil_obj);
room_instance_add(argument0,192,240,ceil_obj);
room_instance_add(argument0,224,208,ceil_obj);
room_instance_add(argument0,224,176,ceil_obj);
room_instance_add(argument0,224,144,ceil_obj);
room_instance_add(argument0,160,176,ceil_obj);
room_instance_add(argument0,160,144,ceil_obj);
room_instance_add(argument0,160,112,ceil_obj);
room_instance_add(argument0,192,112,ceil_obj);
room_instance_add(argument0,224,112,ceil_obj);
room_instance_add(argument0,128,432,ceil_obj);
room_instance_add(argument0,96,432,ceil_obj);
room_instance_add(argument0,256,176,ceil_obj);
room_instance_add(argument0,288,176,ceil_obj);
room_instance_add(argument0,192,400,ceil_obj);
room_instance_add(argument0,192,432,ceil_obj);
room_instance_add(argument0,192,464,ceil_obj);
room_instance_add(argument0,192,272,ceil_obj);
room_instance_add(argument0,192,304,ceil_obj);
room_instance_add(argument0,192,336,ceil_obj);
room_instance_add(argument0,192,144,ceil_obj);
room_instance_add(argument0,192,176,ceil_obj);
room_instance_add(argument0,192,208,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,160,96,wall_hor_obj);
room_instance_add(argument0,192,96,wall_hor_obj);
room_instance_add(argument0,224,96,wall_hor_obj);
room_instance_add(argument0,256,160,wall_hor_obj);
room_instance_add(argument0,288,160,wall_hor_obj);
room_instance_add(argument0,288,192,wall_hor_obj);
room_instance_add(argument0,256,192,wall_hor_obj);
room_instance_add(argument0,224,512,wall_hor_obj);
room_instance_add(argument0,192,512,wall_hor_obj);
room_instance_add(argument0,160,512,wall_hor_obj);
room_instance_add(argument0,128,416,wall_hor_obj);
room_instance_add(argument0,96,416,wall_hor_obj);
room_instance_add(argument0,96,448,wall_hor_obj);
room_instance_add(argument0,128,448,wall_hor_obj);
room_instance_add(argument0,192,128,wall_pit_hor_obj);
room_instance_add(argument0,192,224,wall_pit_hor_obj);
room_instance_add(argument0,192,256,wall_pit_hor_obj);
room_instance_add(argument0,192,352,wall_pit_hor_obj);
room_instance_add(argument0,192,384,wall_pit_hor_obj);
room_instance_add(argument0,192,480,wall_pit_hor_obj);
room_instance_add(argument0,192,128,wall_float_hor_obj);
room_instance_add(argument0,192,224,wall_float_hor_obj);
room_instance_add(argument0,192,256,wall_float_hor_obj);
room_instance_add(argument0,192,352,wall_float_hor_obj);
room_instance_add(argument0,192,384,wall_float_hor_obj);
room_instance_add(argument0,192,480,wall_float_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,80,432,wall_vert_obj);
room_instance_add(argument0,304,176,wall_vert_obj);
room_instance_add(argument0,240,144,wall_vert_obj);
room_instance_add(argument0,240,112,wall_vert_obj);
room_instance_add(argument0,144,112,wall_vert_obj);
room_instance_add(argument0,144,144,wall_vert_obj);
room_instance_add(argument0,240,208,wall_vert_obj);
room_instance_add(argument0,240,240,wall_vert_obj);
room_instance_add(argument0,240,272,wall_vert_obj);
room_instance_add(argument0,240,304,wall_vert_obj);
room_instance_add(argument0,240,336,wall_vert_obj);
room_instance_add(argument0,240,368,wall_vert_obj);
room_instance_add(argument0,240,400,wall_vert_obj);
room_instance_add(argument0,240,432,wall_vert_obj);
room_instance_add(argument0,240,464,wall_vert_obj);
room_instance_add(argument0,240,496,wall_vert_obj);
room_instance_add(argument0,144,496,wall_vert_obj);
room_instance_add(argument0,144,464,wall_vert_obj);
room_instance_add(argument0,144,400,wall_vert_obj);
room_instance_add(argument0,144,368,wall_vert_obj);
room_instance_add(argument0,144,336,wall_vert_obj);
room_instance_add(argument0,144,304,wall_vert_obj);
room_instance_add(argument0,144,272,wall_vert_obj);
room_instance_add(argument0,144,240,wall_vert_obj);
room_instance_add(argument0,144,208,wall_vert_obj);
room_instance_add(argument0,144,176,wall_vert_obj);
room_instance_add(argument0,176,400,wall_pit_vert_obj);
room_instance_add(argument0,208,400,wall_pit_vert_obj);
room_instance_add(argument0,208,432,wall_pit_vert_obj);
room_instance_add(argument0,176,432,wall_pit_vert_obj);
room_instance_add(argument0,176,464,wall_pit_vert_obj);
room_instance_add(argument0,208,464,wall_pit_vert_obj);
room_instance_add(argument0,208,208,wall_pit_vert_obj);
room_instance_add(argument0,208,176,wall_pit_vert_obj);
room_instance_add(argument0,208,144,wall_pit_vert_obj);
room_instance_add(argument0,176,144,wall_pit_vert_obj);
room_instance_add(argument0,176,176,wall_pit_vert_obj);
room_instance_add(argument0,176,208,wall_pit_vert_obj);
room_instance_add(argument0,176,272,wall_pit_vert_obj);
room_instance_add(argument0,176,304,wall_pit_vert_obj);
room_instance_add(argument0,176,336,wall_pit_vert_obj);
room_instance_add(argument0,208,336,wall_pit_vert_obj);
room_instance_add(argument0,208,304,wall_pit_vert_obj);
room_instance_add(argument0,208,272,wall_pit_vert_obj);
room_instance_add(argument0,176,400,wall_float_vert_obj);
room_instance_add(argument0,208,400,wall_float_vert_obj);
room_instance_add(argument0,208,432,wall_float_vert_obj);
room_instance_add(argument0,176,432,wall_float_vert_obj);
room_instance_add(argument0,176,464,wall_float_vert_obj);
room_instance_add(argument0,208,464,wall_float_vert_obj);
room_instance_add(argument0,208,208,wall_float_vert_obj);
room_instance_add(argument0,208,176,wall_float_vert_obj);
room_instance_add(argument0,208,144,wall_float_vert_obj);
room_instance_add(argument0,176,144,wall_float_vert_obj);
room_instance_add(argument0,176,176,wall_float_vert_obj);
room_instance_add(argument0,176,208,wall_float_vert_obj);
room_instance_add(argument0,176,272,wall_float_vert_obj);
room_instance_add(argument0,176,304,wall_float_vert_obj);
room_instance_add(argument0,176,336,wall_float_vert_obj);
room_instance_add(argument0,208,336,wall_float_vert_obj);
room_instance_add(argument0,208,304,wall_float_vert_obj);
room_instance_add(argument0,208,272,wall_float_vert_obj);
// Torches
room_instance_add(argument0,144,400,torch_west_obj);
room_instance_add(argument0,144,464,torch_west_obj);
room_instance_add(argument0,240,144,torch_east_obj);
room_instance_add(argument0,240,208,torch_east_obj);
// Not yet