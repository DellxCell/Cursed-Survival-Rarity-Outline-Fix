// Cursed Survival Rarity Outline Fix 1.0, by DellxCell.
// In Cursed Survival, dropped loot showed a grey outline whatever its rarity.
// The items themselves carry the same rarities as in Survival; the difference
// is a game setting (dvar 0xf7c13201f7e94b73) that Kronos sets to 1 for
// Survival but leaves at 0 for Cursed Survival. This sets it to 1 in Cursed
// Survival matches only, at the start and again 5 seconds in. Nothing else is
// changed, and no Kronos file is replaced.

autoexec crof_init()
{
    if ( !crof_cursed() )
        return;
    crof_apply();
    level thread crof_reapply();
}

function crof_cursed()
{
    return getdvar( @"hash_da1eb79d992f0e28", "null" ) == "zm_rb_r_mod_survival" ||
        getdvar( "g_gametype" ) == "zm_rb_r_mod_survival";
}

function crof_apply()
{
    if ( getdvarint( @"hash_f7c13201f7e94b73", 0 ) != 1 )
        setdvar( @"hash_f7c13201f7e94b73", 1 );
}

function crof_reapply()
{
    level endon( #"game_ended" );
    wait 5;
    crof_apply();
}
