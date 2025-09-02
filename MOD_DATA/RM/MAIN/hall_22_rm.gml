/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Hall 22'
    // Spawn
    global.spawn_len_var = 4;
    global.spawn_arr[0,0] = 96;
    global.spawn_arr[0,1] = 208;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 480;
    global.spawn_arr[1,1] = 208;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 448;
    global.spawn_arr[2,1] = 176;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    global.spawn_arr[3,0] = 448;
    global.spawn_arr[3,1] = 240;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 90;
    // Mark
    global.mark_len_var = 2;
    global.mark_arr[0,0] = 224;
    global.mark_arr[0,1] = 208;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 416;
    global.mark_arr[1,1] = 208;
    global.mark_arr[1,2] = 0;
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
room_instance_add(argument0,96,208,floor_obj);
room_instance_add(argument0,128,208,floor_obj);
room_instance_add(argument0,160,208,floor_obj);
room_instance_add(argument0,192,208,floor_obj);
room_instance_add(argument0,224,208,floor_obj);
room_instance_add(argument0,256,208,floor_obj);
room_instance_add(argument0,288,208,floor_obj);
room_instance_add(argument0,320,208,floor_obj);
room_instance_add(argument0,352,208,floor_obj);
room_instance_add(argument0,384,208,floor_obj);
room_instance_add(argument0,416,208,floor_obj);
room_instance_add(argument0,448,208,floor_obj);
room_instance_add(argument0,448,176,floor_obj);
room_instance_add(argument0,480,208,floor_obj);
room_instance_add(argument0,448,240,floor_obj);
// Ceilings
room_instance_add(argument0,96,208,ceil_obj);
room_instance_add(argument0,128,208,ceil_obj);
room_instance_add(argument0,160,208,ceil_obj);
room_instance_add(argument0,192,208,ceil_obj);
room_instance_add(argument0,224,208,ceil_obj);
room_instance_add(argument0,256,208,ceil_obj);
room_instance_add(argument0,288,208,ceil_obj);
room_instance_add(argument0,320,208,ceil_obj);
room_instance_add(argument0,352,208,ceil_obj);
room_instance_add(argument0,384,208,ceil_obj);
room_instance_add(argument0,416,208,ceil_obj);
room_instance_add(argument0,448,208,ceil_obj);
room_instance_add(argument0,448,176,ceil_obj);
room_instance_add(argument0,480,208,ceil_obj);
room_instance_add(argument0,448,240,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,96,192,wall_hor_obj);
room_instance_add(argument0,416,192,wall_hor_obj);
room_instance_add(argument0,480,192,wall_hor_obj);
room_instance_add(argument0,480,224,wall_hor_obj);
room_instance_add(argument0,416,224,wall_hor_obj);
room_instance_add(argument0,448,160,wall_hor_obj);
room_instance_add(argument0,448,256,wall_hor_obj);
room_instance_add(argument0,384,224,wall_hor_obj);
room_instance_add(argument0,384,192,wall_hor_obj);
room_instance_add(argument0,352,192,wall_hor_obj);
room_instance_add(argument0,320,192,wall_hor_obj);
room_instance_add(argument0,96,224,wall_hor_obj);
room_instance_add(argument0,128,224,wall_hor_obj);
room_instance_add(argument0,160,224,wall_hor_obj);
room_instance_add(argument0,192,224,wall_hor_obj);
room_instance_add(argument0,224,224,wall_hor_obj);
room_instance_add(argument0,256,224,wall_hor_obj);
room_instance_add(argument0,288,224,wall_hor_obj);
room_instance_add(argument0,320,224,wall_hor_obj);
room_instance_add(argument0,352,224,wall_hor_obj);
room_instance_add(argument0,288,192,wall_hor_obj);
room_instance_add(argument0,256,192,wall_hor_obj);
room_instance_add(argument0,224,192,wall_hor_obj);
room_instance_add(argument0,192,192,wall_hor_obj);
room_instance_add(argument0,160,192,wall_hor_obj);
room_instance_add(argument0,128,192,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,80,208,wall_vert_obj);
room_instance_add(argument0,432,176,wall_vert_obj);
room_instance_add(argument0,464,176,wall_vert_obj);
room_instance_add(argument0,496,208,wall_vert_obj);
room_instance_add(argument0,432,240,wall_vert_obj);
room_instance_add(argument0,464,240,wall_vert_obj);
// Torches
room_instance_add(argument0,160,192,torch_north_obj);
room_instance_add(argument0,256,192,torch_north_obj);
room_instance_add(argument0,352,192,torch_north_obj);
room_instance_add(argument0,160,224,torch_south_obj);
room_instance_add(argument0,256,224,torch_south_obj);
room_instance_add(argument0,352,224,torch_south_obj);
// Not yet
/*room_instance_add(argument0,304,224,random_scare_mark1);
room_instance_add(argument0,326,216,webs_obj);*/