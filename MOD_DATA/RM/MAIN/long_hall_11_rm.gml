/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','long','ROOM_long')+' 11';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 624;
    global.spawn_arr[1,1] = 464;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 5;
    global.mark_arr[0,0] = 205;
    global.mark_arr[0,1] = 470;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 341;
    global.mark_arr[1,1] = 461;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 317;
    global.mark_arr[2,1] = 406;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 406;
    global.mark_arr[3,1] = 339;
    global.mark_arr[3,2] = 0;
    global.mark_arr[4,0] = 545;
    global.mark_arr[4,1] = 466;
    global.mark_arr[4,2] = 0;
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
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,112,464,floor_obj);
room_instance_add(argument0,144,464,floor_obj);
room_instance_add(argument0,176,464,floor_obj);
room_instance_add(argument0,208,464,floor_obj);
room_instance_add(argument0,240,464,floor_obj);
room_instance_add(argument0,272,464,floor_obj);
room_instance_add(argument0,304,464,floor_obj);
room_instance_add(argument0,336,464,floor_obj);
room_instance_add(argument0,368,464,floor_obj);
room_instance_add(argument0,400,464,floor_obj);
room_instance_add(argument0,432,464,floor_obj);
room_instance_add(argument0,432,432,floor_obj);
room_instance_add(argument0,432,400,floor_obj);
room_instance_add(argument0,400,400,floor_obj);
room_instance_add(argument0,368,400,floor_obj);
room_instance_add(argument0,336,400,floor_obj);
room_instance_add(argument0,304,400,floor_obj);
room_instance_add(argument0,272,400,floor_obj);
room_instance_add(argument0,240,400,floor_obj);
room_instance_add(argument0,240,368,floor_obj);
room_instance_add(argument0,240,336,floor_obj);
room_instance_add(argument0,272,336,floor_obj);
room_instance_add(argument0,304,336,floor_obj);
room_instance_add(argument0,336,336,floor_obj);
room_instance_add(argument0,368,336,floor_obj);
room_instance_add(argument0,400,336,floor_obj);
room_instance_add(argument0,432,336,floor_obj);
room_instance_add(argument0,464,336,floor_obj);
room_instance_add(argument0,496,336,floor_obj);
room_instance_add(argument0,496,368,floor_obj);
room_instance_add(argument0,496,400,floor_obj);
room_instance_add(argument0,496,432,floor_obj);
room_instance_add(argument0,496,464,floor_obj);
room_instance_add(argument0,528,464,floor_obj);
room_instance_add(argument0,560,464,floor_obj);
room_instance_add(argument0,592,464,floor_obj);
room_instance_add(argument0,624,464,floor_obj);
// Ceilings
room_instance_add(argument0,112,464,ceil_obj);
room_instance_add(argument0,144,464,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
room_instance_add(argument0,208,464,ceil_obj);
room_instance_add(argument0,240,464,ceil_obj);
room_instance_add(argument0,272,464,ceil_obj);
room_instance_add(argument0,304,464,ceil_obj);
room_instance_add(argument0,336,464,ceil_obj);
room_instance_add(argument0,368,464,ceil_obj);
room_instance_add(argument0,400,464,ceil_obj);
room_instance_add(argument0,432,464,ceil_obj);
room_instance_add(argument0,432,432,ceil_obj);
room_instance_add(argument0,432,400,ceil_obj);
room_instance_add(argument0,400,400,ceil_obj);
room_instance_add(argument0,368,400,ceil_obj);
room_instance_add(argument0,336,400,ceil_obj);
room_instance_add(argument0,304,400,ceil_obj);
room_instance_add(argument0,272,400,ceil_obj);
room_instance_add(argument0,240,400,ceil_obj);
room_instance_add(argument0,240,368,ceil_obj);
room_instance_add(argument0,240,336,ceil_obj);
room_instance_add(argument0,272,336,ceil_obj);
room_instance_add(argument0,304,336,ceil_obj);
room_instance_add(argument0,336,336,ceil_obj);
room_instance_add(argument0,368,336,ceil_obj);
room_instance_add(argument0,400,336,ceil_obj);
room_instance_add(argument0,432,336,ceil_obj);
room_instance_add(argument0,464,336,ceil_obj);
room_instance_add(argument0,496,336,ceil_obj);
room_instance_add(argument0,496,368,ceil_obj);
room_instance_add(argument0,496,400,ceil_obj);
room_instance_add(argument0,496,432,ceil_obj);
room_instance_add(argument0,496,464,ceil_obj);
room_instance_add(argument0,528,464,ceil_obj);
room_instance_add(argument0,560,464,ceil_obj);
room_instance_add(argument0,592,464,ceil_obj);
room_instance_add(argument0,624,464,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,448,wall_hor_obj);
room_instance_add(argument0,112,480,wall_hor_obj);
room_instance_add(argument0,144,448,wall_hor_obj);
room_instance_add(argument0,400,448,wall_hor_obj);
room_instance_add(argument0,368,448,wall_hor_obj);
room_instance_add(argument0,336,448,wall_hor_obj);
room_instance_add(argument0,304,448,wall_hor_obj);
room_instance_add(argument0,272,448,wall_hor_obj);
room_instance_add(argument0,240,448,wall_hor_obj);
room_instance_add(argument0,208,448,wall_hor_obj);
room_instance_add(argument0,176,448,wall_hor_obj);
room_instance_add(argument0,144,480,wall_hor_obj);
room_instance_add(argument0,176,480,wall_hor_obj);
room_instance_add(argument0,208,480,wall_hor_obj);
room_instance_add(argument0,240,480,wall_hor_obj);
room_instance_add(argument0,272,480,wall_hor_obj);
room_instance_add(argument0,304,480,wall_hor_obj);
room_instance_add(argument0,336,480,wall_hor_obj);
room_instance_add(argument0,368,480,wall_hor_obj);
room_instance_add(argument0,400,480,wall_hor_obj);
room_instance_add(argument0,432,480,wall_hor_obj);
room_instance_add(argument0,432,384,wall_hor_obj);
room_instance_add(argument0,496,480,wall_hor_obj);
room_instance_add(argument0,496,320,wall_hor_obj);
room_instance_add(argument0,528,448,wall_hor_obj);
room_instance_add(argument0,560,448,wall_hor_obj);
room_instance_add(argument0,592,448,wall_hor_obj);
room_instance_add(argument0,624,448,wall_hor_obj);
room_instance_add(argument0,624,480,wall_hor_obj);
room_instance_add(argument0,592,480,wall_hor_obj);
room_instance_add(argument0,560,480,wall_hor_obj);
room_instance_add(argument0,528,480,wall_hor_obj);
room_instance_add(argument0,464,352,wall_hor_obj);
room_instance_add(argument0,432,352,wall_hor_obj);
room_instance_add(argument0,400,352,wall_hor_obj);
room_instance_add(argument0,368,352,wall_hor_obj);
room_instance_add(argument0,336,352,wall_hor_obj);
room_instance_add(argument0,304,352,wall_hor_obj);
room_instance_add(argument0,272,352,wall_hor_obj);
room_instance_add(argument0,272,384,wall_hor_obj);
room_instance_add(argument0,304,384,wall_hor_obj);
room_instance_add(argument0,336,384,wall_hor_obj);
room_instance_add(argument0,368,384,wall_hor_obj);
room_instance_add(argument0,400,384,wall_hor_obj);
room_instance_add(argument0,400,416,wall_hor_obj);
room_instance_add(argument0,368,416,wall_hor_obj);
room_instance_add(argument0,336,416,wall_hor_obj);
room_instance_add(argument0,304,416,wall_hor_obj);
room_instance_add(argument0,272,416,wall_hor_obj);
room_instance_add(argument0,240,416,wall_hor_obj);
room_instance_add(argument0,240,320,wall_hor_obj);
room_instance_add(argument0,272,320,wall_hor_obj);
room_instance_add(argument0,304,320,wall_hor_obj);
room_instance_add(argument0,336,320,wall_hor_obj);
room_instance_add(argument0,368,320,wall_hor_obj);
room_instance_add(argument0,400,320,wall_hor_obj);
room_instance_add(argument0,432,320,wall_hor_obj);
room_instance_add(argument0,464,320,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,464,wall_vert_obj);
room_instance_add(argument0,256,368,wall_vert_obj);
room_instance_add(argument0,448,400,wall_vert_obj);
room_instance_add(argument0,416,432,wall_vert_obj);
room_instance_add(argument0,448,432,wall_vert_obj);
room_instance_add(argument0,448,464,wall_vert_obj);
room_instance_add(argument0,480,464,wall_vert_obj);
room_instance_add(argument0,480,432,wall_vert_obj);
room_instance_add(argument0,480,400,wall_vert_obj);
room_instance_add(argument0,480,368,wall_vert_obj);
room_instance_add(argument0,512,336,wall_vert_obj);
room_instance_add(argument0,512,368,wall_vert_obj);
room_instance_add(argument0,512,400,wall_vert_obj);
room_instance_add(argument0,512,432,wall_vert_obj);
room_instance_add(argument0,640,464,wall_vert_obj);
room_instance_add(argument0,224,336,wall_vert_obj);
room_instance_add(argument0,224,368,wall_vert_obj);
room_instance_add(argument0,224,400,wall_vert_obj);
// Props
room_instance_add(argument0,299,402,web_rand_obj);
room_instance_add(argument0,374,336,web_rand_obj);
room_instance_add(argument0,452,328,web_rand_obj);