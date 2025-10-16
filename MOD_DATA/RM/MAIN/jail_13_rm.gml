/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','jail','ROOM_jail')+' 13';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 288;
    global.spawn_arr[1,1] = 656;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 0;
    /*global.mark_arr[0,0] = 161;
    global.mark_arr[0,1] = 306;
    global.mark_arr[0,2] = 0;*/
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
room_instance_add(argument0,112,304,floor_obj);
room_instance_add(argument0,144,304,floor_obj);
room_instance_add(argument0,176,304,floor_obj);
room_instance_add(argument0,176,336,floor_obj);
room_instance_add(argument0,208,304,floor_obj);
room_instance_add(argument0,176,368,floor_obj);
room_instance_add(argument0,176,400,floor_obj);
room_instance_add(argument0,176,432,floor_obj);
room_instance_add(argument0,176,464,floor_obj);
room_instance_add(argument0,176,496,floor_obj);
room_instance_add(argument0,176,528,floor_obj);
room_instance_add(argument0,176,560,floor_obj);
room_instance_add(argument0,176,592,floor_obj);
room_instance_add(argument0,176,624,floor_obj);
room_instance_add(argument0,176,656,floor_obj);
room_instance_add(argument0,208,656,floor_obj);
room_instance_add(argument0,240,656,floor_obj);
room_instance_add(argument0,272,656,floor_obj);
room_instance_add(argument0,304,656,floor_obj);
room_instance_add(argument0,144,368,floor_obj);
room_instance_add(argument0,208,368,floor_obj);
room_instance_add(argument0,208,400,floor_obj);
room_instance_add(argument0,208,432,floor_obj);
room_instance_add(argument0,208,592,floor_obj);
room_instance_add(argument0,208,560,floor_obj);
room_instance_add(argument0,208,528,floor_obj);
room_instance_add(argument0,208,496,floor_obj);
room_instance_add(argument0,208,464,floor_obj);
room_instance_add(argument0,144,400,floor_obj);
room_instance_add(argument0,144,432,floor_obj);
room_instance_add(argument0,144,464,floor_obj);
room_instance_add(argument0,144,496,floor_obj);
room_instance_add(argument0,144,528,floor_obj);
room_instance_add(argument0,144,560,floor_obj);
room_instance_add(argument0,144,592,floor_obj);
// Ceilings
room_instance_add(argument0,112,304,ceil_obj);
room_instance_add(argument0,144,304,ceil_obj);
room_instance_add(argument0,176,304,ceil_obj);
room_instance_add(argument0,176,336,ceil_obj);
room_instance_add(argument0,208,304,ceil_obj);
room_instance_add(argument0,176,368,ceil_obj);
room_instance_add(argument0,176,400,ceil_obj);
room_instance_add(argument0,176,432,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
room_instance_add(argument0,176,496,ceil_obj);
room_instance_add(argument0,176,528,ceil_obj);
room_instance_add(argument0,176,560,ceil_obj);
room_instance_add(argument0,176,592,ceil_obj);
room_instance_add(argument0,176,624,ceil_obj);
room_instance_add(argument0,176,656,ceil_obj);
room_instance_add(argument0,208,656,ceil_obj);
room_instance_add(argument0,240,656,ceil_obj);
room_instance_add(argument0,272,656,ceil_obj);
room_instance_add(argument0,304,656,ceil_obj);
room_instance_add(argument0,144,368,ceil_obj);
room_instance_add(argument0,208,368,ceil_obj);
room_instance_add(argument0,208,400,ceil_obj);
room_instance_add(argument0,208,432,ceil_obj);
room_instance_add(argument0,208,592,ceil_obj);
room_instance_add(argument0,208,560,ceil_obj);
room_instance_add(argument0,208,528,ceil_obj);
room_instance_add(argument0,208,496,ceil_obj);
room_instance_add(argument0,208,464,ceil_obj);
room_instance_add(argument0,144,400,ceil_obj);
room_instance_add(argument0,144,432,ceil_obj);
room_instance_add(argument0,144,464,ceil_obj);
room_instance_add(argument0,144,496,ceil_obj);
room_instance_add(argument0,144,528,ceil_obj);
room_instance_add(argument0,144,560,ceil_obj);
room_instance_add(argument0,144,592,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,288,wall_hor_obj);
room_instance_add(argument0,144,288,wall_hor_obj);
room_instance_add(argument0,176,288,wall_hor_obj);
room_instance_add(argument0,208,288,wall_hor_obj);
room_instance_add(argument0,200,320,wall_hor_obj);
room_instance_add(argument0,152,320,wall_hor_obj);
room_instance_add(argument0,120,320,wall_hor_obj);
room_instance_add(argument0,88,320,wall_hor_obj);
room_instance_add(argument0,232,320,wall_hor_obj);
room_instance_add(argument0,200,640,wall_hor_obj);
room_instance_add(argument0,152,640,wall_hor_obj);
room_instance_add(argument0,232,640,wall_hor_obj);
room_instance_add(argument0,264,640,wall_hor_obj);
room_instance_add(argument0,296,640,wall_hor_obj);
room_instance_add(argument0,176,672,wall_hor_obj);
room_instance_add(argument0,208,672,wall_hor_obj);
room_instance_add(argument0,240,672,wall_hor_obj);
room_instance_add(argument0,272,672,wall_hor_obj);
room_instance_add(argument0,304,672,wall_hor_obj);
room_instance_add(argument0,152,352,wall_hor_obj);
room_instance_add(argument0,120,352,wall_hor_obj);
room_instance_add(argument0,200,352,wall_hor_obj);
room_instance_add(argument0,232,352,wall_hor_obj);
room_instance_add(argument0,152,608,wall_hor_obj);
room_instance_add(argument0,120,608,wall_hor_obj);
room_instance_add(argument0,200,608,wall_hor_obj);
room_instance_add(argument0,232,608,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,304,wall_vert_obj);
room_instance_add(argument0,160,656,wall_vert_obj);
room_instance_add(argument0,304,656,wall_vert_obj);
room_instance_add(argument0,224,304,wall_vert_obj);
room_instance_add(argument0,168,336,wall_vert_obj);
room_instance_add(argument0,184,336,wall_vert_obj);
room_instance_add(argument0,168,624,wall_vert_obj);
room_instance_add(argument0,184,624,wall_vert_obj);
room_instance_add(argument0,224,368,wall_vert_obj);
room_instance_add(argument0,224,400,wall_vert_obj);
room_instance_add(argument0,224,432,wall_vert_obj);
room_instance_add(argument0,224,464,wall_vert_obj);
room_instance_add(argument0,224,496,wall_vert_obj);
room_instance_add(argument0,224,528,wall_vert_obj);
room_instance_add(argument0,224,560,wall_vert_obj);
room_instance_add(argument0,224,592,wall_vert_obj);
room_instance_add(argument0,128,368,wall_vert_obj);
room_instance_add(argument0,128,400,wall_vert_obj);
room_instance_add(argument0,128,432,wall_vert_obj);
room_instance_add(argument0,128,464,wall_vert_obj);
room_instance_add(argument0,128,496,wall_vert_obj);
room_instance_add(argument0,128,528,wall_vert_obj);
room_instance_add(argument0,128,560,wall_vert_obj);
room_instance_add(argument0,128,592,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,168,368,bar_vert_obj);
room_instance_add(argument0,184,368,bar_vert_obj);
room_instance_add(argument0,184,400,bar_vert_obj);
room_instance_add(argument0,168,400,bar_vert_obj);
room_instance_add(argument0,184,432,bar_vert_obj);
room_instance_add(argument0,168,432,bar_vert_obj);
room_instance_add(argument0,184,464,bar_vert_obj);
room_instance_add(argument0,168,464,bar_vert_obj);
room_instance_add(argument0,184,496,bar_vert_obj);
room_instance_add(argument0,168,496,bar_vert_obj);
room_instance_add(argument0,184,528,bar_vert_obj);
room_instance_add(argument0,168,528,bar_vert_obj);
room_instance_add(argument0,184,560,bar_vert_obj);
room_instance_add(argument0,168,560,bar_vert_obj);
room_instance_add(argument0,168,592,bar_vert_obj);
room_instance_add(argument0,184,592,bar_vert_obj);
room_instance_add(argument0,150,386,bone_rand_obj);
room_instance_add(argument0,143,442,bone_rand_obj);
room_instance_add(argument0,149,506,bone_rand_obj);
room_instance_add(argument0,140,598,bone_rand_obj);
room_instance_add(argument0,137,564,bone_rand_obj);
room_instance_add(argument0,208,571,bone_rand_obj);
room_instance_add(argument0,211,521,bone_rand_obj);
room_instance_add(argument0,208,446,bone_rand_obj);
room_instance_add(argument0,211,366,bone_rand_obj);
room_instance_add(argument0,199,364,bone_rand_obj);
room_instance_add(argument0,199,406,bone_rand_obj);
room_instance_add(argument0,196,550,bone_rand_obj);
room_instance_add(argument0,200,596,bone_rand_obj);
room_instance_add(argument0,153,578,bone_rand_obj);
room_instance_add(argument0,152,607,bone_rand_obj);
room_instance_add(argument0,139,576,bone_rand_obj);
room_instance_add(argument0,152,529,bone_rand_obj);
room_instance_add(argument0,142,476,bone_rand_obj);
room_instance_add(argument0,157,419,bone_rand_obj);
room_instance_add(argument0,145,393,bone_rand_obj);
room_instance_add(argument0,141,366,bone_rand_obj);
room_instance_add(argument0,217,465,bone_rand_obj);
room_instance_add(argument0,209,484,bone_rand_obj);
room_instance_add(argument0,209,502,bone_rand_obj);
room_instance_add(argument0,208,424,bone_rand_obj);
room_instance_add(argument0,199,442,bone_rand_obj);
// Not yet
//room_instance_add(argument0,200,672,random_scare_mark1);