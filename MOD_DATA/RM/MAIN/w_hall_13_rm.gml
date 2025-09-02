/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Winding Hall 13'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 176;
    global.spawn_arr[1,1] = 208;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 261;
    global.mark_arr[0,1] = 144;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 354;
    global.mark_arr[1,1] = 148;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 382;
    global.mark_arr[2,1] = 236;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 239;
    global.mark_arr[3,1] = 241;
    global.mark_arr[3,2] = 0;
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
")
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
room_instance_add(argument0,304,112,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,336,176,floor_obj);
room_instance_add(argument0,336,144,floor_obj);
room_instance_add(argument0,336,112,floor_obj);
room_instance_add(argument0,368,112,floor_obj);
room_instance_add(argument0,368,144,floor_obj);
room_instance_add(argument0,368,176,floor_obj);
room_instance_add(argument0,400,144,floor_obj);
room_instance_add(argument0,432,144,floor_obj);
room_instance_add(argument0,432,176,floor_obj);
room_instance_add(argument0,432,208,floor_obj);
room_instance_add(argument0,432,240,floor_obj);
room_instance_add(argument0,400,240,floor_obj);
room_instance_add(argument0,368,240,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
room_instance_add(argument0,336,272,floor_obj);
room_instance_add(argument0,336,304,floor_obj);
room_instance_add(argument0,304,304,floor_obj);
room_instance_add(argument0,272,304,floor_obj);
room_instance_add(argument0,272,272,floor_obj);
room_instance_add(argument0,272,240,floor_obj);
room_instance_add(argument0,240,240,floor_obj);
room_instance_add(argument0,208,240,floor_obj);
room_instance_add(argument0,176,240,floor_obj);
room_instance_add(argument0,176,208,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,208,144,ceil_obj);
room_instance_add(argument0,240,144,ceil_obj);
room_instance_add(argument0,272,144,ceil_obj);
room_instance_add(argument0,304,112,ceil_obj);
room_instance_add(argument0,304,144,ceil_obj);
room_instance_add(argument0,304,176,ceil_obj);
room_instance_add(argument0,336,176,ceil_obj);
room_instance_add(argument0,336,144,ceil_obj);
room_instance_add(argument0,336,112,ceil_obj);
room_instance_add(argument0,368,112,ceil_obj);
room_instance_add(argument0,368,144,ceil_obj);
room_instance_add(argument0,368,176,ceil_obj);
room_instance_add(argument0,400,144,ceil_obj);
room_instance_add(argument0,432,144,ceil_obj);
room_instance_add(argument0,432,176,ceil_obj);
room_instance_add(argument0,432,208,ceil_obj);
room_instance_add(argument0,432,240,ceil_obj);
room_instance_add(argument0,400,240,ceil_obj);
room_instance_add(argument0,368,240,ceil_obj);
room_instance_add(argument0,336,240,ceil_obj);
room_instance_add(argument0,336,272,ceil_obj);
room_instance_add(argument0,336,304,ceil_obj);
room_instance_add(argument0,304,304,ceil_obj);
room_instance_add(argument0,272,304,ceil_obj);
room_instance_add(argument0,272,272,ceil_obj);
room_instance_add(argument0,272,240,ceil_obj);
room_instance_add(argument0,240,240,ceil_obj);
room_instance_add(argument0,208,240,ceil_obj);
room_instance_add(argument0,176,240,ceil_obj);
room_instance_add(argument0,176,208,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,128,wall_hor_obj);
room_instance_add(argument0,176,160,wall_hor_obj);
room_instance_add(argument0,208,128,wall_hor_obj);
room_instance_add(argument0,240,128,wall_hor_obj);
room_instance_add(argument0,272,128,wall_hor_obj);
room_instance_add(argument0,304,176,wall_hor_obj);
room_instance_add(argument0,336,176,wall_hor_obj);
room_instance_add(argument0,368,176,wall_hor_obj);
room_instance_add(argument0,368,112,wall_hor_obj);
room_instance_add(argument0,336,112,wall_hor_obj);
room_instance_add(argument0,304,112,wall_hor_obj);
room_instance_add(argument0,400,128,wall_hor_obj);
room_instance_add(argument0,432,128,wall_hor_obj);
room_instance_add(argument0,400,160,wall_hor_obj);
room_instance_add(argument0,432,256,wall_hor_obj);
room_instance_add(argument0,400,224,wall_hor_obj);
room_instance_add(argument0,368,224,wall_hor_obj);
room_instance_add(argument0,336,224,wall_hor_obj);
room_instance_add(argument0,336,320,wall_hor_obj);
room_instance_add(argument0,304,288,wall_hor_obj);
room_instance_add(argument0,304,320,wall_hor_obj);
room_instance_add(argument0,272,320,wall_hor_obj);
room_instance_add(argument0,272,224,wall_hor_obj);
room_instance_add(argument0,368,256,wall_hor_obj);
room_instance_add(argument0,400,256,wall_hor_obj);
room_instance_add(argument0,240,224,wall_hor_obj);
room_instance_add(argument0,208,224,wall_hor_obj);
room_instance_add(argument0,176,192,wall_hor_obj);
room_instance_add(argument0,176,256,wall_hor_obj);
room_instance_add(argument0,208,256,wall_hor_obj);
room_instance_add(argument0,240,256,wall_hor_obj);
room_instance_add(argument0,208,160,wall_hor_obj);
room_instance_add(argument0,240,160,wall_hor_obj);
room_instance_add(argument0,272,160,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,160,208,wall_vert_obj);
room_instance_add(argument0,192,208,wall_vert_obj);
room_instance_add(argument0,160,240,wall_vert_obj);
room_instance_add(argument0,288,240,wall_vert_obj);
room_instance_add(argument0,288,272,wall_vert_obj);
room_instance_add(argument0,256,272,wall_vert_obj);
room_instance_add(argument0,256,304,wall_vert_obj);
room_instance_add(argument0,352,304,wall_vert_obj);
room_instance_add(argument0,352,272,wall_vert_obj);
room_instance_add(argument0,320,272,wall_vert_obj);
room_instance_add(argument0,320,240,wall_vert_obj);
room_instance_add(argument0,448,240,wall_vert_obj);
room_instance_add(argument0,448,208,wall_vert_obj);
room_instance_add(argument0,416,208,wall_vert_obj);
room_instance_add(argument0,416,176,wall_vert_obj);
room_instance_add(argument0,448,176,wall_vert_obj);
room_instance_add(argument0,448,144,wall_vert_obj);
room_instance_add(argument0,384,176,wall_vert_obj);
room_instance_add(argument0,288,176,wall_vert_obj);
room_instance_add(argument0,288,112,wall_vert_obj);
room_instance_add(argument0,384,112,wall_vert_obj);
// Torches
// Furniture
// Not yet
/*room_instance_add(argument0,416,160,random_scare_mark1);*/