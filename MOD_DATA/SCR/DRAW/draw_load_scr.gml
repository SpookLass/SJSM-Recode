/*
Argument 0: Loading text
Only used on the loading screen when loading assets
*/
if current_time != global.last_time_var
{
    draw_clear_alpha(c_black,0);
    draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,argument0,1,1,0);
    screen_refresh();
    //io_handle();
    global.last_time_var = current_time;
}