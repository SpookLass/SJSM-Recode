/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','hotel','ROOM_hotel')+' 10';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 368;
    global.spawn_arr[1,1] = 320;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    // Mark
    global.mark_len_var = 2;
    global.mark_arr[0,0] = 292;
    global.mark_arr[0,1] = 260;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 311;
    global.mark_arr[1,1] = 228;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 377;
    global.mark_arr[2,1] = 205;
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
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,352,288,floor_obj);
room_instance_add(argument0,384,288,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,384,256,floor_obj);
room_instance_add(argument0,384,320,floor_obj);
room_instance_add(argument0,352,320,floor_obj);
room_instance_add(argument0,352,224,floor_obj);
room_instance_add(argument0,384,224,floor_obj);
room_instance_add(argument0,288,192,floor_obj);
room_instance_add(argument0,320,192,floor_obj);
room_instance_add(argument0,288,160,floor_obj);
room_instance_add(argument0,320,160,floor_obj);
room_instance_add(argument0,352,192,floor_obj);
room_instance_add(argument0,384,192,floor_obj);
// Ceilings
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,256,224,ceil_obj);
room_instance_add(argument0,288,224,ceil_obj);
room_instance_add(argument0,320,224,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,320,288,ceil_obj);
room_instance_add(argument0,352,288,ceil_obj);
room_instance_add(argument0,384,288,ceil_obj);
room_instance_add(argument0,352,256,ceil_obj);
room_instance_add(argument0,384,256,ceil_obj);
room_instance_add(argument0,384,320,ceil_obj);
room_instance_add(argument0,352,320,ceil_obj);
room_instance_add(argument0,352,224,ceil_obj);
room_instance_add(argument0,384,224,ceil_obj);
room_instance_add(argument0,288,192,ceil_obj);
room_instance_add(argument0,320,192,ceil_obj);
room_instance_add(argument0,288,160,ceil_obj);
room_instance_add(argument0,320,160,ceil_obj);
room_instance_add(argument0,352,192,ceil_obj);
room_instance_add(argument0,384,192,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,256,208,wall_hor_obj);
room_instance_add(argument0,288,208,wall_hor_obj);
room_instance_add(argument0,352,176,wall_hor_obj);
room_instance_add(argument0,384,176,wall_hor_obj);
room_instance_add(argument0,320,144,wall_hor_obj);
room_instance_add(argument0,288,144,wall_hor_obj);
room_instance_add(argument0,320,304,wall_hor_obj);
room_instance_add(argument0,288,304,wall_hor_obj);
room_instance_add(argument0,256,304,wall_hor_obj);
room_instance_add(argument0,352,336,wall_hor_obj);
room_instance_add(argument0,384,336,wall_hor_obj);
room_instance_add(argument0,352,240,wall_hor_obj);
room_instance_add(argument0,384,240,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,240,256,wall_vert_obj);
room_instance_add(argument0,336,256,wall_vert_obj);
room_instance_add(argument0,400,256,wall_vert_obj);
room_instance_add(argument0,400,288,wall_vert_obj);
room_instance_add(argument0,400,320,wall_vert_obj);
room_instance_add(argument0,336,320,wall_vert_obj);
room_instance_add(argument0,400,224,wall_vert_obj);
room_instance_add(argument0,400,192,wall_vert_obj);
room_instance_add(argument0,336,192,wall_vert_obj);
room_instance_add(argument0,336,160,wall_vert_obj);
room_instance_add(argument0,272,192,wall_vert_obj);
room_instance_add(argument0,272,160,wall_vert_obj);
room_instance_add(argument0,240,224,wall_vert_obj);
room_instance_add(argument0,240,288,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,320,208,doorframe_01_hor_obj);
room_instance_add(argument0,320,208,doorframe_02_hor_obj);
room_instance_add(argument0,336,288,doorframe_01_vert_obj);
room_instance_add(argument0,336,224,doorframe_01_vert_obj);
room_instance_add(argument0,336,224,doorframe_02_vert_obj);
room_instance_add(argument0,336,288,doorframe_02_vert_obj);