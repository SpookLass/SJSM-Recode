/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Purple Room 6 / Small Room 14'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 320;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 240;
    global.spawn_arr[1,1] = 448;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 152;
    global.mark_arr[0,1] = 319;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 177;
    global.mark_arr[1,1] = 405;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 197;
    global.mark_arr[2,1] = 451;
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
room_instance_add(argument0,0,0,purp_color_obj);
// Floors
room_instance_add(argument0,112,320,floor_obj);
room_instance_add(argument0,144,320,floor_obj);
room_instance_add(argument0,176,320,floor_obj);
room_instance_add(argument0,176,352,floor_obj);
room_instance_add(argument0,176,384,floor_obj);
room_instance_add(argument0,176,416,floor_obj);
room_instance_add(argument0,176,448,floor_obj);
room_instance_add(argument0,208,448,floor_obj);
room_instance_add(argument0,240,448,floor_obj);
// Ceilings
room_instance_add(argument0,112,320,ceil_obj);
room_instance_add(argument0,144,320,ceil_obj);
room_instance_add(argument0,176,320,ceil_obj);
room_instance_add(argument0,176,352,ceil_obj);
room_instance_add(argument0,176,384,ceil_obj);
room_instance_add(argument0,176,416,ceil_obj);
room_instance_add(argument0,176,448,ceil_obj);
room_instance_add(argument0,208,448,ceil_obj);
room_instance_add(argument0,240,448,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,304,wall_hor_obj);
room_instance_add(argument0,144,336,wall_hor_obj);
room_instance_add(argument0,112,336,wall_hor_obj);
room_instance_add(argument0,144,304,wall_hor_obj);
room_instance_add(argument0,176,304,wall_hor_obj);
room_instance_add(argument0,208,432,wall_hor_obj);
room_instance_add(argument0,240,432,wall_hor_obj);
room_instance_add(argument0,240,464,wall_hor_obj);
room_instance_add(argument0,208,464,wall_hor_obj);
room_instance_add(argument0,176,464,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,320,wall_vert_obj);
room_instance_add(argument0,256,448,wall_vert_obj);
room_instance_add(argument0,192,416,wall_vert_obj);
room_instance_add(argument0,192,384,wall_vert_obj);
room_instance_add(argument0,192,352,wall_vert_obj);
room_instance_add(argument0,192,320,wall_vert_obj);
room_instance_add(argument0,160,352,wall_vert_obj);
room_instance_add(argument0,160,384,wall_vert_obj);
room_instance_add(argument0,160,416,wall_vert_obj);
room_instance_add(argument0,160,448,wall_vert_obj);
// Torches
room_instance_add(argument0,240,112,torch_north_obj);
room_instance_add(argument0,368,112,torch_north_obj);
room_instance_add(argument0,240,208,torch_south_obj);
room_instance_add(argument0,368,464,torch_south_obj);