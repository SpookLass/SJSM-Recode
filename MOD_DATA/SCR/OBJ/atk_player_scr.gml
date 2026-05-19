/*
Argument 0: Player
Argument 1: Attacker
Argument 2: Damage
Argument 3: Damage Alarm
Argument 4: Minimum Damage
Argument 5: Check Collision
Argument 6: Check Hurt
Argument 7: Shake
Argument 8: Possessed
Argument 9: Possessing Player
Argument 10: Damage Stamina
    0: No
    1: Yes, no HP
    2: Yes, as well as HP
*/
local.dokill = (argument4 <= 0);
local.dmg = argument2;
if !argument0.dead_var && !argument0.in_door_var && !argument0.invuln_var && argument0.on_var
&& (!argument0.hurt_var || !argument6) && (argument0.do_stam_var || !argument10)
{
    local.bool = argument5;
    if !local.bool
    {
        local.bool = cyl_coll_scr
        (
            argument0.x,argument0.y,argument0.z,argument0.coll_var[2],argument0.coll_var[1],
            argument1.x,argument1.y,argument1.z,argument1.atk_range_var,argument1.coll_var[1]
        );
    }
    if local.bool
    {
        // Alarm
        if argument3 > 0
        {
            argument0.hurt_var = true;
            with argument0
            { set_alarm_scr(0,argument3); }
        }
        // Effects
        if argument7
        {
            with argument0
            { event_user(0); }
        }
        // Stamina
        if argument10
        {
            if !argument0.do_stam_var { return false; }
            if argument0.stam_var > local.dmg
            {
                local.stam = max(0,argument0.stam_var-local.dmg);
                local.dmg = max(0,local.dmg-argument0.stam_var);
                argument0.stam_var = local.stam;
            }
            // Success
            if argument10 == 1 { return true; }
        }
        // Clamp
        if argument4 <= 0 { local.mindmg = local.dmg; }
        else { local.mindmg = argument4; }
        // Damage
        if argument0.hp_var > local.mindmg
        { argument0.hp_var = max(argument4,argument0.hp_var-local.dmg); }
        // Kill
        else if local.dokill { kill_player_scr(argument0,argument8,argument9); }
        // Success
        return true;
    }
}
return false;