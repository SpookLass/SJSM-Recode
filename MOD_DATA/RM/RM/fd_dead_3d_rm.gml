/*
Argument 0: Room Variable (same for all rooms)
*/
room_set_code
(
    argument0,
    '
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","dead","ROOM_dead");
    ini_close();
    // Spawns
    global.spawn_len_var = 1;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;    // X
    global.spawn_arr[0,1] = 288;    // Y
    global.spawn_arr[0,2] = 0;      // Z
    global.spawn_arr[0,3] = 0;      // Angle (0 is right, 90 is up, etc)
    global.spawn_arr[0,4] = noone;
    global.spawn_arr[0,5] = noone;
    // Fake Walls
    for (local.i=0; local.i<6; local.i+=1;)
    {
        switch local.i
        {
            case 0: { local.xtmp = 464; local.ytmp = 144; break; }
            case 1: { local.xtmp = 496; local.ytmp = 144; break; }
            case 2: { local.xtmp = 528; local.ytmp = 144; break; }
            case 3: { local.xtmp = 464; local.ytmp = 176; break; }
            case 4: { local.xtmp = 496; local.ytmp = 176; break; }
            default: { local.xtmp = 528; local.ytmp = 176; break; }
        }
        with instance_create(local.xtmp,local.ytmp,load_par_obj.fd_dead_wall_fake_obj)
        {
            direction = 90;
            solid_var = false;
            visible = false;
        }
    }
    // Teleports
    with instance_create(544,384,tp_origin_obj)
    { id_var = 0; direction = 180; }
    with instance_create(704,64,tp_origin_obj)
    { id_var = 1; direction = 0; }
    with instance_create(384,384,load_par_obj.fd_dead_tp_trig_obj)
    { id_var = 0; direction = 180; }
    with instance_create(544,64,load_par_obj.fd_dead_tp_trig_obj)
    { id_var = 1; direction = 0; swap_var = true; }
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
');
// Room settings
room_set_width(argument0,1280);
room_set_height(argument0,720);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Stuff
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,368,160,argument1.fd_dead_3d_obj);
room_instance_add(argument0,176,288,player_dead_obj);
room_instance_add(argument0,128,144,argument1.fd_dead_overlay_obj);
// Floors
room_instance_add(argument0,176,288,argument1.fd_dead_floor_obj);
room_instance_add(argument0,208,288,argument1.fd_dead_floor_obj);
room_instance_add(argument0,240,288,argument1.fd_dead_floor_obj);
room_instance_add(argument0,240,256,argument1.fd_dead_floor_obj);
room_instance_add(argument0,240,320,argument1.fd_dead_floor_obj);
room_instance_add(argument0,272,256,argument1.fd_dead_floor_obj);
room_instance_add(argument0,272,288,argument1.fd_dead_floor_obj);
room_instance_add(argument0,272,320,argument1.fd_dead_floor_obj);
room_instance_add(argument0,304,320,argument1.fd_dead_floor_obj);
room_instance_add(argument0,336,320,argument1.fd_dead_floor_obj);
room_instance_add(argument0,336,288,argument1.fd_dead_floor_obj);
room_instance_add(argument0,304,288,argument1.fd_dead_floor_obj);
room_instance_add(argument0,304,256,argument1.fd_dead_floor_obj);
room_instance_add(argument0,336,256,argument1.fd_dead_floor_obj);
room_instance_add(argument0,368,288,argument1.fd_dead_floor_obj);
room_instance_add(argument0,400,288,argument1.fd_dead_floor_obj);
room_instance_add(argument0,432,288,argument1.fd_dead_floor_obj);
room_instance_add(argument0,432,320,argument1.fd_dead_floor_obj);
room_instance_add(argument0,432,352,argument1.fd_dead_floor_obj);
room_instance_add(argument0,432,384,argument1.fd_dead_floor_obj);
room_instance_add(argument0,400,384,argument1.fd_dead_floor_obj);
room_instance_add(argument0,368,384,argument1.fd_dead_floor_obj);
room_instance_add(argument0,336,384,argument1.fd_dead_floor_obj);
room_instance_add(argument0,336,352,argument1.fd_dead_floor_obj);
room_instance_add(argument0,496,384,argument1.fd_dead_floor_obj);
room_instance_add(argument0,496,352,argument1.fd_dead_floor_obj);
room_instance_add(argument0,528,384,argument1.fd_dead_floor_obj);
room_instance_add(argument0,560,384,argument1.fd_dead_floor_obj);
room_instance_add(argument0,592,384,argument1.fd_dead_floor_obj);
room_instance_add(argument0,592,352,argument1.fd_dead_floor_obj);
room_instance_add(argument0,496,320,argument1.fd_dead_floor_obj);
room_instance_add(argument0,496,288,argument1.fd_dead_floor_obj);
room_instance_add(argument0,496,256,argument1.fd_dead_floor_obj);
room_instance_add(argument0,464,224,argument1.fd_dead_floor_obj);
room_instance_add(argument0,496,224,argument1.fd_dead_floor_obj);
room_instance_add(argument0,528,224,argument1.fd_dead_floor_obj);
room_instance_add(argument0,528,192,argument1.fd_dead_floor_obj);
room_instance_add(argument0,496,192,argument1.fd_dead_floor_obj);
room_instance_add(argument0,464,192,argument1.fd_dead_floor_obj);
room_instance_add(argument0,464,160,argument1.fd_dead_floor_obj);
room_instance_add(argument0,496,160,argument1.fd_dead_floor_obj);
room_instance_add(argument0,528,160,argument1.fd_dead_floor_obj);
room_instance_add(argument0,528,128,argument1.fd_dead_floor_obj);
room_instance_add(argument0,496,128,argument1.fd_dead_floor_obj);
room_instance_add(argument0,464,128,argument1.fd_dead_floor_obj);
room_instance_add(argument0,496,96,argument1.fd_dead_floor_obj);
room_instance_add(argument0,496,64,argument1.fd_dead_floor_obj);
room_instance_add(argument0,528,64,argument1.fd_dead_floor_obj);
room_instance_add(argument0,560,64,argument1.fd_dead_floor_obj);
room_instance_add(argument0,592,64,argument1.fd_dead_floor_obj);
room_instance_add(argument0,592,96,argument1.fd_dead_floor_obj);
room_instance_add(argument0,656,96,argument1.fd_dead_floor_obj);
room_instance_add(argument0,656,64,argument1.fd_dead_floor_obj);
room_instance_add(argument0,688,64,argument1.fd_dead_floor_obj);
room_instance_add(argument0,720,64,argument1.fd_dead_floor_obj);
room_instance_add(argument0,752,64,argument1.fd_dead_floor_obj);
room_instance_add(argument0,752,96,argument1.fd_dead_floor_obj);
room_instance_add(argument0,752,128,argument1.fd_dead_floor_obj);
room_instance_add(argument0,752,160,argument1.fd_dead_floor_obj);
room_instance_add(argument0,720,160,argument1.fd_dead_floor_obj);
room_instance_add(argument0,688,160,argument1.fd_dead_floor_obj);
room_instance_add(argument0,656,160,argument1.fd_dead_floor_obj);
room_instance_add(argument0,624,160,argument1.fd_dead_floor_obj);
room_instance_add(argument0,592,160,argument1.fd_dead_floor_obj);
room_instance_add(argument0,560,160,argument1.fd_dead_floor_obj);
room_instance_add(argument0,400,160,argument1.fd_dead_floor_obj);
room_instance_add(argument0,368,160,argument1.fd_dead_floor_obj);
room_instance_add(argument0,432,160,argument1.fd_dead_floor_obj);
// Ceilings
room_instance_add(argument0,176,288,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,208,288,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,240,288,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,240,256,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,240,320,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,272,256,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,272,288,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,272,320,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,304,320,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,336,320,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,336,288,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,304,288,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,304,256,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,336,256,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,368,288,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,400,288,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,432,288,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,432,320,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,432,352,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,432,384,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,400,384,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,368,384,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,336,384,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,336,352,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,496,384,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,496,352,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,528,384,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,560,384,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,592,384,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,592,352,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,496,320,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,496,288,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,496,256,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,464,224,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,496,224,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,528,224,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,528,192,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,496,192,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,464,192,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,464,160,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,496,160,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,528,160,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,528,128,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,496,128,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,464,128,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,496,96,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,496,64,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,528,64,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,560,64,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,592,64,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,592,96,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,656,96,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,656,64,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,688,64,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,720,64,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,752,64,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,752,96,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,752,128,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,752,160,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,720,160,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,688,160,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,656,160,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,624,160,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,592,160,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,560,160,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,400,160,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,368,160,argument1.fd_dead_ceil_obj);
room_instance_add(argument0,432,160,argument1.fd_dead_ceil_obj);
// Walls (Vertical)
room_instance_add(argument0,160,288,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,224,320,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,352,320,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,320,352,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,320,384,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,448,384,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,448,352,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,416,352,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,416,320,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,448,320,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,448,288,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,224,256,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,352,256,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,576,352,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,608,352,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,352,160,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,448,128,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,448,192,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,448,224,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,544,224,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,544,192,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,544,128,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,480,96,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,512,96,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,608,96,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,608,64,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,640,64,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,640,96,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,672,96,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,768,96,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,768,160,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,768,128,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,736,128,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,736,96,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,768,64,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,480,64,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,480,256,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,480,288,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,480,320,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,480,352,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,480,384,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,512,352,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,512,320,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,512,288,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,512,256,argument1.fd_dead_wall_vert_obj);
room_instance_add(argument0,608,384,argument1.fd_dead_wall_vert_obj);
// Walls (Horizontal)
room_instance_add(argument0,240,240,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,208,272,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,176,272,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,176,304,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,208,304,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,240,336,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,272,240,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,304,240,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,336,240,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,336,336,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,304,336,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,272,336,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,368,368,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,400,368,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,336,400,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,368,400,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,400,400,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,432,400,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,432,272,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,400,304,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,368,304,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,400,272,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,368,272,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,592,336,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,560,368,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,528,368,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,496,400,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,528,400,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,560,400,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,592,400,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,528,240,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,464,240,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,464,112,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,528,112,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,592,112,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,496,48,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,528,48,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,560,48,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,592,48,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,656,112,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,656,48,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,688,80,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,720,80,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,688,48,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,720,48,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,752,48,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,752,176,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,720,144,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,688,144,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,400,144,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,368,144,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,368,176,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,400,176,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,432,144,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,432,176,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,560,144,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,592,144,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,624,144,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,656,144,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,528,80,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,560,80,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,560,176,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,592,176,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,624,176,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,656,176,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,688,176,argument1.fd_dead_wall_hor_obj);
room_instance_add(argument0,720,176,argument1.fd_dead_wall_hor_obj);
// Extra
room_instance_add(argument0,448,160,argument1.fd_dead_wall_fake_obj);
room_instance_add(argument0,544,160,argument1.fd_dead_wall_fake_obj);