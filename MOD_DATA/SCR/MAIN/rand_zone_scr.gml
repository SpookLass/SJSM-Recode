local.len = irandom_range(60,90);
ds_list_clear(rand_zone_list);
ds_list_shuffle(rand_zonelet_list);
for (local.i=0; local.i<ds_list_size(rand_zonelet_list); local.i+=1;)
{
    local.zonelet = ds_list_find_value(rand_zonelet_list,local.i);
    for (local.j=0; local.j<ds_list_size(local.zonelet); local.j+=1;)
    { ds_list_add(rand_zone_list,ds_list_find_value(local.zonelet,local.j)); }
    if ds_list_size(rand_zone_list) >= local.len { break; }
}