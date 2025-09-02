/*
Argument 0: Room Variable (same for all rooms)
*/
// This doesn't really work as an actual room, but it's cute if you know what it is
room_set_code
(
    argument0,
    "
    // Name
    global.rm_name_var = 'J+M Room'
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 144;
    global.spawn_arr[0,1] = 240;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 90;
    global.spawn_arr[1,0] = 48;
    global.spawn_arr[1,1] = 144;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    global.spawn_arr[2,0] = 240;
    global.spawn_arr[2,1] = 144;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 90;
    shuffle_spawn_scr(false);
    // Mark
    global.mark_len_var = -1;
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
room_instance_add(argument0,48,80,floor_obj);
room_instance_add(argument0,48,112,floor_obj);
room_instance_add(argument0,48,144,floor_obj);
room_instance_add(argument0,80,48,floor_obj);
room_instance_add(argument0,80,80,floor_obj);
room_instance_add(argument0,80,112,floor_obj);
room_instance_add(argument0,80,144,floor_obj);
room_instance_add(argument0,80,176,floor_obj);
room_instance_add(argument0,112,48,floor_obj);
room_instance_add(argument0,112,80,floor_obj);
room_instance_add(argument0,112,112,floor_obj);
room_instance_add(argument0,112,144,floor_obj);
room_instance_add(argument0,112,176,floor_obj);
room_instance_add(argument0,112,208,floor_obj);
room_instance_add(argument0,144,80,floor_obj);
room_instance_add(argument0,144,112,floor_obj);
room_instance_add(argument0,144,144,floor_obj);
room_instance_add(argument0,144,176,floor_obj);
room_instance_add(argument0,144,208,floor_obj);
room_instance_add(argument0,144,240,floor_obj);
room_instance_add(argument0,176,48,floor_obj);
room_instance_add(argument0,176,80,floor_obj);
room_instance_add(argument0,176,112,floor_obj);
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,176,176,floor_obj);
room_instance_add(argument0,176,208,floor_obj);
room_instance_add(argument0,208,48,floor_obj);
room_instance_add(argument0,208,80,floor_obj);
room_instance_add(argument0,208,112,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,240,80,floor_obj);
room_instance_add(argument0,240,112,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
// Ceilings
room_instance_add(argument0,48,80,ceil_obj);
room_instance_add(argument0,48,112,ceil_obj);
room_instance_add(argument0,48,144,ceil_obj);
room_instance_add(argument0,80,48,ceil_obj);
room_instance_add(argument0,80,80,ceil_obj);
room_instance_add(argument0,80,112,ceil_obj);
room_instance_add(argument0,80,144,ceil_obj);
room_instance_add(argument0,80,176,ceil_obj);
room_instance_add(argument0,112,48,ceil_obj);
room_instance_add(argument0,112,80,ceil_obj);
room_instance_add(argument0,112,112,ceil_obj);
room_instance_add(argument0,112,144,ceil_obj);
room_instance_add(argument0,112,176,ceil_obj);
room_instance_add(argument0,112,208,ceil_obj);
room_instance_add(argument0,144,80,ceil_obj);
room_instance_add(argument0,144,112,ceil_obj);
room_instance_add(argument0,144,144,ceil_obj);
room_instance_add(argument0,144,176,ceil_obj);
room_instance_add(argument0,144,208,ceil_obj);
room_instance_add(argument0,144,240,ceil_obj);
room_instance_add(argument0,176,48,ceil_obj);
room_instance_add(argument0,176,80,ceil_obj);
room_instance_add(argument0,176,112,ceil_obj);
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,176,176,ceil_obj);
room_instance_add(argument0,176,208,ceil_obj);
room_instance_add(argument0,208,48,ceil_obj);
room_instance_add(argument0,208,80,ceil_obj);
room_instance_add(argument0,208,112,ceil_obj);
room_instance_add(argument0,208,144,ceil_obj);
room_instance_add(argument0,208,176,ceil_obj);
room_instance_add(argument0,240,80,ceil_obj);
room_instance_add(argument0,240,112,ceil_obj);
room_instance_add(argument0,240,144,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,48,64,wall_hor_obj);
room_instance_add(argument0,48,160,wall_hor_obj);
room_instance_add(argument0,80,32,wall_hor_obj);
room_instance_add(argument0,80,192,wall_hor_obj);
room_instance_add(argument0,112,32,wall_hor_obj);
room_instance_add(argument0,112,224,wall_hor_obj);
room_instance_add(argument0,144,64,wall_hor_obj);
room_instance_add(argument0,144,256,wall_hor_obj);
room_instance_add(argument0,176,32,wall_hor_obj);
room_instance_add(argument0,176,224,wall_hor_obj);
room_instance_add(argument0,208,32,wall_hor_obj);
room_instance_add(argument0,208,192,wall_hor_obj);
room_instance_add(argument0,240,64,wall_hor_obj);
room_instance_add(argument0,240,160,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,32,80,wall_vert_obj);
room_instance_add(argument0,32,112,wall_vert_obj);
room_instance_add(argument0,32,144,wall_vert_obj);
room_instance_add(argument0,64,48,wall_vert_obj);
room_instance_add(argument0,64,176,wall_vert_obj);
room_instance_add(argument0,96,208,wall_vert_obj);
room_instance_add(argument0,128,48,wall_vert_obj);
room_instance_add(argument0,128,240,wall_vert_obj);
room_instance_add(argument0,160,48,wall_vert_obj);
room_instance_add(argument0,160,240,wall_vert_obj);
room_instance_add(argument0,192,208,wall_vert_obj);
room_instance_add(argument0,224,48,wall_vert_obj);
room_instance_add(argument0,224,176,wall_vert_obj);
room_instance_add(argument0,256,80,wall_vert_obj);
room_instance_add(argument0,256,112,wall_vert_obj);
room_instance_add(argument0,256,144,wall_vert_obj);
// Initials
// J
room_instance_add(argument0,80,96,wall_hor_obj);
room_instance_add(argument0,96,112,wall_vert_obj);
room_instance_add(argument0,96,144,wall_vert_obj);
room_instance_add(argument0,80,160,wall_hor_obj);
room_instance_add(argument0,64,144,wall_vert_obj);
// +
room_instance_add(argument0,128,128,wall_hor_obj);
room_instance_add(argument0,128,128,wall_vert_obj);
// M
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,160,112,wall_vert_obj);
room_instance_add(argument0,176,96,wall_hor_obj);
room_instance_add(argument0,192,112,wall_vert_obj);
room_instance_add(argument0,192,144,wall_vert_obj);
room_instance_add(argument0,208,96,wall_hor_obj);
room_instance_add(argument0,224,112,wall_vert_obj);
room_instance_add(argument0,224,144,wall_vert_obj);
// Decor
room_instance_add(argument0,80,144,table_obj);