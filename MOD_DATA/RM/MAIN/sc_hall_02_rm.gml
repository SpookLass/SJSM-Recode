/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'SC Hall 2'
    // Spawn
    global.spawn_len_var = 5;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 432;
    global.spawn_arr[1,1] = 576;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    global.spawn_arr[2,0] = 496;
    global.spawn_arr[2,1] = 576;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 90;
    global.spawn_arr[3,0] = 432;
    global.spawn_arr[3,1] = 512;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 270;
    global.spawn_arr[4,0] = 496;
    global.spawn_arr[4,1] = 512;
    global.spawn_arr[4,2] = 0;
    global.spawn_arr[4,3] = 270;
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
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,112,288,floor_obj);
room_instance_add(argument0,144,288,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,208,288,floor_obj);
room_instance_add(argument0,240,288,floor_obj);
room_instance_add(argument0,240,320,floor_obj);
room_instance_add(argument0,240,352,floor_obj);
room_instance_add(argument0,240,384,floor_obj);
room_instance_add(argument0,240,416,floor_obj);
room_instance_add(argument0,240,448,floor_obj);
room_instance_add(argument0,240,480,floor_obj);
room_instance_add(argument0,240,512,floor_obj);
room_instance_add(argument0,240,544,floor_obj);
room_instance_add(argument0,272,544,floor_obj);
room_instance_add(argument0,304,544,floor_obj);
room_instance_add(argument0,336,544,floor_obj);
room_instance_add(argument0,368,544,floor_obj);
room_instance_add(argument0,400,544,floor_obj);
room_instance_add(argument0,432,544,floor_obj);
room_instance_add(argument0,432,512,floor_obj);
room_instance_add(argument0,464,544,floor_obj);
room_instance_add(argument0,496,544,floor_obj);
room_instance_add(argument0,496,512,floor_obj);
room_instance_add(argument0,432,576,floor_obj);
room_instance_add(argument0,496,576,floor_obj);
// Ceilings
room_instance_add(argument0,112,288,ceil_2high_obj);
room_instance_add(argument0,144,288,ceil_2high_obj);
room_instance_add(argument0,176,288,ceil_2high_obj);
room_instance_add(argument0,208,288,ceil_2high_obj);
room_instance_add(argument0,240,288,ceil_2high_obj);
room_instance_add(argument0,240,320,ceil_2high_obj);
room_instance_add(argument0,240,352,ceil_2high_obj);
room_instance_add(argument0,240,384,ceil_2high_obj);
room_instance_add(argument0,240,416,ceil_2high_obj);
room_instance_add(argument0,240,448,ceil_2high_obj);
room_instance_add(argument0,240,480,ceil_2high_obj);
room_instance_add(argument0,240,512,ceil_2high_obj);
room_instance_add(argument0,240,544,ceil_2high_obj);
room_instance_add(argument0,272,544,ceil_2high_obj);
room_instance_add(argument0,304,544,ceil_2high_obj);
room_instance_add(argument0,336,544,ceil_2high_obj);
room_instance_add(argument0,368,544,ceil_2high_obj);
room_instance_add(argument0,400,544,ceil_2high_obj);
room_instance_add(argument0,432,544,ceil_2high_obj);
room_instance_add(argument0,432,512,ceil_2high_obj);
room_instance_add(argument0,464,544,ceil_2high_obj);
room_instance_add(argument0,496,544,ceil_2high_obj);
room_instance_add(argument0,496,512,ceil_2high_obj);
room_instance_add(argument0,432,576,ceil_2high_obj);
room_instance_add(argument0,496,576,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,304,wall_2high_hor_obj);
room_instance_add(argument0,112,272,wall_2high_hor_obj);
room_instance_add(argument0,144,272,wall_2high_hor_obj);
room_instance_add(argument0,176,272,wall_2high_hor_obj);
room_instance_add(argument0,208,272,wall_2high_hor_obj);
room_instance_add(argument0,208,304,wall_2high_hor_obj);
room_instance_add(argument0,176,304,wall_2high_hor_obj);
room_instance_add(argument0,144,304,wall_2high_hor_obj);
room_instance_add(argument0,240,272,wall_2high_hor_obj);
room_instance_add(argument0,272,528,wall_2high_hor_obj);
room_instance_add(argument0,464,528,wall_2high_hor_obj);
room_instance_add(argument0,432,496,wall_2high_hor_obj);
room_instance_add(argument0,496,496,wall_2high_hor_obj);
room_instance_add(argument0,496,592,wall_2high_hor_obj);
room_instance_add(argument0,432,592,wall_2high_hor_obj);
room_instance_add(argument0,464,560,wall_2high_hor_obj);
room_instance_add(argument0,400,560,wall_2high_hor_obj);
room_instance_add(argument0,368,560,wall_2high_hor_obj);
room_instance_add(argument0,336,560,wall_2high_hor_obj);
room_instance_add(argument0,240,560,wall_2high_hor_obj);
room_instance_add(argument0,272,560,wall_2high_hor_obj);
room_instance_add(argument0,304,560,wall_2high_hor_obj);
room_instance_add(argument0,304,528,wall_2high_hor_obj);
room_instance_add(argument0,336,528,wall_2high_hor_obj);
room_instance_add(argument0,368,528,wall_2high_hor_obj);
room_instance_add(argument0,400,528,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,288,wall_2high_vert_obj);
room_instance_add(argument0,512,512,wall_2high_vert_obj);
room_instance_add(argument0,512,544,wall_2high_vert_obj);
room_instance_add(argument0,512,576,wall_2high_vert_obj);
room_instance_add(argument0,480,576,wall_2high_vert_obj);
room_instance_add(argument0,480,512,wall_2high_vert_obj);
room_instance_add(argument0,416,512,wall_2high_vert_obj);
room_instance_add(argument0,448,512,wall_2high_vert_obj);
room_instance_add(argument0,448,576,wall_2high_vert_obj);
room_instance_add(argument0,416,576,wall_2high_vert_obj);
room_instance_add(argument0,256,512,wall_2high_vert_obj);
room_instance_add(argument0,256,480,wall_2high_vert_obj);
room_instance_add(argument0,256,448,wall_2high_vert_obj);
room_instance_add(argument0,256,416,wall_2high_vert_obj);
room_instance_add(argument0,256,384,wall_2high_vert_obj);
room_instance_add(argument0,256,352,wall_2high_vert_obj);
room_instance_add(argument0,256,320,wall_2high_vert_obj);
room_instance_add(argument0,256,288,wall_2high_vert_obj);
room_instance_add(argument0,224,320,wall_2high_vert_obj);
room_instance_add(argument0,224,352,wall_2high_vert_obj);
room_instance_add(argument0,224,384,wall_2high_vert_obj);
room_instance_add(argument0,224,416,wall_2high_vert_obj);
room_instance_add(argument0,224,448,wall_2high_vert_obj);
room_instance_add(argument0,224,480,wall_2high_vert_obj);
room_instance_add(argument0,224,512,wall_2high_vert_obj);
room_instance_add(argument0,224,544,wall_2high_vert_obj);
// Torches
// Props
room_instance_add(argument0,432,520,bar_hor_obj);
room_instance_add(argument0,496,568,bar_hor_obj);
room_instance_add(argument0,432,568,bar_hor_obj);
// Not Yet
//room_instance_add(argument0,272,560,random_scare_mark1);