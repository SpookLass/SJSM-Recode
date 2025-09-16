/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    global.rm_name_var = 'Two-Tone Hall 11'
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 240;
    global.spawn_arr[0,1] = 128;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 144;
    global.spawn_arr[1,1] = 96;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    // Marks (Slime spawners)
    global.mark_len_var = 0;
    /*global.mark_arr[0,0] = 239;
    global.mark_arr[0,1] = 113;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 322;
    global.mark_arr[1,1] = 114;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 347;
    global.mark_arr[2,1] = 184;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 396;
    global.mark_arr[3,1] = 195;
    global.mark_arr[3,2] = 0;*/
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
room_instance_add(argument0,0,0,color_control_bright_obj);
// Floors
room_instance_add(argument0,240,96,floor_obj);
room_instance_add(argument0,240,128,floor_obj);
room_instance_add(argument0,240,160,floor_obj);
room_instance_add(argument0,272,96,floor_obj);
room_instance_add(argument0,272,128,floor_obj);
room_instance_add(argument0,272,160,floor_obj);
room_instance_add(argument0,304,96,floor_obj);
room_instance_add(argument0,304,128,floor_obj);
room_instance_add(argument0,304,160,floor_obj);
room_instance_add(argument0,336,128,floor_obj);
room_instance_add(argument0,368,128,floor_obj);
room_instance_add(argument0,368,160,floor_obj);
room_instance_add(argument0,368,192,floor_obj);
room_instance_add(argument0,368,224,floor_obj);
room_instance_add(argument0,336,224,floor_obj);
room_instance_add(argument0,304,224,floor_obj);
room_instance_add(argument0,272,224,floor_obj);
room_instance_add(argument0,240,224,floor_obj);
room_instance_add(argument0,208,224,floor_obj);
room_instance_add(argument0,176,224,floor_obj);
room_instance_add(argument0,144,224,floor_obj);
room_instance_add(argument0,112,224,floor_obj);
room_instance_add(argument0,80,224,floor_obj);
room_instance_add(argument0,48,224,floor_obj);
room_instance_add(argument0,48,192,floor_obj);
room_instance_add(argument0,48,160,floor_obj);
room_instance_add(argument0,48,128,floor_obj);
room_instance_add(argument0,80,128,floor_obj);
room_instance_add(argument0,112,96,floor_obj);
room_instance_add(argument0,112,128,floor_obj);
room_instance_add(argument0,112,160,floor_obj);
room_instance_add(argument0,144,96,floor_obj);
room_instance_add(argument0,144,128,floor_obj);
room_instance_add(argument0,144,160,floor_obj);
room_instance_add(argument0,176,96,floor_obj);
room_instance_add(argument0,176,128,floor_obj);
room_instance_add(argument0,176,160,floor_obj);
// Ceilings
room_instance_add(argument0,240,96,ceil_obj);
room_instance_add(argument0,240,128,ceil_obj);
room_instance_add(argument0,240,160,ceil_obj);
room_instance_add(argument0,272,96,ceil_obj);
room_instance_add(argument0,272,128,ceil_obj);
room_instance_add(argument0,272,160,ceil_obj);
room_instance_add(argument0,304,96,ceil_obj);
room_instance_add(argument0,304,128,ceil_obj);
room_instance_add(argument0,304,160,ceil_obj);
room_instance_add(argument0,336,128,ceil_obj);
room_instance_add(argument0,368,128,ceil_obj);
room_instance_add(argument0,368,160,ceil_obj);
room_instance_add(argument0,368,192,ceil_obj);
room_instance_add(argument0,368,224,ceil_obj);
room_instance_add(argument0,336,224,ceil_obj);
room_instance_add(argument0,304,224,ceil_obj);
room_instance_add(argument0,272,224,ceil_obj);
room_instance_add(argument0,240,224,ceil_obj);
room_instance_add(argument0,208,224,ceil_obj);
room_instance_add(argument0,176,224,ceil_obj);
room_instance_add(argument0,144,224,ceil_obj);
room_instance_add(argument0,112,224,ceil_obj);
room_instance_add(argument0,80,224,ceil_obj);
room_instance_add(argument0,48,224,ceil_obj);
room_instance_add(argument0,48,192,ceil_obj);
room_instance_add(argument0,48,160,ceil_obj);
room_instance_add(argument0,48,128,ceil_obj);
room_instance_add(argument0,80,128,ceil_obj);
room_instance_add(argument0,112,96,ceil_obj);
room_instance_add(argument0,112,128,ceil_obj);
room_instance_add(argument0,112,160,ceil_obj);
room_instance_add(argument0,144,96,ceil_obj);
room_instance_add(argument0,144,128,ceil_obj);
room_instance_add(argument0,144,160,ceil_obj);
room_instance_add(argument0,176,96,ceil_obj);
room_instance_add(argument0,176,128,ceil_obj);
room_instance_add(argument0,176,160,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,48,112,wall_hor_obj);
room_instance_add(argument0,80,112,wall_hor_obj);
room_instance_add(argument0,336,112,wall_hor_obj);
room_instance_add(argument0,368,112,wall_hor_obj);
room_instance_add(argument0,80,144,wall_hor_obj);
room_instance_add(argument0,336,144,wall_hor_obj);
room_instance_add(argument0,80,208,wall_hor_obj);
room_instance_add(argument0,112,208,wall_hor_obj);
room_instance_add(argument0,144,208,wall_hor_obj);
room_instance_add(argument0,176,208,wall_hor_obj);
room_instance_add(argument0,208,208,wall_hor_obj);
room_instance_add(argument0,240,208,wall_hor_obj);
room_instance_add(argument0,272,208,wall_hor_obj);
room_instance_add(argument0,304,208,wall_hor_obj);
room_instance_add(argument0,336,208,wall_hor_obj);
room_instance_add(argument0,48,240,wall_hor_obj);
room_instance_add(argument0,80,240,wall_hor_obj);
room_instance_add(argument0,112,240,wall_hor_obj);
room_instance_add(argument0,144,240,wall_hor_obj);
room_instance_add(argument0,176,240,wall_hor_obj);
room_instance_add(argument0,208,240,wall_hor_obj);
room_instance_add(argument0,240,240,wall_hor_obj);
room_instance_add(argument0,272,240,wall_hor_obj);
room_instance_add(argument0,304,240,wall_hor_obj);
room_instance_add(argument0,336,240,wall_hor_obj);
room_instance_add(argument0,368,240,wall_hor_obj);
room_instance_add(argument0,240,80,wall_tt_hor_obj);
room_instance_add(argument0,272,80,wall_tt_hor_obj);
room_instance_add(argument0,304,80,wall_tt_hor_obj);
room_instance_add(argument0,240,176,wall_tt_hor_obj);
room_instance_add(argument0,272,176,wall_tt_hor_obj);
room_instance_add(argument0,304,176,wall_tt_hor_obj);
room_instance_add(argument0,112,80,wall_tt_hor_obj);
room_instance_add(argument0,144,80,wall_tt_hor_obj);
room_instance_add(argument0,176,80,wall_tt_hor_obj);
room_instance_add(argument0,112,176,wall_tt_hor_obj);
room_instance_add(argument0,144,176,wall_tt_hor_obj);
room_instance_add(argument0,176,176,wall_tt_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,32,128,wall_vert_obj);
room_instance_add(argument0,32,160,wall_vert_obj);
room_instance_add(argument0,32,192,wall_vert_obj);
room_instance_add(argument0,32,224,wall_vert_obj);
room_instance_add(argument0,64,160,wall_vert_obj);
room_instance_add(argument0,64,192,wall_vert_obj);
room_instance_add(argument0,352,192,wall_vert_obj);
room_instance_add(argument0,352,160,wall_vert_obj);
room_instance_add(argument0,384,224,wall_vert_obj);
room_instance_add(argument0,384,192,wall_vert_obj);
room_instance_add(argument0,384,160,wall_vert_obj);
room_instance_add(argument0,384,128,wall_vert_obj);
room_instance_add(argument0,96,96,wall_tt_vert_obj);
room_instance_add(argument0,96,160,wall_tt_vert_obj);
room_instance_add(argument0,192,96,wall_tt_vert_obj);
room_instance_add(argument0,192,128,wall_tt_vert_obj);
room_instance_add(argument0,192,160,wall_tt_vert_obj);
room_instance_add(argument0,224,96,wall_tt_vert_obj);
room_instance_add(argument0,224,128,wall_tt_vert_obj);
room_instance_add(argument0,224,160,wall_tt_vert_obj);
room_instance_add(argument0,320,96,wall_tt_vert_obj);
room_instance_add(argument0,320,160,wall_tt_vert_obj);
// Torches
// Props
// Not yet