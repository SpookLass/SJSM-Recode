for (local.i=0; local.i<global.mark_len_var; local.i+=1;)
{
    global.mark_len_var = -1;
    global.mark_arr[local.i,0] = 0;
    global.mark_arr[local.i,1] = 0;
    global.mark_arr[local.i,2] = 0;
    global.mark_arr[local.i,3] = false;
}
for (local.i=0; local.i<global.js_mark_len_var; local.i+=1;)
{
    global.js_mark_len_var = -1;
    global.js_mark_arr[local.i,0] = 0;
    global.js_mark_arr[local.i,1] = 0;
    global.js_mark_arr[local.i,2] = 0;
    global.js_mark_arr[local.i,3] = 0;
    global.js_mark_arr[local.i,4] = false;
}