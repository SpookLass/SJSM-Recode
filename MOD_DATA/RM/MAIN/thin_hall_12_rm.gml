/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','thin','ROOM_thin')+' 12';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 528;
    global.spawn_arr[1,1] = 144;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 204;
    global.mark_arr[0,1] = 176;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 366;
    global.mark_arr[1,1] = 156;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 467;
    global.mark_arr[2,1] = 160;
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
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,240,176,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
room_instance_add(argument0,336,144,floor_obj);
room_instance_add(argument0,368,144,floor_obj);
room_instance_add(argument0,368,176,floor_obj);
room_instance_add(argument0,400,176,floor_obj);
room_instance_add(argument0,432,176,floor_obj);
room_instance_add(argument0,464,176,floor_obj);
room_instance_add(argument0,464,144,floor_obj);
room_instance_add(argument0,496,144,floor_obj);
room_instance_add(argument0,528,144,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_low_obj);
room_instance_add(argument0,208,144,ceil_low_obj);
room_instance_add(argument0,208,176,ceil_low_obj);
room_instance_add(argument0,240,176,ceil_low_obj);
room_instance_add(argument0,272,176,ceil_low_obj);
room_instance_add(argument0,304,176,ceil_low_obj);
room_instance_add(argument0,304,144,ceil_low_obj);
room_instance_add(argument0,336,144,ceil_low_obj);
room_instance_add(argument0,368,144,ceil_low_obj);
room_instance_add(argument0,368,176,ceil_low_obj);
room_instance_add(argument0,400,176,ceil_low_obj);
room_instance_add(argument0,432,176,ceil_low_obj);
room_instance_add(argument0,464,176,ceil_low_obj);
room_instance_add(argument0,464,144,ceil_low_obj);
room_instance_add(argument0,496,144,ceil_low_obj);
room_instance_add(argument0,528,144,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,136,wall_hor_obj);
room_instance_add(argument0,176,152,wall_hor_obj);
room_instance_add(argument0,208,136,wall_hor_obj);
room_instance_add(argument0,208,184,wall_hor_obj);
room_instance_add(argument0,240,168,wall_hor_obj);
room_instance_add(argument0,240,184,wall_hor_obj);
room_instance_add(argument0,272,168,wall_hor_obj);
room_instance_add(argument0,272,184,wall_hor_obj);
room_instance_add(argument0,304,184,wall_hor_obj);
room_instance_add(argument0,304,136,wall_hor_obj);
room_instance_add(argument0,336,136,wall_hor_obj);
room_instance_add(argument0,336,152,wall_hor_obj);
room_instance_add(argument0,368,136,wall_hor_obj);
room_instance_add(argument0,368,184,wall_hor_obj);
room_instance_add(argument0,400,168,wall_hor_obj);
room_instance_add(argument0,400,184,wall_hor_obj);
room_instance_add(argument0,432,168,wall_hor_obj);
room_instance_add(argument0,432,184,wall_hor_obj);
room_instance_add(argument0,464,184,wall_hor_obj);
room_instance_add(argument0,464,136,wall_hor_obj);
room_instance_add(argument0,496,136,wall_hor_obj);
room_instance_add(argument0,496,152,wall_hor_obj);
room_instance_add(argument0,528,136,wall_hor_obj);
room_instance_add(argument0,528,152,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,192,168,wall_vert_obj);
room_instance_add(argument0,224,152,wall_vert_obj);
room_instance_add(argument0,288,152,wall_vert_obj);
room_instance_add(argument0,320,168,wall_vert_obj);
room_instance_add(argument0,352,168,wall_vert_obj);
room_instance_add(argument0,384,152,wall_vert_obj);
room_instance_add(argument0,448,152,wall_vert_obj);
room_instance_add(argument0,480,168,wall_vert_obj);
room_instance_add(argument0,544,144,wall_vert_obj);
// Torches
// Props