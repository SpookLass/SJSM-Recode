/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'SC Hall 12'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 752;
    global.spawn_arr[1,1] = 288;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 361;
    global.mark_arr[0,1] = 289;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 609;
    global.mark_arr[1,1] = 315;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 699;
    global.mark_arr[2,1] = 292;
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
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,112,288,floor_obj);
room_instance_add(argument0,144,288,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,208,288,floor_obj);
room_instance_add(argument0,240,288,floor_obj);
room_instance_add(argument0,272,288,floor_obj);
room_instance_add(argument0,304,288,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,368,288,floor_obj);
room_instance_add(argument0,400,288,floor_obj);
room_instance_add(argument0,432,288,floor_obj);
room_instance_add(argument0,464,288,floor_obj);
room_instance_add(argument0,496,288,floor_obj);
room_instance_add(argument0,528,288,floor_obj);
room_instance_add(argument0,528,320,floor_obj);
room_instance_add(argument0,528,256,floor_obj);
room_instance_add(argument0,560,256,floor_obj);
room_instance_add(argument0,560,320,floor_obj);
room_instance_add(argument0,592,320,floor_obj);
room_instance_add(argument0,592,256,floor_obj);
room_instance_add(argument0,624,320,floor_obj);
room_instance_add(argument0,624,256,floor_obj);
room_instance_add(argument0,656,256,floor_obj);
room_instance_add(argument0,656,320,floor_obj);
room_instance_add(argument0,688,320,floor_obj);
room_instance_add(argument0,688,256,floor_obj);
room_instance_add(argument0,688,288,floor_obj);
room_instance_add(argument0,720,288,floor_obj);
room_instance_add(argument0,752,288,floor_obj);
// Ceilings
room_instance_add(argument0,112,288,ceil_low_obj);
room_instance_add(argument0,144,288,ceil_low_obj);
room_instance_add(argument0,176,288,ceil_low_obj);
room_instance_add(argument0,208,288,ceil_low_obj);
room_instance_add(argument0,240,288,ceil_low_obj);
room_instance_add(argument0,272,288,ceil_low_obj);
room_instance_add(argument0,304,288,ceil_low_obj);
room_instance_add(argument0,336,288,ceil_low_obj);
room_instance_add(argument0,368,288,ceil_low_obj);
room_instance_add(argument0,400,288,ceil_low_obj);
room_instance_add(argument0,432,288,ceil_low_obj);
room_instance_add(argument0,464,288,ceil_low_obj);
room_instance_add(argument0,496,288,ceil_low_obj);
room_instance_add(argument0,528,288,ceil_low_obj);
room_instance_add(argument0,528,320,ceil_low_obj);
room_instance_add(argument0,528,256,ceil_low_obj);
room_instance_add(argument0,560,256,ceil_low_obj);
room_instance_add(argument0,560,320,ceil_low_obj);
room_instance_add(argument0,592,320,ceil_low_obj);
room_instance_add(argument0,592,256,ceil_low_obj);
room_instance_add(argument0,624,320,ceil_low_obj);
room_instance_add(argument0,624,256,ceil_low_obj);
room_instance_add(argument0,656,256,ceil_low_obj);
room_instance_add(argument0,656,320,ceil_low_obj);
room_instance_add(argument0,688,320,ceil_low_obj);
room_instance_add(argument0,688,256,ceil_low_obj);
room_instance_add(argument0,688,288,ceil_low_obj);
room_instance_add(argument0,720,288,ceil_low_obj);
room_instance_add(argument0,752,288,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,272,wall_hor_obj);
room_instance_add(argument0,112,304,wall_hor_obj);
room_instance_add(argument0,144,272,wall_hor_obj);
room_instance_add(argument0,144,304,wall_hor_obj);
room_instance_add(argument0,496,272,wall_hor_obj);
room_instance_add(argument0,496,304,wall_hor_obj);
room_instance_add(argument0,560,304,wall_hor_obj);
room_instance_add(argument0,592,304,wall_hor_obj);
room_instance_add(argument0,560,272,wall_hor_obj);
room_instance_add(argument0,592,272,wall_hor_obj);
room_instance_add(argument0,624,272,wall_hor_obj);
room_instance_add(argument0,656,272,wall_hor_obj);
room_instance_add(argument0,656,304,wall_hor_obj);
room_instance_add(argument0,624,304,wall_hor_obj);
room_instance_add(argument0,720,272,wall_hor_obj);
room_instance_add(argument0,752,272,wall_hor_obj);
room_instance_add(argument0,752,304,wall_hor_obj);
room_instance_add(argument0,720,304,wall_hor_obj);
room_instance_add(argument0,464,272,wall_hor_obj);
room_instance_add(argument0,176,304,wall_hor_obj);
room_instance_add(argument0,208,304,wall_hor_obj);
room_instance_add(argument0,240,304,wall_hor_obj);
room_instance_add(argument0,272,304,wall_hor_obj);
room_instance_add(argument0,304,304,wall_hor_obj);
room_instance_add(argument0,336,304,wall_hor_obj);
room_instance_add(argument0,368,304,wall_hor_obj);
room_instance_add(argument0,400,304,wall_hor_obj);
room_instance_add(argument0,432,304,wall_hor_obj);
room_instance_add(argument0,464,304,wall_hor_obj);
room_instance_add(argument0,432,272,wall_hor_obj);
room_instance_add(argument0,400,272,wall_hor_obj);
room_instance_add(argument0,368,272,wall_hor_obj);
room_instance_add(argument0,336,272,wall_hor_obj);
room_instance_add(argument0,304,272,wall_hor_obj);
room_instance_add(argument0,272,272,wall_hor_obj);
room_instance_add(argument0,240,272,wall_hor_obj);
room_instance_add(argument0,208,272,wall_hor_obj);
room_instance_add(argument0,176,272,wall_hor_obj);
room_instance_add(argument0,528,248,wall_hor_obj);
room_instance_add(argument0,560,248,wall_hor_obj);
room_instance_add(argument0,592,248,wall_hor_obj);
room_instance_add(argument0,624,248,wall_hor_obj);
room_instance_add(argument0,656,248,wall_hor_obj);
room_instance_add(argument0,688,248,wall_hor_obj);
room_instance_add(argument0,688,328,wall_hor_obj);
room_instance_add(argument0,656,328,wall_hor_obj);
room_instance_add(argument0,624,328,wall_hor_obj);
room_instance_add(argument0,592,328,wall_hor_obj);
room_instance_add(argument0,560,328,wall_hor_obj);
room_instance_add(argument0,528,328,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,288,wall_vert_obj);
room_instance_add(argument0,512,320,wall_vert_obj);
room_instance_add(argument0,512,256,wall_vert_obj);
room_instance_add(argument0,704,256,wall_vert_obj);
room_instance_add(argument0,704,320,wall_vert_obj);
room_instance_add(argument0,768,288,wall_vert_obj);
room_instance_add(argument0,544,288,wall_vert_obj);
room_instance_add(argument0,672,288,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,400,352,bar_vert_obj);
// Not Yet