/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    global.rm_name_var = 'Fish Room 9'
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 544;
    global.spawn_arr[1,1] = 320;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 322;
    global.mark_arr[0,1] = 250;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 395;
    global.mark_arr[1,1] = 191;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 427;
    global.mark_arr[2,1] = 308;
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
// Floors
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,320,192,floor_obj);
room_instance_add(argument0,352,192,floor_obj);
room_instance_add(argument0,384,192,floor_obj);
room_instance_add(argument0,416,192,floor_obj);
room_instance_add(argument0,416,224,floor_obj);
room_instance_add(argument0,416,256,floor_obj);
room_instance_add(argument0,416,288,floor_obj);
room_instance_add(argument0,416,320,floor_obj);
room_instance_add(argument0,448,320,floor_obj);
room_instance_add(argument0,480,320,floor_obj);
room_instance_add(argument0,512,320,floor_obj);
room_instance_add(argument0,480,288,floor_obj);
room_instance_add(argument0,512,288,floor_obj);
room_instance_add(argument0,544,320,floor_obj);
room_instance_add(argument0,512,352,floor_obj);
room_instance_add(argument0,480,352,floor_obj);
// Ceilings
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,320,224,ceil_obj);
room_instance_add(argument0,320,192,ceil_obj);
room_instance_add(argument0,352,192,ceil_obj);
room_instance_add(argument0,384,192,ceil_obj);
room_instance_add(argument0,416,192,ceil_obj);
room_instance_add(argument0,416,224,ceil_obj);
room_instance_add(argument0,416,256,ceil_obj);
room_instance_add(argument0,416,288,ceil_obj);
room_instance_add(argument0,416,320,ceil_obj);
room_instance_add(argument0,448,320,ceil_obj);
room_instance_add(argument0,480,320,ceil_obj);
room_instance_add(argument0,512,320,ceil_obj);
room_instance_add(argument0,480,288,ceil_obj);
room_instance_add(argument0,512,288,ceil_obj);
room_instance_add(argument0,544,320,ceil_obj);
room_instance_add(argument0,512,352,ceil_obj);
room_instance_add(argument0,480,352,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,320,272,wall_hor_obj);
room_instance_add(argument0,288,272,wall_hor_obj);
room_instance_add(argument0,256,272,wall_hor_obj);
room_instance_add(argument0,288,240,wall_hor_obj);
room_instance_add(argument0,256,240,wall_hor_obj);
room_instance_add(argument0,320,176,wall_hor_obj);
room_instance_add(argument0,352,208,wall_hor_obj);
room_instance_add(argument0,384,208,wall_hor_obj);
room_instance_add(argument0,352,176,wall_hor_obj);
room_instance_add(argument0,384,176,wall_hor_obj);
room_instance_add(argument0,416,176,wall_hor_obj);
room_instance_add(argument0,416,336,wall_hor_obj);
room_instance_add(argument0,448,304,wall_hor_obj);
room_instance_add(argument0,448,336,wall_hor_obj);
room_instance_add(argument0,480,368,wall_hor_obj);
room_instance_add(argument0,512,368,wall_hor_obj);
room_instance_add(argument0,512,272,wall_hor_obj);
room_instance_add(argument0,480,272,wall_hor_obj);
room_instance_add(argument0,544,304,wall_hor_obj);
room_instance_add(argument0,544,336,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,240,256,wall_vert_obj);
room_instance_add(argument0,336,256,wall_vert_obj);
room_instance_add(argument0,336,224,wall_vert_obj);
room_instance_add(argument0,304,224,wall_vert_obj);
room_instance_add(argument0,304,192,wall_vert_obj);
room_instance_add(argument0,400,224,wall_vert_obj);
room_instance_add(argument0,432,192,wall_vert_obj);
room_instance_add(argument0,432,224,wall_vert_obj);
room_instance_add(argument0,432,256,wall_vert_obj);
room_instance_add(argument0,432,288,wall_vert_obj);
room_instance_add(argument0,400,256,wall_vert_obj);
room_instance_add(argument0,400,288,wall_vert_obj);
room_instance_add(argument0,400,320,wall_vert_obj);
room_instance_add(argument0,464,288,wall_vert_obj);
room_instance_add(argument0,464,352,wall_vert_obj);
room_instance_add(argument0,528,352,wall_vert_obj);
room_instance_add(argument0,528,288,wall_vert_obj);
room_instance_add(argument0,560,320,wall_vert_obj);
// Props
room_instance_add(argument0,480,288,tank_rand_obj);
room_instance_add(argument0,512,288,tank_rand_obj);
room_instance_add(argument0,480,352,tank_rand_obj);
room_instance_add(argument0,512,352,tank_rand_obj);