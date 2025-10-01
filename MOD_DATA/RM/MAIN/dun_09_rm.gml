/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Dungeon Room 9'
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 480;
    global.spawn_arr[1,1] = 96;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 480;
    global.spawn_arr[2,1] = 416;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    // Mark
    global.mark_len_var = 0;
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
room_instance_add(argument0,0,0,color_control_bright_obj);
// Floors
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,384,256,floor_obj);
room_instance_add(argument0,416,256,floor_obj);
room_instance_add(argument0,416,224,floor_obj);
room_instance_add(argument0,416,192,floor_obj);
room_instance_add(argument0,416,160,floor_obj);
room_instance_add(argument0,416,288,floor_obj);
room_instance_add(argument0,416,320,floor_obj);
room_instance_add(argument0,416,352,floor_obj);
room_instance_add(argument0,416,384,floor_obj);
room_instance_add(argument0,416,416,floor_obj);
room_instance_add(argument0,416,128,floor_obj);
room_instance_add(argument0,416,96,floor_obj);
room_instance_add(argument0,448,96,floor_obj);
room_instance_add(argument0,448,416,floor_obj);
room_instance_add(argument0,480,416,floor_obj);
room_instance_add(argument0,480,96,floor_obj);
// Ceilings
room_instance_add(argument0,224,256,ceil_2high_obj);
room_instance_add(argument0,256,256,ceil_2high_obj);
room_instance_add(argument0,288,256,ceil_2high_obj);
room_instance_add(argument0,320,256,ceil_2high_obj);
room_instance_add(argument0,352,256,ceil_2high_obj);
room_instance_add(argument0,384,256,ceil_2high_obj);
room_instance_add(argument0,416,256,ceil_2high_obj);
room_instance_add(argument0,416,224,ceil_2high_obj);
room_instance_add(argument0,416,192,ceil_2high_obj);
room_instance_add(argument0,416,160,ceil_2high_obj);
room_instance_add(argument0,416,288,ceil_2high_obj);
room_instance_add(argument0,416,320,ceil_2high_obj);
room_instance_add(argument0,416,352,ceil_2high_obj);
room_instance_add(argument0,416,384,ceil_2high_obj);
room_instance_add(argument0,416,416,ceil_2high_obj);
room_instance_add(argument0,416,128,ceil_2high_obj);
room_instance_add(argument0,416,96,ceil_2high_obj);
room_instance_add(argument0,448,96,ceil_2high_obj);
room_instance_add(argument0,448,416,ceil_2high_obj);
room_instance_add(argument0,480,416,ceil_2high_obj);
room_instance_add(argument0,480,96,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,272,wall_2high_hor_obj);
room_instance_add(argument0,224,240,wall_2high_hor_obj);
room_instance_add(argument0,256,240,wall_2high_hor_obj);
room_instance_add(argument0,288,240,wall_2high_hor_obj);
room_instance_add(argument0,320,240,wall_2high_hor_obj);
room_instance_add(argument0,352,240,wall_2high_hor_obj);
room_instance_add(argument0,384,240,wall_2high_hor_obj);
room_instance_add(argument0,384,272,wall_2high_hor_obj);
room_instance_add(argument0,352,272,wall_2high_hor_obj);
room_instance_add(argument0,320,272,wall_2high_hor_obj);
room_instance_add(argument0,288,272,wall_2high_hor_obj);
room_instance_add(argument0,256,272,wall_2high_hor_obj);
room_instance_add(argument0,416,432,wall_2high_hor_obj);
room_instance_add(argument0,448,400,wall_2high_hor_obj);
room_instance_add(argument0,480,400,wall_2high_hor_obj);
room_instance_add(argument0,480,432,wall_2high_hor_obj);
room_instance_add(argument0,448,432,wall_2high_hor_obj);
room_instance_add(argument0,448,112,wall_2high_hor_obj);
room_instance_add(argument0,480,112,wall_2high_hor_obj);
room_instance_add(argument0,480,80,wall_2high_hor_obj);
room_instance_add(argument0,448,80,wall_2high_hor_obj);
room_instance_add(argument0,416,80,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,256,wall_2high_vert_obj);
room_instance_add(argument0,432,256,wall_2high_vert_obj);
room_instance_add(argument0,400,224,wall_2high_vert_obj);
room_instance_add(argument0,400,192,wall_2high_vert_obj);
room_instance_add(argument0,400,160,wall_2high_vert_obj);
room_instance_add(argument0,432,160,wall_2high_vert_obj);
room_instance_add(argument0,432,192,wall_2high_vert_obj);
room_instance_add(argument0,432,224,wall_2high_vert_obj);
room_instance_add(argument0,432,128,wall_2high_vert_obj);
room_instance_add(argument0,400,128,wall_2high_vert_obj);
room_instance_add(argument0,400,96,wall_2high_vert_obj);
room_instance_add(argument0,496,96,wall_2high_vert_obj);
room_instance_add(argument0,432,288,wall_2high_vert_obj);
room_instance_add(argument0,432,320,wall_2high_vert_obj);
room_instance_add(argument0,432,352,wall_2high_vert_obj);
room_instance_add(argument0,432,384,wall_2high_vert_obj);
room_instance_add(argument0,496,416,wall_2high_vert_obj);
room_instance_add(argument0,400,416,wall_2high_vert_obj);
room_instance_add(argument0,400,384,wall_2high_vert_obj);
room_instance_add(argument0,400,352,wall_2high_vert_obj);
room_instance_add(argument0,400,320,wall_2high_vert_obj);
room_instance_add(argument0,400,288,wall_2high_vert_obj);
// Torches
room_instance_add(argument0,400,192,torch_west_obj);
room_instance_add(argument0,400,320,torch_west_obj);
room_instance_add(argument0,432,192,torch_east_obj);
room_instance_add(argument0,432,320,torch_east_obj);
// Props
// Not Yet
room_instance_add(argument0,336,272,js_obj);