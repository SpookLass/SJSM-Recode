/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Purple Room 2 / Small Room 10'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 432;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 496;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 243;
    global.mark_arr[0,1] = 431;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 204;
    global.mark_arr[1,1] = 433;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 369;
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
room_instance_add(argument0,0,0,color_control_purp_obj);
// Floors
room_instance_add(argument0,112,432,floor_obj);
room_instance_add(argument0,144,432,floor_obj);
room_instance_add(argument0,176,432,floor_obj);
room_instance_add(argument0,208,432,floor_obj);
room_instance_add(argument0,240,432,floor_obj);
room_instance_add(argument0,272,432,floor_obj);
room_instance_add(argument0,272,400,floor_obj);
room_instance_add(argument0,272,464,floor_obj);
room_instance_add(argument0,304,432,floor_obj);
room_instance_add(argument0,304,400,floor_obj);
room_instance_add(argument0,336,400,floor_obj);
room_instance_add(argument0,336,432,floor_obj);
room_instance_add(argument0,336,464,floor_obj);
room_instance_add(argument0,304,464,floor_obj);
room_instance_add(argument0,272,336,floor_obj);
room_instance_add(argument0,304,336,floor_obj);
room_instance_add(argument0,336,336,floor_obj);
room_instance_add(argument0,336,304,floor_obj);
room_instance_add(argument0,304,304,floor_obj);
room_instance_add(argument0,272,304,floor_obj);
room_instance_add(argument0,272,272,floor_obj);
room_instance_add(argument0,304,272,floor_obj);
room_instance_add(argument0,336,272,floor_obj);
room_instance_add(argument0,400,336,floor_obj);
room_instance_add(argument0,400,304,floor_obj);
room_instance_add(argument0,400,272,floor_obj);
room_instance_add(argument0,432,272,floor_obj);
room_instance_add(argument0,464,272,floor_obj);
room_instance_add(argument0,464,304,floor_obj);
room_instance_add(argument0,464,336,floor_obj);
room_instance_add(argument0,432,336,floor_obj);
room_instance_add(argument0,432,304,floor_obj);
room_instance_add(argument0,304,368,floor_obj);
room_instance_add(argument0,368,304,floor_obj);
room_instance_add(argument0,496,304,floor_obj);
// Ceilings
room_instance_add(argument0,112,432,ceil_obj);
room_instance_add(argument0,144,432,ceil_obj);
room_instance_add(argument0,176,432,ceil_obj);
room_instance_add(argument0,208,432,ceil_obj);
room_instance_add(argument0,240,432,ceil_obj);
room_instance_add(argument0,272,432,ceil_3high_obj);
room_instance_add(argument0,272,400,ceil_3high_obj);
room_instance_add(argument0,272,464,ceil_3high_obj);
room_instance_add(argument0,304,432,ceil_3high_obj);
room_instance_add(argument0,304,400,ceil_3high_obj);
room_instance_add(argument0,336,400,ceil_3high_obj);
room_instance_add(argument0,336,432,ceil_3high_obj);
room_instance_add(argument0,336,464,ceil_3high_obj);
room_instance_add(argument0,304,464,ceil_3high_obj);
room_instance_add(argument0,272,336,ceil_3high_obj);
room_instance_add(argument0,304,336,ceil_3high_obj);
room_instance_add(argument0,336,336,ceil_3high_obj);
room_instance_add(argument0,336,304,ceil_3high_obj);
room_instance_add(argument0,304,304,ceil_3high_obj);
room_instance_add(argument0,272,304,ceil_3high_obj);
room_instance_add(argument0,272,272,ceil_3high_obj);
room_instance_add(argument0,304,272,ceil_3high_obj);
room_instance_add(argument0,336,272,ceil_3high_obj);
room_instance_add(argument0,400,336,ceil_3high_obj);
room_instance_add(argument0,400,304,ceil_3high_obj);
room_instance_add(argument0,400,272,ceil_3high_obj);
room_instance_add(argument0,432,272,ceil_3high_obj);
room_instance_add(argument0,464,272,ceil_3high_obj);
room_instance_add(argument0,464,304,ceil_3high_obj);
room_instance_add(argument0,464,336,ceil_3high_obj);
room_instance_add(argument0,432,336,ceil_3high_obj);
room_instance_add(argument0,432,304,ceil_3high_obj);
room_instance_add(argument0,304,368,ceil_obj);
room_instance_add(argument0,368,304,ceil_obj);
room_instance_add(argument0,496,304,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,416,wall_hor_obj);
room_instance_add(argument0,112,448,wall_hor_obj);
room_instance_add(argument0,240,416,wall_hor_obj);
room_instance_add(argument0,368,288,wall_hor_obj);
room_instance_add(argument0,368,320,wall_hor_obj);
room_instance_add(argument0,496,288,wall_hor_obj);
room_instance_add(argument0,496,320,wall_hor_obj);
room_instance_add(argument0,240,448,wall_hor_obj);
room_instance_add(argument0,208,416,wall_hor_obj);
room_instance_add(argument0,176,416,wall_hor_obj);
room_instance_add(argument0,144,416,wall_hor_obj);
room_instance_add(argument0,144,448,wall_hor_obj);
room_instance_add(argument0,176,448,wall_hor_obj);
room_instance_add(argument0,208,448,wall_hor_obj);
room_instance_add(argument0,272,256,wall_3high_hor_obj);
room_instance_add(argument0,272,352,wall_3high_hor_obj);
room_instance_add(argument0,336,352,wall_3high_hor_obj);
room_instance_add(argument0,336,384,wall_3high_hor_obj);
room_instance_add(argument0,272,384,wall_3high_hor_obj);
room_instance_add(argument0,272,480,wall_3high_hor_obj);
room_instance_add(argument0,304,480,wall_3high_hor_obj);
room_instance_add(argument0,336,480,wall_3high_hor_obj);
room_instance_add(argument0,336,256,wall_3high_hor_obj);
room_instance_add(argument0,304,256,wall_3high_hor_obj);
room_instance_add(argument0,400,256,wall_3high_hor_obj);
room_instance_add(argument0,432,256,wall_3high_hor_obj);
room_instance_add(argument0,464,256,wall_3high_hor_obj);
room_instance_add(argument0,464,352,wall_3high_hor_obj);
room_instance_add(argument0,432,352,wall_3high_hor_obj);
room_instance_add(argument0,400,352,wall_3high_hor_obj);
room_instance_add(argument0,304,352,wall_2doorway_hor_obj);
room_instance_add(argument0,304,384,wall_2doorway_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,432,wall_vert_obj);
room_instance_add(argument0,288,368,wall_vert_obj);
room_instance_add(argument0,320,368,wall_vert_obj);
room_instance_add(argument0,512,304,wall_vert_obj);
room_instance_add(argument0,256,400,wall_3high_vert_obj);
room_instance_add(argument0,256,464,wall_3high_vert_obj);
room_instance_add(argument0,352,400,wall_3high_vert_obj);
room_instance_add(argument0,352,432,wall_3high_vert_obj);
room_instance_add(argument0,352,464,wall_3high_vert_obj);
room_instance_add(argument0,384,336,wall_3high_vert_obj);
room_instance_add(argument0,480,336,wall_3high_vert_obj);
room_instance_add(argument0,480,272,wall_3high_vert_obj);
room_instance_add(argument0,384,272,wall_3high_vert_obj);
room_instance_add(argument0,352,272,wall_3high_vert_obj);
room_instance_add(argument0,352,336,wall_3high_vert_obj);
room_instance_add(argument0,256,336,wall_3high_vert_obj);
room_instance_add(argument0,256,304,wall_3high_vert_obj);
room_instance_add(argument0,256,272,wall_3high_vert_obj);
room_instance_add(argument0,256,432,wall_2doorway_vert_obj);
room_instance_add(argument0,352,304,wall_2doorway_vert_obj);
room_instance_add(argument0,384,304,wall_2doorway_vert_obj);
room_instance_add(argument0,480,304,wall_2doorway_vert_obj);
// Torches
room_instance_add(argument0,176,416,torch_north_obj);
room_instance_add(argument0,304,256,torch_north_obj);
room_instance_add(argument0,432,256,torch_north_obj);
room_instance_add(argument0,176,448,torch_south_obj);
room_instance_add(argument0,304,480,torch_south_obj);
room_instance_add(argument0,432,352,torch_south_obj);