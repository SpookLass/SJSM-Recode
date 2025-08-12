/*
Argument 0, 1 and 2: X, Y, and Z
Argument 3, 4 and 5: Speed, yaw, and pitch
Argument 6, 7, and 8: width, height, and rotation
Argument 9 and 10: Color and Alpha
Argument 11: Whether texture (false) or sprite(true)
Argument 12: Texture
Argument 13 and 14: Sprite and Sprite speed
Argument 15: Time (-1 for eternal, although not recommended)
*/
for (local.i=0; local.i<part_len_var; local.i+=1;)
{
    if !part_arr[local.i,0]
    {
        part_arr[local.i,0] = true;
        part_arr[local.i,1] = argument0;
        part_arr[local.i,2] = argument1;
        part_arr[local.i,3] = argument2;
        part_arr[local.i,4] = argument3;
        part_arr[local.i,5] = argument4;
        part_arr[local.i,6] = argument5;
        part_arr[local.i,7] = argument6;
        part_arr[local.i,8] = argument7;
        part_arr[local.i,9] = argument8;
        part_arr[local.i,10] = argument9;
        part_arr[local.i,11] = argument10;
        part_arr[local.i,12] = argument11;
        part_arr[local.i,13] = argument12;
        part_arr[local.i,14] = argument13;
        part_arr[local.i,15] = argument14;
        part_arr[local.i,17] = argument15;
        return local.i;
    }
}