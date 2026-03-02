/*
Argument 0: Loading text
Only used on the loading screen when loading assets
*/
if current_time != global.last_time_var
{
    draw_clear_alpha(c_black,0);
    draw_str_scr(argument0,0,-54,1,1,0.125,fa_center,fa_bottom,0);
    screen_refresh();
    io_handle();
    global.last_time_var = current_time;
}