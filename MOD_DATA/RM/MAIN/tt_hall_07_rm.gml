/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    global.rm_name_var = 'Two-Tone Hall 7'
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 128;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 320;
    global.spawn_arr[1,1] = 128;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 239;
    global.mark_arr[0,1] = 278;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 314;
    global.mark_arr[1,1] = 306;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 327;
    global.mark_arr[2,1] = 208;
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
room_instance_add(argument0,0,0,color_control_bright_obj);
// Floors
room_instance_add(argument0,176,128,floor_obj);
room_instance_add(argument0,208,128,floor_obj);
room_instance_add(argument0,240,128,floor_obj);
room_instance_add(argument0,240,160,floor_obj);
room_instance_add(argument0,240,192,floor_obj);
room_instance_add(argument0,240,224,floor_obj);
room_instance_add(argument0,240,256,floor_obj);
room_instance_add(argument0,240,288,floor_obj);
room_instance_add(argument0,240,320,floor_obj);
room_instance_add(argument0,240,352,floor_obj);
room_instance_add(argument0,272,352,floor_obj);
room_instance_add(argument0,304,352,floor_obj);
room_instance_add(argument0,304,320,floor_obj);
room_instance_add(argument0,336,352,floor_obj);
room_instance_add(argument0,336,320,floor_obj);
room_instance_add(argument0,304,384,floor_obj);
room_instance_add(argument0,336,384,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,304,288,floor_obj);
room_instance_add(argument0,304,256,floor_obj);
room_instance_add(argument0,336,256,floor_obj);
room_instance_add(argument0,336,224,floor_obj);
room_instance_add(argument0,304,224,floor_obj);
room_instance_add(argument0,304,192,floor_obj);
room_instance_add(argument0,336,192,floor_obj);
room_instance_add(argument0,336,160,floor_obj);
room_instance_add(argument0,304,160,floor_obj);
room_instance_add(argument0,304,128,floor_obj);
room_instance_add(argument0,336,128,floor_obj);
// Ceilings
room_instance_add(argument0,176,128,ceil_obj);
room_instance_add(argument0,208,128,ceil_obj);
room_instance_add(argument0,240,128,ceil_obj);
room_instance_add(argument0,240,160,ceil_obj);
room_instance_add(argument0,240,192,ceil_obj);
room_instance_add(argument0,240,224,ceil_obj);
room_instance_add(argument0,240,256,ceil_obj);
room_instance_add(argument0,240,288,ceil_obj);
room_instance_add(argument0,240,320,ceil_obj);
room_instance_add(argument0,240,352,ceil_obj);
room_instance_add(argument0,272,352,ceil_obj);
room_instance_add(argument0,304,352,ceil_obj);
room_instance_add(argument0,304,320,ceil_obj);
room_instance_add(argument0,336,352,ceil_obj);
room_instance_add(argument0,336,320,ceil_obj);
room_instance_add(argument0,304,384,ceil_obj);
room_instance_add(argument0,336,384,ceil_obj);
room_instance_add(argument0,336,288,ceil_obj);
room_instance_add(argument0,304,288,ceil_obj);
room_instance_add(argument0,304,256,ceil_obj);
room_instance_add(argument0,336,256,ceil_obj);
room_instance_add(argument0,336,224,ceil_obj);
room_instance_add(argument0,304,224,ceil_obj);
room_instance_add(argument0,304,192,ceil_obj);
room_instance_add(argument0,336,192,ceil_obj);
room_instance_add(argument0,336,160,ceil_obj);
room_instance_add(argument0,304,160,ceil_obj);
room_instance_add(argument0,304,128,ceil_obj);
room_instance_add(argument0,336,128,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,112,wall_hor_obj);
room_instance_add(argument0,272,336,wall_hor_obj);
room_instance_add(argument0,272,368,wall_hor_obj);
room_instance_add(argument0,240,368,wall_hor_obj);
room_instance_add(argument0,240,112,wall_hor_obj);
room_instance_add(argument0,208,112,wall_hor_obj);
room_instance_add(argument0,208,144,wall_hor_obj);
room_instance_add(argument0,176,144,wall_hor_obj);
room_instance_add(argument0,304,112,wall_tt_hor_obj);
room_instance_add(argument0,336,112,wall_tt_hor_obj);
room_instance_add(argument0,336,400,wall_tt_hor_obj);
room_instance_add(argument0,304,400,wall_tt_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,128,wall_vert_obj);
room_instance_add(argument0,224,160,wall_vert_obj);
room_instance_add(argument0,256,160,wall_vert_obj);
room_instance_add(argument0,256,128,wall_vert_obj);
room_instance_add(argument0,256,192,wall_vert_obj);
room_instance_add(argument0,256,224,wall_vert_obj);
room_instance_add(argument0,256,320,wall_vert_obj);
room_instance_add(argument0,256,288,wall_vert_obj);
room_instance_add(argument0,256,256,wall_vert_obj);
room_instance_add(argument0,224,192,wall_vert_obj);
room_instance_add(argument0,224,224,wall_vert_obj);
room_instance_add(argument0,224,256,wall_vert_obj);
room_instance_add(argument0,224,288,wall_vert_obj);
room_instance_add(argument0,224,320,wall_vert_obj);
room_instance_add(argument0,224,352,wall_vert_obj);
room_instance_add(argument0,288,128,wall_tt_vert_obj);
room_instance_add(argument0,288,160,wall_tt_vert_obj);
room_instance_add(argument0,288,192,wall_tt_vert_obj);
room_instance_add(argument0,288,224,wall_tt_vert_obj);
room_instance_add(argument0,288,256,wall_tt_vert_obj);
room_instance_add(argument0,288,288,wall_tt_vert_obj);
room_instance_add(argument0,288,320,wall_tt_vert_obj);
room_instance_add(argument0,288,384,wall_tt_vert_obj);
room_instance_add(argument0,352,384,wall_tt_vert_obj);
room_instance_add(argument0,352,128,wall_tt_vert_obj);
room_instance_add(argument0,352,160,wall_tt_vert_obj);
room_instance_add(argument0,352,192,wall_tt_vert_obj);
room_instance_add(argument0,352,224,wall_tt_vert_obj);
room_instance_add(argument0,352,256,wall_tt_vert_obj);
room_instance_add(argument0,352,288,wall_tt_vert_obj);
room_instance_add(argument0,352,320,wall_tt_vert_obj);
room_instance_add(argument0,352,352,wall_tt_vert_obj);
// Torches
// Props
// Not yet
//room_instance_add(argument0,288,368,js_obj);