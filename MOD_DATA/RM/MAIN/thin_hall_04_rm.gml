/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    global.rm_name_var = 'Thin Hall 4'
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 424;
    global.spawn_arr[1,1] = 208;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 0;
    /*global.mark_arr[0,0] = 343;
    global.mark_arr[0,1] = 141;
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
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,208,208,floor_obj);
room_instance_add(argument0,240,208,floor_obj);
room_instance_add(argument0,272,208,floor_obj);
room_instance_add(argument0,304,208,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,272,240,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
room_instance_add(argument0,336,208,floor_obj);
room_instance_add(argument0,336,176,floor_obj);
room_instance_add(argument0,368,208,floor_obj);
room_instance_add(argument0,400,208,floor_obj);
room_instance_add(argument0,432,208,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,208,144,ceil_obj);
room_instance_add(argument0,208,176,ceil_obj);
room_instance_add(argument0,208,208,ceil_obj);
room_instance_add(argument0,240,208,ceil_obj);
room_instance_add(argument0,272,208,ceil_obj);
room_instance_add(argument0,304,208,ceil_obj);
room_instance_add(argument0,272,176,ceil_obj);
room_instance_add(argument0,304,176,ceil_obj);
room_instance_add(argument0,272,240,ceil_obj);
room_instance_add(argument0,304,240,ceil_obj);
room_instance_add(argument0,336,240,ceil_obj);
room_instance_add(argument0,336,208,ceil_obj);
room_instance_add(argument0,336,176,ceil_obj);
room_instance_add(argument0,368,208,ceil_obj);
room_instance_add(argument0,400,208,ceil_obj);
room_instance_add(argument0,432,208,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,136,wall_hor_obj);
room_instance_add(argument0,176,152,wall_hor_obj);
room_instance_add(argument0,208,136,wall_hor_obj);
room_instance_add(argument0,208,216,wall_hor_obj);
room_instance_add(argument0,240,216,wall_hor_obj);
room_instance_add(argument0,232,200,wall_hor_obj);
room_instance_add(argument0,264,200,wall_hor_obj);
room_instance_add(argument0,296,168,wall_hor_obj);
room_instance_add(argument0,328,168,wall_hor_obj);
room_instance_add(argument0,272,248,wall_hor_obj);
room_instance_add(argument0,304,248,wall_hor_obj);
room_instance_add(argument0,336,248,wall_hor_obj);
room_instance_add(argument0,360,200,wall_hor_obj);
room_instance_add(argument0,368,216,wall_hor_obj);
room_instance_add(argument0,400,216,wall_hor_obj);
room_instance_add(argument0,392,200,wall_hor_obj);
room_instance_add(argument0,432,216,wall_hor_obj);
room_instance_add(argument0,424,200,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,192,168,wall_vert_obj);
room_instance_add(argument0,216,152,wall_vert_obj);
room_instance_add(argument0,216,184,wall_vert_obj);
room_instance_add(argument0,192,200,wall_vert_obj);
room_instance_add(argument0,256,232,wall_vert_obj);
room_instance_add(argument0,280,184,wall_vert_obj);
room_instance_add(argument0,344,184,wall_vert_obj);
room_instance_add(argument0,352,232,wall_vert_obj);
room_instance_add(argument0,440,216,wall_vert_obj);
// Torches
// Not yet