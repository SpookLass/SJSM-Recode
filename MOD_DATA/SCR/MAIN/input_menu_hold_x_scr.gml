/*
Argument 0: Player ID
*/
local.input = input_menu_x_scr(argument0);
if local.input == 0
{
    input_menu_hold_arr[0,argument0] = 0;
    input_menu_hold_arr[1,argument0] = 0;
    input_menu_hold_arr[2,argument0] = true;
}
else
{
    input_menu_hold_arr[0,argument0] += global.time_diff_var;
    input_menu_hold_arr[1,argument0] += global.time_diff_var;
    local.per = median((input_menu_hold_arr[0,argument0]-menu_scroll_start_const)/(menu_scroll_end_const-menu_scroll_start_const),0,1);
    local.rate = lerp_scr(menu_scroll_min_const,menu_scroll_max_const,local.per);
    if input_menu_hold_arr[1,argument0] > local.rate
    {
        input_menu_hold_arr[1,argument0] = mod_scr(input_menu_hold_arr[1,argument0],local.rate);
        return local.input;
    }
    if input_menu_hold_arr[2,argument0]
    {
        input_menu_hold_arr[2,argument0] = false;
        return local.input;
    }
}
return 0;