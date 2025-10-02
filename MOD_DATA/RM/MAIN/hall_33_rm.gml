/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Hall 33'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 624;
    global.spawn_arr[1,1] = 592;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 190;
    global.mark_arr[0,1] = 458;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 243;
    global.mark_arr[1,1] = 520;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 361;
    global.mark_arr[2,1] = 590;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 513;
    global.mark_arr[3,1] = 591;
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
room_instance_add(argument0,112,464,floor_obj);
room_instance_add(argument0,144,464,floor_obj);
room_instance_add(argument0,176,464,floor_obj);
room_instance_add(argument0,208,464,floor_obj);
room_instance_add(argument0,240,464,floor_obj);
room_instance_add(argument0,240,496,floor_obj);
room_instance_add(argument0,240,528,floor_obj);
room_instance_add(argument0,240,560,floor_obj);
room_instance_add(argument0,240,592,floor_obj);
room_instance_add(argument0,272,592,floor_obj);
room_instance_add(argument0,304,592,floor_obj);
room_instance_add(argument0,336,592,floor_obj);
room_instance_add(argument0,368,592,floor_obj);
room_instance_add(argument0,400,592,floor_obj);
room_instance_add(argument0,432,592,floor_obj);
room_instance_add(argument0,464,592,floor_obj);
room_instance_add(argument0,496,592,floor_obj);
room_instance_add(argument0,528,592,floor_obj);
room_instance_add(argument0,560,592,floor_obj);
room_instance_add(argument0,592,592,floor_obj);
room_instance_add(argument0,624,592,floor_obj);
// Ceilings
room_instance_add(argument0,112,464,ceil_obj);
room_instance_add(argument0,144,464,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
room_instance_add(argument0,208,464,ceil_obj);
room_instance_add(argument0,240,464,ceil_obj);
room_instance_add(argument0,240,496,ceil_obj);
room_instance_add(argument0,240,528,ceil_obj);
room_instance_add(argument0,240,560,ceil_obj);
room_instance_add(argument0,240,592,ceil_obj);
room_instance_add(argument0,272,592,ceil_obj);
room_instance_add(argument0,304,592,ceil_obj);
room_instance_add(argument0,336,592,ceil_obj);
room_instance_add(argument0,368,592,ceil_obj);
room_instance_add(argument0,400,592,ceil_obj);
room_instance_add(argument0,432,592,ceil_obj);
room_instance_add(argument0,464,592,ceil_obj);
room_instance_add(argument0,496,592,ceil_obj);
room_instance_add(argument0,528,592,ceil_obj);
room_instance_add(argument0,560,592,ceil_obj);
room_instance_add(argument0,592,592,ceil_obj);
room_instance_add(argument0,624,592,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,448,wall_hor_obj);
room_instance_add(argument0,144,448,wall_hor_obj);
room_instance_add(argument0,144,480,wall_hor_obj);
room_instance_add(argument0,112,480,wall_hor_obj);
room_instance_add(argument0,176,448,wall_hor_obj);
room_instance_add(argument0,176,480,wall_hor_obj);
room_instance_add(argument0,208,448,wall_hor_obj);
room_instance_add(argument0,208,480,wall_hor_obj);
room_instance_add(argument0,240,448,wall_hor_obj);
room_instance_add(argument0,272,576,wall_hor_obj);
room_instance_add(argument0,272,608,wall_hor_obj);
room_instance_add(argument0,240,608,wall_hor_obj);
room_instance_add(argument0,624,576,wall_hor_obj);
room_instance_add(argument0,624,608,wall_hor_obj);
room_instance_add(argument0,592,576,wall_hor_obj);
room_instance_add(argument0,560,576,wall_hor_obj);
room_instance_add(argument0,528,576,wall_hor_obj);
room_instance_add(argument0,496,576,wall_hor_obj);
room_instance_add(argument0,464,576,wall_hor_obj);
room_instance_add(argument0,432,576,wall_hor_obj);
room_instance_add(argument0,400,576,wall_hor_obj);
room_instance_add(argument0,368,576,wall_hor_obj);
room_instance_add(argument0,336,576,wall_hor_obj);
room_instance_add(argument0,304,576,wall_hor_obj);
room_instance_add(argument0,304,608,wall_hor_obj);
room_instance_add(argument0,336,608,wall_hor_obj);
room_instance_add(argument0,368,608,wall_hor_obj);
room_instance_add(argument0,400,608,wall_hor_obj);
room_instance_add(argument0,432,608,wall_hor_obj);
room_instance_add(argument0,464,608,wall_hor_obj);
room_instance_add(argument0,496,608,wall_hor_obj);
room_instance_add(argument0,528,608,wall_hor_obj);
room_instance_add(argument0,560,608,wall_hor_obj);
room_instance_add(argument0,592,608,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,464,wall_vert_obj);
room_instance_add(argument0,224,496,wall_vert_obj);
room_instance_add(argument0,256,464,wall_vert_obj);
room_instance_add(argument0,256,496,wall_vert_obj);
room_instance_add(argument0,256,528,wall_vert_obj);
room_instance_add(argument0,256,560,wall_vert_obj);
room_instance_add(argument0,224,592,wall_vert_obj);
room_instance_add(argument0,224,560,wall_vert_obj);
room_instance_add(argument0,224,528,wall_vert_obj);
room_instance_add(argument0,640,592,wall_vert_obj);
// Props
room_instance_add(argument0,232,479,web_rand_obj);
room_instance_add(argument0,294,583,web_rand_obj);
room_instance_add(argument0,413,583,web_rand_obj);
room_instance_add(argument0,550,594,web_rand_obj);
// Not yet
/*room_instance_add(argument0,264,608,random_scare_mark1);*/