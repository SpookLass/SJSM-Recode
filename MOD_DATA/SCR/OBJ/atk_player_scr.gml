/*
Argument 0: Player
Argument 1: Attacker
Argument 2: Damage
Argument 3: Damage Alarm
Argument 4: Minimum Damage
Argument 5: Check Collision
Argument 6: Attack Range
Argument 7: Check Hurt
Argument 8: Shake
Argument 9: Possessed
Argument 10: Possessing Player
Argument 11: Damage Stamina
    0: No
    1: Yes, no HP
    2: Yes, as well as HP
*/
local.dokill = (argument4 <= 0);
local.dmg = argument2;
if !argument0.dead_var && !argument0.in_door_var && !argument0.invuln_var && argument0.on_var
&& (!argument0.hurt_var || !argument7) && (argument0.do_stam_var || !argument11)
{
    local.bool = !argument5;
    if !local.bool
    {
        local.bool = cyl_coll_scr
        (
            argument0.x,argument0.y,argument0.z,argument0.coll_var[2],argument0.coll_var[1],
            argument1.x,argument1.y,argument1.z,argument6,argument1.coll_var[1]
        );
    }
    if local.bool
    {
        argument0.hurt_target_var = argument1;
        // Alarm
        if argument3 > 0
        {
            argument0.hurt_var = true;
            with argument0
            { set_alarm_scr(0,argument3); }
        }
        // Effects
        if argument8
        {
            // Will this work?
            with argument0
            { event_user(0); }
        }
        // Stamina
        if argument11
        {
            if argument0.stam_var > local.dmg
            {
                local.stam = max(0,argument0.stam_var-local.dmg);
                local.dmg = max(0,local.dmg-argument0.stam_var);
                argument0.stam_var = local.stam;
            }
            // Success
            if argument11 == 1 { return true; }
        }
        // Clamp
        if argument4 <= 0 { local.mindmg = local.dmg; }
        else { local.mindmg = argument4; }
        // Damage
        if argument0.hp_var > local.mindmg
        { argument0.hp_var = max(argument4,argument0.hp_var-local.dmg); }
        // Kill
        else if local.dokill
        {
            if argument9 { argument1.possess_var = false; }
            kill_player_scr(argument0,argument9,argument10);
        }
        // Success
        return true;
    }
}
return false;