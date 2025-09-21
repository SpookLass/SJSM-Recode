/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'SC Hall 4'
    // Spawn
    global.spawn_len_var = 4;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 304;
    global.spawn_arr[1,1] = 448;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 560;
    global.spawn_arr[2,1] = 160;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    global.spawn_arr[3,0] = 624;
    global.spawn_arr[3,1] = 288;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 180;
    // Mark
    global.mark_len_var = 0;
    /*global.mark_arr[0,0] = 222;
    global.mark_arr[0,1] = 143;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 240;
    global.mark_arr[1,1] = 193;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 301;
    global.mark_arr[2,1] = 209;
    global.mark_arr[2,2] = 0;*/
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
room_instance_add(argument0,560,288,floor_obj);
room_instance_add(argument0,592,288,floor_obj);
room_instance_add(argument0,624,288,floor_obj);
room_instance_add(argument0,336,384,floor_obj);
room_instance_add(argument0,336,352,floor_obj);
room_instance_add(argument0,336,320,floor_obj);
room_instance_add(argument0,528,256,floor_obj);
room_instance_add(argument0,528,224,floor_obj);
room_instance_add(argument0,560,224,floor_obj);
room_instance_add(argument0,560,192,floor_obj);
room_instance_add(argument0,560,160,floor_obj);
room_instance_add(argument0,304,384,floor_obj);
room_instance_add(argument0,304,416,floor_obj);
room_instance_add(argument0,304,448,floor_obj);
// Ceilings
room_instance_add(argument0,336,384,ceil_obj);
room_instance_add(argument0,336,352,ceil_obj);
room_instance_add(argument0,336,320,ceil_obj);
room_instance_add(argument0,528,256,ceil_obj);
room_instance_add(argument0,528,224,ceil_obj);
room_instance_add(argument0,560,224,ceil_obj);
room_instance_add(argument0,560,192,ceil_obj);
room_instance_add(argument0,560,160,ceil_obj);
room_instance_add(argument0,304,384,ceil_obj);
room_instance_add(argument0,304,416,ceil_obj);
room_instance_add(argument0,304,448,ceil_obj);
room_instance_add(argument0,112,288,ceil_2high_obj);
room_instance_add(argument0,144,288,ceil_2high_obj);
room_instance_add(argument0,176,288,ceil_2high_obj);
room_instance_add(argument0,208,288,ceil_2high_obj);
room_instance_add(argument0,240,288,ceil_2high_obj);
room_instance_add(argument0,272,288,ceil_2high_obj);
room_instance_add(argument0,304,288,ceil_2high_obj);
room_instance_add(argument0,336,288,ceil_2high_obj);
room_instance_add(argument0,368,288,ceil_2high_obj);
room_instance_add(argument0,400,288,ceil_2high_obj);
room_instance_add(argument0,432,288,ceil_2high_obj);
room_instance_add(argument0,464,288,ceil_2high_obj);
room_instance_add(argument0,496,288,ceil_2high_obj);
room_instance_add(argument0,528,288,ceil_2high_obj);
room_instance_add(argument0,560,288,ceil_2high_obj);
room_instance_add(argument0,592,288,ceil_2high_obj);
room_instance_add(argument0,624,288,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,336,400,wall_hor_obj);
room_instance_add(argument0,304,368,wall_hor_obj);
room_instance_add(argument0,304,464,wall_hor_obj);
room_instance_add(argument0,560,240,wall_hor_obj);
room_instance_add(argument0,528,208,wall_hor_obj);
room_instance_add(argument0,560,144,wall_hor_obj);
room_instance_add(argument0,112,304,wall_2high_hor_obj);
room_instance_add(argument0,112,272,wall_2high_hor_obj);
room_instance_add(argument0,144,272,wall_2high_hor_obj);
room_instance_add(argument0,624,272,wall_2high_hor_obj);
room_instance_add(argument0,624,304,wall_2high_hor_obj);
room_instance_add(argument0,592,272,wall_2high_hor_obj);
room_instance_add(argument0,560,272,wall_2high_hor_obj);
room_instance_add(argument0,496,272,wall_2high_hor_obj);
room_instance_add(argument0,528,304,wall_2high_hor_obj);
room_instance_add(argument0,560,304,wall_2high_hor_obj);
room_instance_add(argument0,592,304,wall_2high_hor_obj);
room_instance_add(argument0,496,304,wall_2high_hor_obj);
room_instance_add(argument0,464,304,wall_2high_hor_obj);
room_instance_add(argument0,464,272,wall_2high_hor_obj);
room_instance_add(argument0,432,272,wall_2high_hor_obj);
room_instance_add(argument0,400,272,wall_2high_hor_obj);
room_instance_add(argument0,368,272,wall_2high_hor_obj);
room_instance_add(argument0,336,272,wall_2high_hor_obj);
room_instance_add(argument0,304,272,wall_2high_hor_obj);
room_instance_add(argument0,272,272,wall_2high_hor_obj);
room_instance_add(argument0,304,304,wall_2high_hor_obj);
room_instance_add(argument0,272,304,wall_2high_hor_obj);
room_instance_add(argument0,240,304,wall_2high_hor_obj);
room_instance_add(argument0,208,304,wall_2high_hor_obj);
room_instance_add(argument0,176,304,wall_2high_hor_obj);
room_instance_add(argument0,144,304,wall_2high_hor_obj);
room_instance_add(argument0,176,272,wall_2high_hor_obj);
room_instance_add(argument0,208,272,wall_2high_hor_obj);
room_instance_add(argument0,240,272,wall_2high_hor_obj);
room_instance_add(argument0,368,304,wall_2high_hor_obj);
room_instance_add(argument0,400,304,wall_2high_hor_obj);
room_instance_add(argument0,432,304,wall_2high_hor_obj);
room_instance_add(argument0,528,272,wall_doorway_hor_obj);
room_instance_add(argument0,336,304,wall_doorway_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,320,320,wall_vert_obj);
room_instance_add(argument0,320,352,wall_vert_obj);
room_instance_add(argument0,288,384,wall_vert_obj);
room_instance_add(argument0,352,384,wall_vert_obj);
room_instance_add(argument0,352,352,wall_vert_obj);
room_instance_add(argument0,352,320,wall_vert_obj);
room_instance_add(argument0,512,256,wall_vert_obj);
room_instance_add(argument0,512,224,wall_vert_obj);
room_instance_add(argument0,544,256,wall_vert_obj);
room_instance_add(argument0,544,192,wall_vert_obj);
room_instance_add(argument0,544,160,wall_vert_obj);
room_instance_add(argument0,576,160,wall_vert_obj);
room_instance_add(argument0,576,192,wall_vert_obj);
room_instance_add(argument0,576,224,wall_vert_obj);
room_instance_add(argument0,320,416,wall_vert_obj);
room_instance_add(argument0,320,448,wall_vert_obj);
room_instance_add(argument0,288,448,wall_vert_obj);
room_instance_add(argument0,288,416,wall_vert_obj);
room_instance_add(argument0,96,288,wall_2high_vert_obj);
room_instance_add(argument0,640,288,wall_2high_vert_obj);
// Torches
// Props
room_instance_add(argument0,624,288,bar_vert_obj);
// Not Yet