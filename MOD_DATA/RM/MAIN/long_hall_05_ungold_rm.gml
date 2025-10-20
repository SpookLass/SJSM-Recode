/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','long','ROOM_long')+' 5 / 6 '+ini_read_string('ROOM','ungold','ROOM_ungold');
	ini_close();
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 240;
    global.spawn_arr[1,1] = 464;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    global.spawn_arr[2,0] = 240;
    global.spawn_arr[2,1] = 80;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    // Mark
    global.mark_len_var = 5;
    global.mark_arr[0,0] = 152;
    global.mark_arr[0,1] = 469;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 168;
    global.mark_arr[1,1] = 349;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 185;
    global.mark_arr[2,1] = 235;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 240;
    global.mark_arr[3,1] = 339;
    global.mark_arr[3,2] = 0;
    global.mark_arr[4,0] = 175;
    global.mark_arr[4,1] = 114;
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
room_instance_add(argument0,176,432,floor_obj);
room_instance_add(argument0,176,400,floor_obj);
room_instance_add(argument0,176,368,floor_obj);
room_instance_add(argument0,176,336,floor_obj);
room_instance_add(argument0,176,304,floor_obj);
room_instance_add(argument0,176,272,floor_obj);
room_instance_add(argument0,176,240,floor_obj);
room_instance_add(argument0,176,208,floor_obj);
room_instance_add(argument0,208,240,floor_obj);
room_instance_add(argument0,240,240,floor_obj);
room_instance_add(argument0,240,272,floor_obj);
room_instance_add(argument0,240,304,floor_obj);
room_instance_add(argument0,240,336,floor_obj);
room_instance_add(argument0,176,176,floor_obj);
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,176,112,floor_obj);
room_instance_add(argument0,176,80,floor_obj);
room_instance_add(argument0,208,80,floor_obj);
room_instance_add(argument0,240,80,floor_obj);
room_instance_add(argument0,240,368,floor_obj);
room_instance_add(argument0,240,400,floor_obj);
room_instance_add(argument0,240,432,floor_obj);
room_instance_add(argument0,240,464,floor_obj);
// Ceilings
room_instance_add(argument0,112,464,ceil_obj);
room_instance_add(argument0,144,464,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
room_instance_add(argument0,176,432,ceil_obj);
room_instance_add(argument0,176,400,ceil_obj);
room_instance_add(argument0,176,368,ceil_obj);
room_instance_add(argument0,176,336,ceil_obj);
room_instance_add(argument0,176,304,ceil_obj);
room_instance_add(argument0,176,272,ceil_obj);
room_instance_add(argument0,176,240,ceil_obj);
room_instance_add(argument0,176,208,ceil_obj);
room_instance_add(argument0,208,240,ceil_obj);
room_instance_add(argument0,240,240,ceil_obj);
room_instance_add(argument0,240,272,ceil_obj);
room_instance_add(argument0,240,304,ceil_obj);
room_instance_add(argument0,240,336,ceil_obj);
room_instance_add(argument0,176,176,ceil_obj);
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,176,112,ceil_obj);
room_instance_add(argument0,176,80,ceil_obj);
room_instance_add(argument0,208,80,ceil_obj);
room_instance_add(argument0,240,80,ceil_obj);
room_instance_add(argument0,240,368,ceil_obj);
room_instance_add(argument0,240,400,ceil_obj);
room_instance_add(argument0,240,432,ceil_obj);
room_instance_add(argument0,240,464,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,448,wall_hor_obj);
room_instance_add(argument0,112,480,wall_hor_obj);
room_instance_add(argument0,144,448,wall_hor_obj);
room_instance_add(argument0,144,480,wall_hor_obj);
room_instance_add(argument0,240,64,wall_hor_obj);
room_instance_add(argument0,240,96,wall_hor_obj);
room_instance_add(argument0,208,96,wall_hor_obj);
room_instance_add(argument0,208,64,wall_hor_obj);
room_instance_add(argument0,176,64,wall_hor_obj);
room_instance_add(argument0,208,224,wall_hor_obj);
room_instance_add(argument0,208,256,wall_hor_obj);
room_instance_add(argument0,176,480,wall_hor_obj);
room_instance_add(argument0,240,224,wall_hor_obj);
room_instance_add(argument0,240,480,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,464,wall_vert_obj);
room_instance_add(argument0,256,80,wall_vert_obj);
room_instance_add(argument0,192,112,wall_vert_obj);
room_instance_add(argument0,192,144,wall_vert_obj);
room_instance_add(argument0,192,176,wall_vert_obj);
room_instance_add(argument0,192,208,wall_vert_obj);
room_instance_add(argument0,160,80,wall_vert_obj);
room_instance_add(argument0,160,112,wall_vert_obj);
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,160,176,wall_vert_obj);
room_instance_add(argument0,160,208,wall_vert_obj);
room_instance_add(argument0,160,240,wall_vert_obj);
room_instance_add(argument0,160,272,wall_vert_obj);
room_instance_add(argument0,192,272,wall_vert_obj);
room_instance_add(argument0,192,304,wall_vert_obj);
room_instance_add(argument0,192,336,wall_vert_obj);
room_instance_add(argument0,192,368,wall_vert_obj);
room_instance_add(argument0,192,400,wall_vert_obj);
room_instance_add(argument0,192,432,wall_vert_obj);
room_instance_add(argument0,192,464,wall_vert_obj);
room_instance_add(argument0,224,464,wall_vert_obj);
room_instance_add(argument0,256,464,wall_vert_obj);
room_instance_add(argument0,224,432,wall_vert_obj);
room_instance_add(argument0,256,432,wall_vert_obj);
room_instance_add(argument0,224,272,wall_vert_obj);
room_instance_add(argument0,256,240,wall_vert_obj);
room_instance_add(argument0,256,272,wall_vert_obj);
room_instance_add(argument0,256,304,wall_vert_obj);
room_instance_add(argument0,256,336,wall_vert_obj);
room_instance_add(argument0,256,368,wall_vert_obj);
room_instance_add(argument0,256,400,wall_vert_obj);
room_instance_add(argument0,224,400,wall_vert_obj);
room_instance_add(argument0,224,368,wall_vert_obj);
room_instance_add(argument0,224,336,wall_vert_obj);
room_instance_add(argument0,224,304,wall_vert_obj);
room_instance_add(argument0,160,304,wall_vert_obj);
room_instance_add(argument0,160,336,wall_vert_obj);
room_instance_add(argument0,160,368,wall_vert_obj);
room_instance_add(argument0,160,400,wall_vert_obj);
room_instance_add(argument0,160,432,wall_vert_obj);