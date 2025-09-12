/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    global.rm_name_var = 'Thin Hall 16'
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 528;
    global.spawn_arr[1,1] = 144;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 233;
    global.mark_arr[0,1] = 151;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 372;
    global.mark_arr[1,1] = 190;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 510;
    global.mark_arr[2,1] = 140;
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
// Floors
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,272,144,floor_obj);
room_instance_add(argument0,208,112,floor_obj);
room_instance_add(argument0,240,112,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,240,176,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,272,112,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
room_instance_add(argument0,336,144,floor_obj);
room_instance_add(argument0,368,144,floor_obj);
room_instance_add(argument0,368,176,floor_obj);
room_instance_add(argument0,368,208,floor_obj);
room_instance_add(argument0,400,208,floor_obj);
room_instance_add(argument0,432,208,floor_obj);
room_instance_add(argument0,432,176,floor_obj);
room_instance_add(argument0,432,144,floor_obj);
room_instance_add(argument0,464,144,floor_obj);
room_instance_add(argument0,496,144,floor_obj);
room_instance_add(argument0,528,144,floor_obj);
room_instance_add(argument0,496,112,floor_obj);
room_instance_add(argument0,528,112,floor_obj);
room_instance_add(argument0,528,176,floor_obj);
room_instance_add(argument0,496,176,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,208,144,ceil_obj);
room_instance_add(argument0,240,144,ceil_obj);
room_instance_add(argument0,272,144,ceil_obj);
room_instance_add(argument0,208,112,ceil_obj);
room_instance_add(argument0,240,112,ceil_obj);
room_instance_add(argument0,208,176,ceil_obj);
room_instance_add(argument0,240,176,ceil_obj);
room_instance_add(argument0,272,176,ceil_obj);
room_instance_add(argument0,272,112,ceil_obj);
room_instance_add(argument0,304,144,ceil_obj);
room_instance_add(argument0,336,144,ceil_obj);
room_instance_add(argument0,368,144,ceil_obj);
room_instance_add(argument0,368,176,ceil_obj);
room_instance_add(argument0,368,208,ceil_obj);
room_instance_add(argument0,400,208,ceil_obj);
room_instance_add(argument0,432,208,ceil_obj);
room_instance_add(argument0,432,176,ceil_obj);
room_instance_add(argument0,432,144,ceil_obj);
room_instance_add(argument0,464,144,ceil_obj);
room_instance_add(argument0,496,144,ceil_obj);
room_instance_add(argument0,528,144,ceil_obj);
room_instance_add(argument0,496,112,ceil_obj);
room_instance_add(argument0,528,112,ceil_obj);
room_instance_add(argument0,528,176,ceil_obj);
room_instance_add(argument0,496,176,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,128,wall_hor_obj);
room_instance_add(argument0,176,160,wall_hor_obj);
room_instance_add(argument0,208,96,wall_hor_obj);
room_instance_add(argument0,240,96,wall_hor_obj);
room_instance_add(argument0,272,96,wall_hor_obj);
room_instance_add(argument0,208,192,wall_hor_obj);
room_instance_add(argument0,240,192,wall_hor_obj);
room_instance_add(argument0,272,192,wall_hor_obj);
room_instance_add(argument0,304,152,wall_hor_obj);
room_instance_add(argument0,304,136,wall_hor_obj);
room_instance_add(argument0,336,136,wall_hor_obj);
room_instance_add(argument0,336,152,wall_hor_obj);
room_instance_add(argument0,368,136,wall_hor_obj);
room_instance_add(argument0,368,216,wall_hor_obj);
room_instance_add(argument0,400,216,wall_hor_obj);
room_instance_add(argument0,432,216,wall_hor_obj);
room_instance_add(argument0,400,192,wall_hor_obj);
room_instance_add(argument0,432,136,wall_hor_obj);
room_instance_add(argument0,464,136,wall_hor_obj);
room_instance_add(argument0,464,152,wall_hor_obj);
room_instance_add(argument0,496,96,wall_hor_obj);
room_instance_add(argument0,528,96,wall_hor_obj);
room_instance_add(argument0,528,192,wall_hor_obj);
room_instance_add(argument0,496,192,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,192,176,wall_vert_obj);
room_instance_add(argument0,192,112,wall_vert_obj);
room_instance_add(argument0,288,120,wall_vert_obj);
room_instance_add(argument0,288,88,wall_vert_obj);
room_instance_add(argument0,288,168,wall_vert_obj);
room_instance_add(argument0,288,200,wall_vert_obj);
room_instance_add(argument0,352,168,wall_vert_obj);
room_instance_add(argument0,352,200,wall_vert_obj);
room_instance_add(argument0,384,176,wall_vert_obj);
room_instance_add(argument0,384,144,wall_vert_obj);
room_instance_add(argument0,416,176,wall_vert_obj);
room_instance_add(argument0,416,144,wall_vert_obj);
room_instance_add(argument0,448,168,wall_vert_obj);
room_instance_add(argument0,448,200,wall_vert_obj);
room_instance_add(argument0,480,168,wall_vert_obj);
room_instance_add(argument0,480,200,wall_vert_obj);
room_instance_add(argument0,480,120,wall_vert_obj);
room_instance_add(argument0,480,88,wall_vert_obj);
room_instance_add(argument0,544,112,wall_vert_obj);
room_instance_add(argument0,544,144,wall_vert_obj);
room_instance_add(argument0,544,176,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,208,112,table_rand_obj);
// Not yet