/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Winding Hall 14'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 304;
    global.spawn_arr[1,1] = 144;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
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
room_instance_add(argument0,0,0,color_control_02_obj);
// Floors
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,112,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,272,112,floor_obj);
room_instance_add(argument0,272,80,floor_obj);
room_instance_add(argument0,304,80,floor_obj);
room_instance_add(argument0,336,80,floor_obj);
room_instance_add(argument0,336,112,floor_obj);
room_instance_add(argument0,368,112,floor_obj);
room_instance_add(argument0,368,144,floor_obj);
room_instance_add(argument0,400,144,floor_obj);
room_instance_add(argument0,400,176,floor_obj);
room_instance_add(argument0,400,208,floor_obj);
room_instance_add(argument0,368,208,floor_obj);
room_instance_add(argument0,368,240,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
room_instance_add(argument0,336,272,floor_obj);
room_instance_add(argument0,304,272,floor_obj);
room_instance_add(argument0,272,272,floor_obj);
room_instance_add(argument0,272,240,floor_obj);
room_instance_add(argument0,272,208,floor_obj);
room_instance_add(argument0,304,208,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,208,144,ceil_obj);
room_instance_add(argument0,240,112,ceil_obj);
room_instance_add(argument0,240,144,ceil_obj);
room_instance_add(argument0,272,112,ceil_obj);
room_instance_add(argument0,272,80,ceil_obj);
room_instance_add(argument0,304,80,ceil_obj);
room_instance_add(argument0,336,80,ceil_obj);
room_instance_add(argument0,336,112,ceil_obj);
room_instance_add(argument0,368,112,ceil_obj);
room_instance_add(argument0,368,144,ceil_obj);
room_instance_add(argument0,400,144,ceil_obj);
room_instance_add(argument0,400,176,ceil_obj);
room_instance_add(argument0,400,208,ceil_obj);
room_instance_add(argument0,368,208,ceil_obj);
room_instance_add(argument0,368,240,ceil_obj);
room_instance_add(argument0,336,240,ceil_obj);
room_instance_add(argument0,336,272,ceil_obj);
room_instance_add(argument0,304,272,ceil_obj);
room_instance_add(argument0,272,272,ceil_obj);
room_instance_add(argument0,272,240,ceil_obj);
room_instance_add(argument0,272,208,ceil_obj);
room_instance_add(argument0,304,208,ceil_obj);
room_instance_add(argument0,304,176,ceil_obj);
room_instance_add(argument0,304,144,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,128,wall_hor_obj);
room_instance_add(argument0,176,160,wall_hor_obj);
room_instance_add(argument0,208,160,wall_hor_obj);
room_instance_add(argument0,240,160,wall_hor_obj);
room_instance_add(argument0,208,128,wall_hor_obj);
room_instance_add(argument0,240,96,wall_hor_obj);
room_instance_add(argument0,304,128,wall_hor_obj);
room_instance_add(argument0,304,224,wall_hor_obj);
room_instance_add(argument0,272,192,wall_hor_obj);
room_instance_add(argument0,336,224,wall_hor_obj);
room_instance_add(argument0,336,288,wall_hor_obj);
room_instance_add(argument0,304,288,wall_hor_obj);
room_instance_add(argument0,272,288,wall_hor_obj);
room_instance_add(argument0,304,256,wall_hor_obj);
room_instance_add(argument0,368,256,wall_hor_obj);
room_instance_add(argument0,368,192,wall_hor_obj);
room_instance_add(argument0,400,224,wall_hor_obj);
room_instance_add(argument0,400,128,wall_hor_obj);
room_instance_add(argument0,368,160,wall_hor_obj);
room_instance_add(argument0,336,128,wall_hor_obj);
room_instance_add(argument0,368,96,wall_hor_obj);
room_instance_add(argument0,336,64,wall_hor_obj);
room_instance_add(argument0,304,96,wall_hor_obj);
room_instance_add(argument0,272,64,wall_hor_obj);
room_instance_add(argument0,304,64,wall_hor_obj);
room_instance_add(argument0,272,128,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,256,144,wall_vert_obj);
room_instance_add(argument0,224,112,wall_vert_obj);
room_instance_add(argument0,288,112,wall_vert_obj);
room_instance_add(argument0,256,80,wall_vert_obj);
room_instance_add(argument0,352,80,wall_vert_obj);
room_instance_add(argument0,320,112,wall_vert_obj);
room_instance_add(argument0,384,112,wall_vert_obj);
room_instance_add(argument0,352,144,wall_vert_obj);
room_instance_add(argument0,416,144,wall_vert_obj);
room_instance_add(argument0,384,176,wall_vert_obj);
room_instance_add(argument0,416,176,wall_vert_obj);
room_instance_add(argument0,416,208,wall_vert_obj);
room_instance_add(argument0,352,208,wall_vert_obj);
room_instance_add(argument0,384,240,wall_vert_obj);
room_instance_add(argument0,320,240,wall_vert_obj);
room_instance_add(argument0,352,272,wall_vert_obj);
room_instance_add(argument0,256,272,wall_vert_obj);
room_instance_add(argument0,288,240,wall_vert_obj);
room_instance_add(argument0,256,240,wall_vert_obj);
room_instance_add(argument0,256,208,wall_vert_obj);
room_instance_add(argument0,320,208,wall_vert_obj);
room_instance_add(argument0,320,176,wall_vert_obj);
room_instance_add(argument0,320,144,wall_vert_obj);
room_instance_add(argument0,288,144,wall_vert_obj);
room_instance_add(argument0,288,176,wall_vert_obj);
// Lights?
room_instance_add(argument0,304,176,light_floor_obj);
room_instance_add(argument0,304,208,light_floor_obj);
room_instance_add(argument0,272,208,light_floor_obj);
room_instance_add(argument0,272,240,light_floor_obj);
room_instance_add(argument0,304,144,light_floor_obj);
// Not yet
/*room_instance_add(argument0,416,160,random_scare_mark1);*/