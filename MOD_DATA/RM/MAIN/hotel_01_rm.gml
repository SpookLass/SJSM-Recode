/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Hotel Room 1'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 256;
    global.spawn_arr[1,1] = 192;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 0;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 285;
    global.mark_arr[0,1] = 260;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 336;
    global.mark_arr[1,1] = 264;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 328;
    global.mark_arr[2,1] = 167;
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
room_instance_add(argument0,256,272,floor_obj);
room_instance_add(argument0,288,272,floor_obj);
room_instance_add(argument0,256,240,floor_obj);
room_instance_add(argument0,288,240,floor_obj);
room_instance_add(argument0,320,240,floor_obj);
room_instance_add(argument0,320,272,floor_obj);
room_instance_add(argument0,352,272,floor_obj);
room_instance_add(argument0,352,240,floor_obj);
room_instance_add(argument0,384,240,floor_obj);
room_instance_add(argument0,384,272,floor_obj);
room_instance_add(argument0,384,304,floor_obj);
room_instance_add(argument0,320,304,floor_obj);
room_instance_add(argument0,352,304,floor_obj);
room_instance_add(argument0,256,208,floor_obj);
room_instance_add(argument0,288,208,floor_obj);
room_instance_add(argument0,256,176,floor_obj);
room_instance_add(argument0,288,176,floor_obj);
room_instance_add(argument0,320,208,floor_obj);
room_instance_add(argument0,320,176,floor_obj);
room_instance_add(argument0,320,144,floor_obj);
room_instance_add(argument0,352,144,floor_obj);
room_instance_add(argument0,384,144,floor_obj);
room_instance_add(argument0,384,176,floor_obj);
room_instance_add(argument0,352,176,floor_obj);
room_instance_add(argument0,352,208,floor_obj);
room_instance_add(argument0,384,208,floor_obj);
// Ceilings
room_instance_add(argument0,256,272,ceil_obj);
room_instance_add(argument0,288,272,ceil_obj);
room_instance_add(argument0,256,240,ceil_obj);
room_instance_add(argument0,288,240,ceil_obj);
room_instance_add(argument0,320,240,ceil_obj);
room_instance_add(argument0,320,272,ceil_obj);
room_instance_add(argument0,352,272,ceil_obj);
room_instance_add(argument0,352,240,ceil_obj);
room_instance_add(argument0,384,240,ceil_obj);
room_instance_add(argument0,384,272,ceil_obj);
room_instance_add(argument0,384,304,ceil_obj);
room_instance_add(argument0,320,304,ceil_obj);
room_instance_add(argument0,352,304,ceil_obj);
room_instance_add(argument0,256,208,ceil_obj);
room_instance_add(argument0,288,208,ceil_obj);
room_instance_add(argument0,256,176,ceil_obj);
room_instance_add(argument0,288,176,ceil_obj);
room_instance_add(argument0,320,208,ceil_obj);
room_instance_add(argument0,320,176,ceil_obj);
room_instance_add(argument0,320,144,ceil_obj);
room_instance_add(argument0,352,144,ceil_obj);
room_instance_add(argument0,384,144,ceil_obj);
room_instance_add(argument0,384,176,ceil_obj);
room_instance_add(argument0,352,176,ceil_obj);
room_instance_add(argument0,352,208,ceil_obj);
room_instance_add(argument0,384,208,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,256,224,wall_hor_obj);
room_instance_add(argument0,288,224,wall_hor_obj);
room_instance_add(argument0,320,224,wall_hor_obj);
room_instance_add(argument0,384,224,wall_hor_obj);
room_instance_add(argument0,384,320,wall_hor_obj);
room_instance_add(argument0,352,320,wall_hor_obj);
room_instance_add(argument0,320,320,wall_hor_obj);
room_instance_add(argument0,288,288,wall_hor_obj);
room_instance_add(argument0,256,288,wall_hor_obj);
room_instance_add(argument0,256,160,wall_hor_obj);
room_instance_add(argument0,288,160,wall_hor_obj);
room_instance_add(argument0,320,128,wall_hor_obj);
room_instance_add(argument0,352,128,wall_hor_obj);
room_instance_add(argument0,384,128,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,240,208,wall_vert_obj);
room_instance_add(argument0,240,240,wall_vert_obj);
room_instance_add(argument0,240,272,wall_vert_obj);
room_instance_add(argument0,240,176,wall_vert_obj);
room_instance_add(argument0,304,144,wall_vert_obj);
room_instance_add(argument0,400,208,wall_vert_obj);
room_instance_add(argument0,400,176,wall_vert_obj);
room_instance_add(argument0,400,144,wall_vert_obj);
room_instance_add(argument0,400,240,wall_vert_obj);
room_instance_add(argument0,400,272,wall_vert_obj);
room_instance_add(argument0,400,304,wall_vert_obj);
room_instance_add(argument0,304,304,wall_vert_obj);
// Props
room_instance_add(argument0,352,224,doorframe_01_hor_obj);
room_instance_add(argument0,352,224,doorframe_02_hor_obj);
room_instance_add(argument0,320,304,bed_rand_obj);
room_instance_add(argument0,320,144,bed_rand_obj);
room_instance_add(argument0,368,128,painting_hor_rand_obj);
room_instance_add(argument0,376,320,painting_hor_rand_obj);
// Not Yet