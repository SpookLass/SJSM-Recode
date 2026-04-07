/*
Argument 0: Room
*/
if room_exists(argument0) && argument0 != 0
{
    if global.res_override_var
    {
        local.res_w = global.res_override_w_var;
        local.res_h = global.res_override_h_var;
    }
    else
    {
        local.res_w = global.res_w_var;
        local.res_h = global.res_h_var;
    }
    room_set_view_enabled(argument0,true);
    for (local.i=0; local.i<8; local.i+=1;)
    { room_set_view(argument0,local.i,false,0,0,0,0,0,0,0,0,32,32,-1,-1,noone); }
    // room_set_view(argument0,local.i,false,0,0,local.res_w,local.res_h,0,0,local.res_w,local.res_h,32,32,-1,-1,noone);
    switch global.player_len_var
    {
        case 2:
        {
            if global.splitscreen_var
            {
                room_set_view(argument0,0,true,0,0,local.res_w,local.res_h/2,0,0,local.res_w,local.res_h/2,32,32,-1,-1,noone);
                room_set_view(argument0,1,true,0,local.res_h/2,local.res_w,local.res_h/2,0,local.res_h/2,local.res_w,local.res_h/2,32,32,-1,-1,noone);
            }
            else
            {
                room_set_view(argument0,0,true,0,0,local.res_w/2,local.res_h,0,0,local.res_w/2,local.res_h,32,32,-1,-1,noone);
                room_set_view(argument0,1,true,local.res_w/2,0,local.res_w/2,local.res_h,local.res_w/2,0,local.res_w/2,local.res_h,32,32,-1,-1,noone);
            }
            break;
        }
        case 3:
        {
            room_set_view(argument0,0,true,0,0,local.res_w,local.res_h/2,0,0,local.res_w,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,1,true,0,local.res_h/2,local.res_w/2,local.res_h/2,0,local.res_h/2,local.res_w/2,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,2,true,local.res_w/2,local.res_h/2,local.res_w/2,local.res_h/2,local.res_w/2,local.res_h/2,local.res_w/2,local.res_h/2,32,32,-1,-1,noone);
            break;
        }
        case 4:
        {
            room_set_view(argument0,0,true,0,0,local.res_w/2,local.res_h/2,0,0,local.res_w/2,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,1,true,local.res_w/2,0,local.res_w/2,local.res_h/2,local.res_w/2,0,local.res_w/2,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,2,true,0,local.res_h/2,local.res_w/2,local.res_h/2,0,local.res_h/2,local.res_w/2,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,3,true,local.res_w/2,local.res_h/2,local.res_w/2,local.res_h/2,local.res_w/2,local.res_h/2,local.res_w/2,local.res_h/2,32,32,-1,-1,noone);
            break;
        }
        case 5:
        {
            room_set_view(argument0,0,true,0,0,local.res_w/2,local.res_h/2,0,0,local.res_w/2,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,1,true,local.res_w/2,0,local.res_w/2,local.res_h/2,local.res_w/2,0,local.res_w/2,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,2,true,0,local.res_h/2,local.res_w/3,local.res_h/2,0,local.res_h/2,local.res_w/3,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,3,true,local.res_w/3,local.res_h/2,local.res_w/3,local.res_h/2,local.res_w/3,local.res_h/2,local.res_w/3,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,4,true,local.res_w*2/3,local.res_h/2,local.res_w/3,local.res_h/2,local.res_w*2/3,local.res_h/2,local.res_w/3,local.res_h/2,32,32,-1,-1,noone);
            break;
        }
        case 6:
        {
            room_set_view(argument0,0,true,0,0,local.res_w/3,local.res_h/2,0,0,local.res_w/3,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,1,true,local.res_w/3,0,local.res_w/3,local.res_h/2,local.res_w/3,0,local.res_w/3,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,2,true,local.res_w*2/3,0,local.res_w/3,local.res_h/2,local.res_w*2/3,0,local.res_w/3,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,3,true,0,local.res_h/2,local.res_w/3,local.res_h/2,0,local.res_h/2,local.res_w/3,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,4,true,local.res_w/3,local.res_h/2,local.res_w/3,local.res_h/2,local.res_w/3,local.res_h/2,local.res_w/3,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,5,true,local.res_w*2/3,local.res_h/2,local.res_w/3,local.res_h/2,local.res_w*2/3,local.res_h/2,local.res_w/3,local.res_h/2,32,32,-1,-1,noone);
            break;
        }
        case 7:
        {
            room_set_view(argument0,0,true,0,0,local.res_w/3,local.res_h/2,0,0,local.res_w/3,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,1,true,local.res_w/3,0,local.res_w/3,local.res_h/2,local.res_w/3,0,local.res_w/3,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,2,true,local.res_w*2/3,0,local.res_w/3,local.res_h/2,local.res_w*2/3,0,local.res_w/3,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,3,true,0,local.res_h/2,local.res_w/4,local.res_h/2,0,local.res_h/2,local.res_w/4,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,4,true,local.res_w/4,local.res_h/2,local.res_w/4,local.res_h/2,local.res_w/4,local.res_h/2,local.res_w/4,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,5,true,local.res_w/2,local.res_h/2,local.res_w/4,local.res_h/2,local.res_w/2,local.res_h/2,local.res_w/4,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,6,true,local.res_w*3/4,local.res_h/2,local.res_w/4,local.res_h/2,local.res_w*3/4,local.res_h/2,local.res_w/4,local.res_h/2,32,32,-1,-1,noone);
            break;
        }
        case 8:
        {
            room_set_view(argument0,0,true,0,0,local.res_w/4,local.res_h/2,0,0,local.res_w/4,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,1,true,local.res_w/4,0,local.res_w/4,local.res_h/2,local.res_w/4,0,local.res_w/4,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,2,true,local.res_w/2,0,local.res_w/4,local.res_h/2,local.res_w/2,0,local.res_w/4,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,3,true,local.res_w*3/4,0,local.res_w/4,local.res_h/2,local.res_w*3/4,0,local.res_w/4,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,4,true,0,local.res_h/2,local.res_w/4,local.res_h/2,0,local.res_h/2,local.res_w/4,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,5,true,local.res_w/4,local.res_h/2,local.res_w/4,local.res_h/2,local.res_w/4,local.res_h/2,local.res_w/4,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,6,true,local.res_w/2,local.res_h/2,local.res_w/4,local.res_h/2,local.res_w/2,local.res_h/2,local.res_w/4,local.res_h/2,32,32,-1,-1,noone);
            room_set_view(argument0,7,true,local.res_w*3/4,local.res_h/2,local.res_w/4,local.res_h/2,local.res_w*3/4,local.res_h/2,local.res_w/4,local.res_h/2,32,32,-1,-1,noone);
            break;
        }
        default:
        {
            room_set_view(argument0,0,true,0,0,local.res_w,local.res_h,0,0,local.res_w,local.res_h,32,32,-1,-1,noone);
            break;
        }
    }
    room_goto(argument0);
    return true;
}
else
{
    show_error("Invalid room",false);
    return -1;
}