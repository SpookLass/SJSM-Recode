/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    global.rm_name_var = 'Fish Room 10'
    global.spawn_len_var = 3;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 448;
    global.spawn_arr[1,1] = 448;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 448;
    global.spawn_arr[2,1] = 64;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 304;
    global.mark_arr[0,1] = 253;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 348;
    global.mark_arr[1,1] = 261;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 352;
    global.mark_arr[2,1] = 142;
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
// Floors
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,352,224,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,352,288,floor_obj);
room_instance_add(argument0,384,288,floor_obj);
room_instance_add(argument0,384,256,floor_obj);
room_instance_add(argument0,384,224,floor_obj);
room_instance_add(argument0,352,192,floor_obj);
room_instance_add(argument0,352,320,floor_obj);
room_instance_add(argument0,352,160,floor_obj);
room_instance_add(argument0,352,128,floor_obj);
room_instance_add(argument0,352,96,floor_obj);
room_instance_add(argument0,352,64,floor_obj);
room_instance_add(argument0,352,352,floor_obj);
room_instance_add(argument0,352,384,floor_obj);
room_instance_add(argument0,352,416,floor_obj);
room_instance_add(argument0,352,448,floor_obj);
room_instance_add(argument0,384,448,floor_obj);
room_instance_add(argument0,416,448,floor_obj);
room_instance_add(argument0,384,64,floor_obj);
room_instance_add(argument0,416,64,floor_obj);
room_instance_add(argument0,448,64,floor_obj);
room_instance_add(argument0,448,448,floor_obj);
// Ceilings
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,320,224,ceil_obj);
room_instance_add(argument0,352,224,ceil_obj);
room_instance_add(argument0,352,256,ceil_obj);
room_instance_add(argument0,320,288,ceil_obj);
room_instance_add(argument0,352,288,ceil_obj);
room_instance_add(argument0,384,288,ceil_obj);
room_instance_add(argument0,384,256,ceil_obj);
room_instance_add(argument0,384,224,ceil_obj);
room_instance_add(argument0,352,192,ceil_obj);
room_instance_add(argument0,352,320,ceil_obj);
room_instance_add(argument0,352,160,ceil_obj);
room_instance_add(argument0,352,128,ceil_obj);
room_instance_add(argument0,352,96,ceil_obj);
room_instance_add(argument0,352,64,ceil_obj);
room_instance_add(argument0,352,352,ceil_obj);
room_instance_add(argument0,352,384,ceil_obj);
room_instance_add(argument0,352,416,ceil_obj);
room_instance_add(argument0,352,448,ceil_obj);
room_instance_add(argument0,384,448,ceil_obj);
room_instance_add(argument0,416,448,ceil_obj);
room_instance_add(argument0,384,64,ceil_obj);
room_instance_add(argument0,416,64,ceil_obj);
room_instance_add(argument0,448,64,ceil_obj);
room_instance_add(argument0,448,448,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,352,48,wall_hor_obj);
room_instance_add(argument0,384,80,wall_hor_obj);
room_instance_add(argument0,384,48,wall_hor_obj);
room_instance_add(argument0,416,48,wall_hor_obj);
room_instance_add(argument0,416,80,wall_hor_obj);
room_instance_add(argument0,448,80,wall_hor_obj);
room_instance_add(argument0,448,48,wall_hor_obj);
room_instance_add(argument0,384,208,wall_hor_obj);
room_instance_add(argument0,320,208,wall_hor_obj);
room_instance_add(argument0,320,304,wall_hor_obj);
room_instance_add(argument0,384,304,wall_hor_obj);
room_instance_add(argument0,288,240,wall_hor_obj);
room_instance_add(argument0,256,240,wall_hor_obj);
room_instance_add(argument0,256,272,wall_hor_obj);
room_instance_add(argument0,288,272,wall_hor_obj);
room_instance_add(argument0,352,464,wall_hor_obj);
room_instance_add(argument0,384,432,wall_hor_obj);
room_instance_add(argument0,384,464,wall_hor_obj);
room_instance_add(argument0,416,432,wall_hor_obj);
room_instance_add(argument0,416,464,wall_hor_obj);
room_instance_add(argument0,448,432,wall_hor_obj);
room_instance_add(argument0,448,464,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,240,256,wall_vert_obj);
room_instance_add(argument0,304,288,wall_vert_obj);
room_instance_add(argument0,304,224,wall_vert_obj);
room_instance_add(argument0,400,224,wall_vert_obj);
room_instance_add(argument0,400,256,wall_vert_obj);
room_instance_add(argument0,400,288,wall_vert_obj);
room_instance_add(argument0,368,320,wall_vert_obj);
room_instance_add(argument0,368,352,wall_vert_obj);
room_instance_add(argument0,368,384,wall_vert_obj);
room_instance_add(argument0,368,416,wall_vert_obj);
room_instance_add(argument0,464,448,wall_vert_obj);
room_instance_add(argument0,336,448,wall_vert_obj);
room_instance_add(argument0,336,416,wall_vert_obj);
room_instance_add(argument0,336,384,wall_vert_obj);
room_instance_add(argument0,336,352,wall_vert_obj);
room_instance_add(argument0,336,320,wall_vert_obj);
room_instance_add(argument0,368,192,wall_vert_obj);
room_instance_add(argument0,336,192,wall_vert_obj);
room_instance_add(argument0,336,160,wall_vert_obj);
room_instance_add(argument0,336,128,wall_vert_obj);
room_instance_add(argument0,336,96,wall_vert_obj);
room_instance_add(argument0,336,64,wall_vert_obj);
room_instance_add(argument0,368,96,wall_vert_obj);
room_instance_add(argument0,368,128,wall_vert_obj);
room_instance_add(argument0,368,160,wall_vert_obj);
room_instance_add(argument0,464,64,wall_vert_obj);
// Props
room_instance_add(argument0,320,224,tank_rand_obj);
room_instance_add(argument0,320,288,tank_rand_obj);
room_instance_add(argument0,384,224,tank_rand_obj);
room_instance_add(argument0,384,256,tank_rand_obj);
room_instance_add(argument0,384,288,tank_rand_obj);
// Not yet
//room_instance_add(argument0,400,464,js_obj);