/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sm','ROOM_sm')+' 7';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 208;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 512;
    global.spawn_arr[1,1] = 336;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
room_instance_add(argument0,240,208,door1_fake_west);
room_instance_add(argument0,528,336,door1_vert);
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 289;
    global.mark_arr[0,1] = 234;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 319;
    global.mark_arr[1,1] = 284;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 447;
    global.mark_arr[2,1] = 301;
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
room_instance_add(argument0,256,208,floor_obj);
room_instance_add(argument0,288,208,floor_obj);
room_instance_add(argument0,288,176,floor_obj);
room_instance_add(argument0,320,176,floor_obj);
room_instance_add(argument0,320,208,floor_obj);
room_instance_add(argument0,288,240,floor_obj);
room_instance_add(argument0,320,240,floor_obj);
room_instance_add(argument0,352,240,floor_obj);
room_instance_add(argument0,352,208,floor_obj);
room_instance_add(argument0,352,176,floor_obj);
room_instance_add(argument0,320,272,floor_obj);
room_instance_add(argument0,320,304,floor_obj);
room_instance_add(argument0,320,336,floor_obj);
room_instance_add(argument0,352,336,floor_obj);
room_instance_add(argument0,384,336,floor_obj);
room_instance_add(argument0,416,304,floor_obj);
room_instance_add(argument0,448,304,floor_obj);
room_instance_add(argument0,416,336,floor_obj);
room_instance_add(argument0,448,336,floor_obj);
room_instance_add(argument0,416,368,floor_obj);
room_instance_add(argument0,448,368,floor_obj);
room_instance_add(argument0,480,368,floor_obj);
room_instance_add(argument0,480,336,floor_obj);
room_instance_add(argument0,480,304,floor_obj);
room_instance_add(argument0,384,208,floor_obj);
room_instance_add(argument0,416,208,floor_obj);
room_instance_add(argument0,448,208,floor_obj);
room_instance_add(argument0,448,240,floor_obj);
room_instance_add(argument0,448,272,floor_obj);
room_instance_add(argument0,512,336,floor_obj);
// Ceilings
room_instance_add(argument0,256,208,ceil_obj);
room_instance_add(argument0,288,208,ceil_obj);
room_instance_add(argument0,288,176,ceil_obj);
room_instance_add(argument0,320,176,ceil_obj);
room_instance_add(argument0,320,208,ceil_obj);
room_instance_add(argument0,288,240,ceil_obj);
room_instance_add(argument0,320,240,ceil_obj);
room_instance_add(argument0,352,240,ceil_obj);
room_instance_add(argument0,352,208,ceil_obj);
room_instance_add(argument0,352,176,ceil_obj);
room_instance_add(argument0,320,272,ceil_obj);
room_instance_add(argument0,320,304,ceil_obj);
room_instance_add(argument0,320,336,ceil_obj);
room_instance_add(argument0,352,336,ceil_obj);
room_instance_add(argument0,384,336,ceil_obj);
room_instance_add(argument0,416,304,ceil_obj);
room_instance_add(argument0,448,304,ceil_obj);
room_instance_add(argument0,416,336,ceil_obj);
room_instance_add(argument0,448,336,ceil_obj);
room_instance_add(argument0,416,368,ceil_obj);
room_instance_add(argument0,448,368,ceil_obj);
room_instance_add(argument0,480,368,ceil_obj);
room_instance_add(argument0,480,336,ceil_obj);
room_instance_add(argument0,480,304,ceil_obj);
room_instance_add(argument0,384,208,ceil_obj);
room_instance_add(argument0,416,208,ceil_obj);
room_instance_add(argument0,448,208,ceil_obj);
room_instance_add(argument0,448,240,ceil_obj);
room_instance_add(argument0,448,272,ceil_obj);
room_instance_add(argument0,512,336,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,256,192,wall_hor_obj);
room_instance_add(argument0,288,160,wall_hor_obj);
room_instance_add(argument0,320,160,wall_hor_obj);
room_instance_add(argument0,352,160,wall_hor_obj);
room_instance_add(argument0,384,192,wall_hor_obj);
room_instance_add(argument0,416,192,wall_hor_obj);
room_instance_add(argument0,448,192,wall_hor_obj);
room_instance_add(argument0,480,288,wall_hor_obj);
room_instance_add(argument0,416,288,wall_hor_obj);
room_instance_add(argument0,352,256,wall_hor_obj);
room_instance_add(argument0,384,224,wall_hor_obj);
room_instance_add(argument0,416,224,wall_hor_obj);
room_instance_add(argument0,512,320,wall_hor_obj);
room_instance_add(argument0,512,352,wall_hor_obj);
room_instance_add(argument0,480,384,wall_hor_obj);
room_instance_add(argument0,448,384,wall_hor_obj);
room_instance_add(argument0,416,384,wall_hor_obj);
room_instance_add(argument0,384,352,wall_hor_obj);
room_instance_add(argument0,384,320,wall_hor_obj);
room_instance_add(argument0,352,320,wall_hor_obj);
room_instance_add(argument0,352,352,wall_hor_obj);
room_instance_add(argument0,320,352,wall_hor_obj);
room_instance_add(argument0,288,256,wall_hor_obj);
room_instance_add(argument0,256,224,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,240,208,wall_vert_obj);
room_instance_add(argument0,272,176,wall_vert_obj);
room_instance_add(argument0,272,240,wall_vert_obj);
room_instance_add(argument0,368,240,wall_vert_obj);
room_instance_add(argument0,368,176,wall_vert_obj);
room_instance_add(argument0,464,208,wall_vert_obj);
room_instance_add(argument0,432,240,wall_vert_obj);
room_instance_add(argument0,464,240,wall_vert_obj);
room_instance_add(argument0,464,272,wall_vert_obj);
room_instance_add(argument0,432,272,wall_vert_obj);
room_instance_add(argument0,336,304,wall_vert_obj);
room_instance_add(argument0,336,272,wall_vert_obj);
room_instance_add(argument0,304,272,wall_vert_obj);
room_instance_add(argument0,304,304,wall_vert_obj);
room_instance_add(argument0,304,336,wall_vert_obj);
room_instance_add(argument0,496,304,wall_vert_obj);
room_instance_add(argument0,528,336,wall_vert_obj);
room_instance_add(argument0,496,368,wall_vert_obj);
room_instance_add(argument0,400,304,wall_vert_obj);
room_instance_add(argument0,400,368,wall_vert_obj);
// Torches
room_instance_add(argument0,448,192,torch_north_obj);
room_instance_add(argument0,320,352,torch_south_obj);
// Props
room_instance_add(argument0,320,208,rug_rand_rot_obj);
room_instance_add(argument0,448,336,rug_rand_rot_obj);





