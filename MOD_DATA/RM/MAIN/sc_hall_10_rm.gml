/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'SC Hall 10'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 432;
    global.spawn_arr[1,1] = 416;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 200;
    global.mark_arr[0,1] = 288;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 224;
    global.mark_arr[1,1] = 416;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 336;
    global.mark_arr[2,1] = 416;
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
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,112,288,floor_obj);
room_instance_add(argument0,144,288,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,208,288,floor_obj);
room_instance_add(argument0,208,320,floor_obj);
room_instance_add(argument0,208,352,floor_obj);
room_instance_add(argument0,208,384,floor_obj);
room_instance_add(argument0,208,416,floor_obj);
room_instance_add(argument0,176,416,floor_obj);
room_instance_add(argument0,240,416,floor_obj);
room_instance_add(argument0,144,416,floor_obj);
room_instance_add(argument0,272,416,floor_obj);
room_instance_add(argument0,304,416,floor_obj);
room_instance_add(argument0,336,416,floor_obj);
room_instance_add(argument0,368,416,floor_obj);
room_instance_add(argument0,336,384,floor_obj);
room_instance_add(argument0,336,352,floor_obj);
room_instance_add(argument0,336,320,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,400,416,floor_obj);
room_instance_add(argument0,432,416,floor_obj);
// Ceilings
room_instance_add(argument0,112,288,ceil_low_obj);
room_instance_add(argument0,144,288,ceil_low_obj);
room_instance_add(argument0,176,288,ceil_low_obj);
room_instance_add(argument0,208,288,ceil_low_obj);
room_instance_add(argument0,208,320,ceil_low_obj);
room_instance_add(argument0,208,352,ceil_low_obj);
room_instance_add(argument0,208,384,ceil_low_obj);
room_instance_add(argument0,208,416,ceil_low_obj);
room_instance_add(argument0,176,416,ceil_low_obj);
room_instance_add(argument0,240,416,ceil_low_obj);
room_instance_add(argument0,144,416,ceil_low_obj);
room_instance_add(argument0,272,416,ceil_low_obj);
room_instance_add(argument0,304,416,ceil_low_obj);
room_instance_add(argument0,336,416,ceil_low_obj);
room_instance_add(argument0,368,416,ceil_low_obj);
room_instance_add(argument0,336,384,ceil_low_obj);
room_instance_add(argument0,336,352,ceil_low_obj);
room_instance_add(argument0,336,320,ceil_low_obj);
room_instance_add(argument0,336,288,ceil_low_obj);
room_instance_add(argument0,400,416,ceil_low_obj);
room_instance_add(argument0,432,416,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,272,wall_hor_obj);
room_instance_add(argument0,112,304,wall_hor_obj);
room_instance_add(argument0,144,272,wall_hor_obj);
room_instance_add(argument0,240,400,wall_hor_obj);
room_instance_add(argument0,336,272,wall_hor_obj);
room_instance_add(argument0,176,400,wall_hor_obj);
room_instance_add(argument0,144,400,wall_hor_obj);
room_instance_add(argument0,176,304,wall_hor_obj);
room_instance_add(argument0,144,304,wall_hor_obj);
room_instance_add(argument0,176,272,wall_hor_obj);
room_instance_add(argument0,208,272,wall_hor_obj);
room_instance_add(argument0,272,400,wall_hor_obj);
room_instance_add(argument0,304,400,wall_hor_obj);
room_instance_add(argument0,368,400,wall_hor_obj);
room_instance_add(argument0,400,400,wall_hor_obj);
room_instance_add(argument0,432,400,wall_hor_obj);
room_instance_add(argument0,432,432,wall_hor_obj);
room_instance_add(argument0,400,432,wall_hor_obj);
room_instance_add(argument0,368,432,wall_hor_obj);
room_instance_add(argument0,336,432,wall_hor_obj);
room_instance_add(argument0,304,432,wall_hor_obj);
room_instance_add(argument0,272,432,wall_hor_obj);
room_instance_add(argument0,240,432,wall_hor_obj);
room_instance_add(argument0,208,432,wall_hor_obj);
room_instance_add(argument0,176,432,wall_hor_obj);
room_instance_add(argument0,144,432,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,288,wall_vert_obj);
room_instance_add(argument0,192,320,wall_vert_obj);
room_instance_add(argument0,224,288,wall_vert_obj);
room_instance_add(argument0,224,320,wall_vert_obj);
room_instance_add(argument0,224,352,wall_vert_obj);
room_instance_add(argument0,224,384,wall_vert_obj);
room_instance_add(argument0,192,384,wall_vert_obj);
room_instance_add(argument0,192,352,wall_vert_obj);
room_instance_add(argument0,128,416,wall_vert_obj);
room_instance_add(argument0,320,384,wall_vert_obj);
room_instance_add(argument0,320,352,wall_vert_obj);
room_instance_add(argument0,320,320,wall_vert_obj);
room_instance_add(argument0,320,288,wall_vert_obj);
room_instance_add(argument0,352,288,wall_vert_obj);
room_instance_add(argument0,352,320,wall_vert_obj);
room_instance_add(argument0,352,352,wall_vert_obj);
room_instance_add(argument0,352,384,wall_vert_obj);
room_instance_add(argument0,448,416,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,336,368,bar_hor_obj);
// Not Yet