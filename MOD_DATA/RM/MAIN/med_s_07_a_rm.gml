/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    global.rm_name_var = 'Med S Room 7 A'
    global.spawn_len_var = 3;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 208;
    global.spawn_arr[1,1] = 288;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 208;
    global.spawn_arr[2,1] = 384;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 0;
    /*global.mark_arr[0,0] = 300;
    global.mark_arr[0,1] = 313;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 327;
    global.mark_arr[1,1] = 186;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 396;
    global.mark_arr[2,1] = 162;
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
room_instance_add(argument0,112,256,floor_obj);
room_instance_add(argument0,144,320,floor_obj);
room_instance_add(argument0,176,320,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,176,256,floor_obj);
room_instance_add(argument0,112,352,floor_obj);
room_instance_add(argument0,112,384,floor_obj);
room_instance_add(argument0,112,416,floor_obj);
room_instance_add(argument0,144,384,floor_obj);
room_instance_add(argument0,144,352,floor_obj);
room_instance_add(argument0,176,384,floor_obj);
room_instance_add(argument0,208,384,floor_obj);
room_instance_add(argument0,208,288,floor_obj);
// Ceilings
room_instance_add(argument0,112,288,ceil_low_obj);
room_instance_add(argument0,144,288,ceil_low_obj);
room_instance_add(argument0,112,256,ceil_low_obj);
room_instance_add(argument0,144,320,ceil_low_obj);
room_instance_add(argument0,176,320,ceil_low_obj);
room_instance_add(argument0,176,288,ceil_low_obj);
room_instance_add(argument0,176,256,ceil_low_obj);
room_instance_add(argument0,112,352,ceil_low_obj);
room_instance_add(argument0,112,384,ceil_low_obj);
room_instance_add(argument0,112,416,ceil_low_obj);
room_instance_add(argument0,144,384,ceil_low_obj);
room_instance_add(argument0,144,352,ceil_low_obj);
room_instance_add(argument0,176,384,ceil_low_obj);
room_instance_add(argument0,208,384,ceil_low_obj);
room_instance_add(argument0,208,288,ceil_low_obj);
room_instance_add(argument0,112,320,ceil_low_obj);
room_instance_add(argument0,144,416,ceil_low_obj);
room_instance_add(argument0,176,416,ceil_low_obj);
room_instance_add(argument0,176,352,ceil_low_obj);
room_instance_add(argument0,144,256,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,240,wall_hor_obj);
room_instance_add(argument0,144,240,wall_hor_obj);
room_instance_add(argument0,176,240,wall_hor_obj);
room_instance_add(argument0,208,272,wall_hor_obj);
room_instance_add(argument0,208,304,wall_hor_obj);
room_instance_add(argument0,208,368,wall_hor_obj);
room_instance_add(argument0,208,400,wall_hor_obj);
room_instance_add(argument0,176,432,wall_hor_obj);
room_instance_add(argument0,144,432,wall_hor_obj);
room_instance_add(argument0,112,432,wall_hor_obj);
room_instance_add(argument0,112,304,wall_pit_hor_obj);
room_instance_add(argument0,112,336,wall_pit_hor_obj);
room_instance_add(argument0,144,272,wall_pit_hor_obj);
room_instance_add(argument0,144,240,wall_pit_hor_obj);
room_instance_add(argument0,176,336,wall_pit_hor_obj);
room_instance_add(argument0,176,368,wall_pit_hor_obj);
room_instance_add(argument0,176,400,wall_pit_hor_obj);
room_instance_add(argument0,176,432,wall_pit_hor_obj);
room_instance_add(argument0,144,432,wall_pit_hor_obj);
room_instance_add(argument0,144,400,wall_pit_hor_obj);
room_instance_add(argument0,112,304,wall_float_hor_obj);
room_instance_add(argument0,112,336,wall_float_hor_obj);
room_instance_add(argument0,144,272,wall_float_hor_obj);
room_instance_add(argument0,144,240,wall_float_hor_obj);
room_instance_add(argument0,176,336,wall_float_hor_obj);
room_instance_add(argument0,176,368,wall_float_hor_obj);
room_instance_add(argument0,176,400,wall_float_hor_obj);
room_instance_add(argument0,176,432,wall_float_hor_obj);
room_instance_add(argument0,144,432,wall_float_hor_obj);
room_instance_add(argument0,144,400,wall_float_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,288,wall_vert_obj);
room_instance_add(argument0,96,416,wall_vert_obj);
room_instance_add(argument0,224,384,wall_vert_obj);
room_instance_add(argument0,192,416,wall_vert_obj);
room_instance_add(argument0,192,352,wall_vert_obj);
room_instance_add(argument0,192,320,wall_vert_obj);
room_instance_add(argument0,224,288,wall_vert_obj);
room_instance_add(argument0,192,256,wall_vert_obj);
room_instance_add(argument0,96,256,wall_vert_obj);
room_instance_add(argument0,96,320,wall_vert_obj);
room_instance_add(argument0,96,352,wall_vert_obj);
room_instance_add(argument0,96,384,wall_vert_obj);
room_instance_add(argument0,96,320,wall_pit_vert_obj);
room_instance_add(argument0,128,320,wall_pit_vert_obj);
room_instance_add(argument0,128,256,wall_pit_vert_obj);
room_instance_add(argument0,160,256,wall_pit_vert_obj);
room_instance_add(argument0,160,352,wall_pit_vert_obj);
room_instance_add(argument0,192,352,wall_pit_vert_obj);
room_instance_add(argument0,192,416,wall_pit_vert_obj);
room_instance_add(argument0,128,416,wall_pit_vert_obj);
room_instance_add(argument0,96,320,wall_float_vert_obj);
room_instance_add(argument0,128,320,wall_float_vert_obj);
room_instance_add(argument0,128,256,wall_float_vert_obj);
room_instance_add(argument0,160,256,wall_float_vert_obj);
room_instance_add(argument0,160,352,wall_float_vert_obj);
room_instance_add(argument0,192,352,wall_float_vert_obj);
room_instance_add(argument0,192,416,wall_float_vert_obj);
room_instance_add(argument0,128,416,wall_float_vert_obj);
// Props
room_instance_add(argument0,208,288,bar_vert_obj);