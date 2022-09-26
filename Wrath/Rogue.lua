if UnitClassBase( 'player' ) ~= 'ROGUE' then return end

local addon, ns = ...
local Hekili = _G[ addon ]
local class, state = Hekili.Class, Hekili.State

local spec = Hekili:NewSpecialization( 4 )

spec:RegisterResource( Enum.PowerType.ComboPoints )
spec:RegisterResource( Enum.PowerType.Energy )

-- Talents
spec:RegisterTalents( {
    adrenaline_rush            = {   205, 1, 13750 },
    aggression                 = {  1122, 5, 18427, 18428, 18429, 61330, 61331 },
    blade_flurry               = {   223, 1, 13877 },
    blade_twisting             = {  1706, 2, 31124, 31126 },
    blood_spatter              = {  2068, 2, 51632, 51633 },
    camouflage                 = {   244, 3, 13975, 14062, 14063 },
    cheat_death                = {  1722, 3, 31228, 31229, 31230 },
    close_quarters_combat      = {   182, 5, 13706, 13804, 13805, 13806, 13807 },
    cold_blood                 = {   280, 1, 14177 },
    combat_potency             = {  1825, 5, 35541, 35550, 35551, 35552, 35553 },
    cut_to_the_chase           = {  2070, 5, 51664, 51665, 51667, 51668, 51669 },
    deadened_nerves            = {  1723, 3, 31380, 31382, 31383 },
    deadliness                 = {  1702, 5, 30902, 30903, 30904, 30905, 30906 },
    deadly_brew                = {  2065, 2, 51625, 51626 },
    deflection                 = {   187, 3, 13713, 13853, 13854 },
    dirty_deeds                = {   265, 2, 14082, 14083 },
    dirty_tricks               = {   262, 2, 14076, 14094 },
    dual_wield_specialization  = {   221, 5, 13715, 13848, 13849, 13851, 13852 },
    elusiveness                = {   247, 2, 13981, 14066 },
    endurance                  = {   204, 2, 13742, 13872 },
    enveloping_shadows         = {  1711, 3, 31211, 31212, 31213 },
    filthy_tricks              = {  2079, 2, 58414, 58415 },
    find_weakness              = {  1718, 3, 31234, 31235, 31236 },
    fleet_footed               = {  1721, 2, 31208, 31209 },
    focused_attacks            = {  2069, 3, 51634, 51635, 51636 },
    ghostly_strike             = {   303, 1, 14278 },
    hack_and_slash             = {   242, 5, 13960, 13961, 13962, 13963, 13964 },
    heightened_senses          = {  1701, 2, 30894, 30895 },
    hemorrhage                 = {   681, 1, 16511 },
    honor_among_thieves        = {  2078, 3, 51698, 51700, 51701 },
    hunger_for_blood           = {  2071, 1, 51662 },
    improved_ambush            = {   263, 2, 14079, 14080 },
    improved_eviscerate        = {   276, 3, 14162, 14163, 14164 },
    improved_expose_armor      = {   278, 2, 14168, 14169 },
    improved_gouge             = {   203, 3, 13741, 13793, 13792 },
    improved_kick              = {   206, 2, 13754, 13867 },
    improved_kidney_shot       = {   279, 3, 14174, 14175, 14176 },
    improved_poisons           = {   268, 5, 14113, 14114, 14115, 14116, 14117 },
    improved_sinister_strike   = {   201, 2, 13732, 13863 },
    improved_slice_and_dice    = {  1827, 2, 14165, 14166 },
    improved_sprint            = {   222, 2, 13743, 13875 },
    initiative                 = {   245, 3, 13976, 13979, 13980 },
    killing_spree              = {  2076, 1, 51690 },
    lethality                  = {   269, 5, 14128, 14132, 14135, 14136, 14137 },
    lightning_reflexes         = {   186, 3, 13712, 13788, 13789 },
    mace_specialization        = {   184, 5, 13709, 13800, 13801, 13802, 13803 },
    malice                     = {   270, 5, 14138, 14139, 14140, 14141, 14142 },
    master_of_deception        = {   241, 3, 13958, 13970, 13971 },
    master_of_subtlety         = {  1713, 3, 31221, 31222, 31223 },
    master_poisoner            = {  1715, 3, 31226, 31227, 58410 },
    murder                     = {   274, 2, 14158, 14159 },
    mutilate                   = {  1719, 1,  1329 },
    nerves_of_steel            = {  1707, 2, 31130, 31131 },
    opportunity                = {   261, 2, 14057, 14072 },
    overkill                   = {   281, 1, 58426 },
    precision                  = {   181, 5, 13705, 13832, 13843, 13844, 13845 },
    premeditation              = {   381, 1, 14183 },
    preparation                = {   284, 1, 14185 },
    prey_on_the_weak           = {  2075, 5, 51685, 51686, 51687, 51688, 51689 },
    puncturing_wounds          = {   277, 3, 13733, 13865, 13866 },
    quick_recovery             = {  1762, 2, 31244, 31245 },
    relentless_strikes         = {  2244, 5, 14179, 58422, 58423, 58424, 58425 },
    remorseless_attacks        = {   272, 2, 14144, 14148 },
    riposte                    = {   301, 1, 14251 },
    ruthlessness               = {   273, 3, 14156, 14160, 14161 },
    savage_combat              = {  2074, 2, 51682, 58413 },
    seal_fate                  = {   283, 5, 14186, 14190, 14193, 14194, 14195 },
    serrated_blades            = {  1123, 3, 14171, 14172, 14173 },
    setup                      = {   246, 3, 13983, 14070, 14071 },
    shadow_dance               = {  2081, 1, 51713 },
    shadowstep                 = {  1714, 1, 36554 },
    sinister_calling           = {  1712, 5, 31216, 31217, 31218, 31219, 31220 },
    slaughter_from_the_shadows = {  2080, 5, 51708, 51709, 51710, 51711, 51712 },
    sleight_of_hand            = {  1700, 2, 30892, 30893 },
    surprise_attacks           = {  1709, 1, 32601 },
    throwing_specialization    = {  2072, 2,  5952, 51679 },
    turn_the_tables            = {  2066, 3, 51627, 51628, 51629 },
    unfair_advantage           = {  2073, 2, 51672, 51674 },
    vigor                      = {   382, 1, 14983 },
    vile_poisons               = {   682, 3, 16513, 16514, 16515 },
    vitality                   = {  1705, 3, 31122, 31123, 61329 },
    waylay                     = {  2077, 2, 51692, 51696 },
    weapon_expertise           = {  1703, 2, 30919, 30920 },
} )


-- Auras
spec:RegisterAuras( {
    -- Energy regeneration increased by $s1%.
    adrenaline_rush = {
        id = 13750,
        duration = 15,
        max_stack = 1,
    },
    -- Attack speed increased by $s1%.  Weapon attacks strike an additional nearby opponent.
    blade_flurry = {
        id = 13877,
        duration = 15,
        max_stack = 1,
    },
    -- Dazed.
    blade_twisting = {
        id = 51585,
        duration = 8,
        max_stack = 1,
        copy = { 51585, 31125 },
    },
    -- Disoriented.
    blind = {
        id = 2094,
        duration = 10,
        max_stack = 1,
    },
    -- Stunned.
    cheap_shot = {
        id = 1833,
        duration = 4,
        max_stack = 1,
    },
    -- Increases chance to resist spells by $s1%.
    cloak_of_shadows = {
        id = 31224,
        duration = 5,
        max_stack = 1,
    },
    -- Critical strike chance of your next offensive ability increased by $s1%.
    cold_blood = {
        id = 14177,
        duration = 3600,
        max_stack = 1,
    },
    -- Movement slowed by $s2%.
    deadly_throw = {
        id = 48674,
        duration = 6,
        max_stack = 1,
        copy = { 26679, 48673, 48674 },
    },
    -- Detecting traps.
    detect_traps = {
        id = 2836,
        duration = 3600,
        max_stack = 1,
    },
    dirty_tricks = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=14094)
        id = 14094,
        duration = 3600,
        max_stack = 1,
        copy = { 14094, 14076 },
    },
    -- Disarmed.
    dismantle = {
        id = 51722,
        duration = 10,
        max_stack = 1,
    },
    dual_wield_specialization = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=13852)
        id = 13852,
        duration = 3600,
        max_stack = 1,
        copy = { 13852, 13851, 13849, 13848, 13715 },
    },
    -- Chance to apply Deadly Poison increased by $s3% and frequency of applying Instant Poison increased by $s2%.
    envenom = {
        id = 57993,
        duration = 1,
        max_stack = 1,
        copy = { 32645, 32684, 57992, 57993 },
    },
    -- Dodge chance increased by $s1% and chance ranged attacks hit you reduced by $s2%.
    evasion = {
        id = 26669,
        duration = 15,
        max_stack = 1,
        copy = { 5277, 26669, 67354, 67378, 67380 },
    },
    -- $s2% reduced damage taken from area of effect attacks.
    feint = {
        id = 48659,
        duration = 6,
        max_stack = 1,
        copy = { 48659 },
    },
    -- $s1 damage every $t1 seconds.
    garrote = {
        id = 48676,
        duration = 18,
        tick_time = 3,
        max_stack = 1,
        copy = { 703, 8631, 8632, 8633, 8818, 11289, 11290, 26839, 26884, 48675, 48676 },
    },
    -- Silenced.
    garrote_silence = {
        id = 1330,
        duration = 3,
        max_stack = 1,
    },
    -- Dodge chance increased by $s2%.
    ghostly_strike = {
        id = 14278,
        duration = 7,
        max_stack = 1,
    },
    -- Incapacitated.
    gouge = {
        id = 1776,
        duration = 4,
        max_stack = 1,
    },
    heightened_senses = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=30895)
        id = 30895,
        duration = 3600,
        max_stack = 1,
        copy = { 30895, 30894 },
    },
    -- Increases damage taken by $s3.
    hemorrhage = {
        id = 16511,
        duration = 15,
        max_stack = 1,
        copy = { 16511, 17347, 17348, 26864, 48660 },
    },
    honor_among_thieves = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=52916)
        id = 52916,
        duration = 8,
        max_stack = 1,
    },
    improved_gouge = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=13793)
        id = 13793,
        duration = 3600,
        max_stack = 1,
        copy = { 13793, 13792, 13741 },
    },
    improved_kick = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=13867)
        id = 13867,
        duration = 3600,
        max_stack = 1,
        copy = { 13867, 13754 },
    },
    improved_kidney_shot = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=14176)
        id = 14176,
        duration = 3600,
        max_stack = 1,
        copy = { 14176, 14175, 14174 },
    },
    improved_sinister_strike = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=13863)
        id = 13863,
        duration = 3600,
        max_stack = 1,
        copy = { 13863, 13732 },
    },
    improved_sprint = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=13875)
        id = 13875,
        duration = 3600,
        max_stack = 1,
        copy = { 13875, 13743 },
    },
    kick = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=1766)
        id = 1766,
        duration = 5,
        max_stack = 1,
    },
    -- Stunned.
    kidney_shot = {
        id = 8643,
        duration = 1,
        max_stack = 1,
        copy = { 408, 8643, 27615, 30621 },
    },
    -- Attacking an enemy every $t1 sec.  Damage dealt increased by $61851s3%.
    killing_spree = {
        id = 51690,
        duration = 2,
        tick_time = 0.5,
        max_stack = 1,
    },
    malice = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=14142)
        id = 14142,
        duration = 3600,
        max_stack = 1,
        copy = { 14142, 14141, 14140, 14139, 14138 },
    },
    master_of_subtlety = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=31223)
        id = 31223,
        duration = 3600,
        max_stack = 1,
        copy = { 31223, 31222, 31221 },
    },
    premeditation = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=14183)
        id = 14183,
        duration = 20,
        max_stack = 1,
    },
    -- Critical strike chance for your next Sinister Strike, Backstab, Mutilate, Ambush, Hemorrhage, or Ghostly strike increased by $s1%.
    remorseless = {
        id = 14149,
        duration = 20,
        max_stack = 1,
        copy = { 14143, 14149 },
    },
    remorseless_attacks = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=14148)
        id = 14148,
        duration = 3600,
        max_stack = 1,
        copy = { 14148, 14144 },
    },
    -- Melee attack speed slowed by $s2%.
    riposte = {
        id = 14251,
        duration = 30,
        max_stack = 1,
    },
    -- Causes damage every $t1 seconds.
    rupture = {
        id = 48672,
        duration = 6,
        tick_time = 2,
        max_stack = 1,
        copy = { 1943, 8639, 8640, 11273, 11274, 11275, 26867, 48671, 48672 },
    },
    ruthlessness = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=14161)
        id = 14161,
        duration = 3600,
        max_stack = 1,
        copy = { 14161, 14160, 14156 },
    },
    -- Sapped.
    sap = {
        id = 51724,
        duration = 60,
        max_stack = 1,
        copy = { 2070, 6770, 11297, 51724 },
    },
    -- Increases physical damage taken by $s1%.
    savage_combat = {
        id = 58684,
        duration = 3600,
        max_stack = 1,
        copy = { 58683, 58684 },
    },
    -- Can use opening abilities without being stealthed.
    shadow_dance = {
        id = 51713,
        duration = 6,
        max_stack = 1,
    },
    shadowstep = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=44373)
        id = 44373,
        duration = 10,
        max_stack = 1,
        copy = { 44373, 36563, 36554 },
    },
    -- Silenced.
    silenced_improved_kick = {
        id = 18425,
        duration = 2,
        max_stack = 1,
    },
    sleight_of_hand = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=30893)
        id = 30893,
        duration = 3600,
        max_stack = 1,
        copy = { 30893, 30892 },
    },
    -- Melee attack speed increased by $s2%.
    slice_and_dice = {
        id = 6774,
        duration = 6,
        max_stack = 1,
        copy = { 5171, 6434, 6774, 60847 },
    },
    -- Movement speed increased by $w1%.
    sprint = {
        id = 11305,
        duration = 15,
        max_stack = 1,
        copy = { 2983, 8696, 11305, 48594, 56354 },
    },
    -- Stealthed.  Movement slowed by $s3%.
    stealth = {
        id = 1784,
        duration = 3600,
        max_stack = 1,
    },
    throwing_specialization = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=51680)
        id = 51680,
        duration = 3,
        max_stack = 1,
    },
    -- The threat caused by your next damaging attack and all actions taken for $57933d afterwards will be transferred to the target.  In addition, all damage caused by the target is increased by $57933s1% during this time.
    tricks_of_the_trade = {
        id = 57934,
        duration = 30,
        max_stack = 1,
    },
    -- $s1% increased critical strike chance with combo moves.
    turn_the_tables = {
        id = 52915,
        duration = 8,
        max_stack = 1,
        copy = { 52915, 52914, 52910 },
    },
    -- Time between melee and ranged attacks increased by $s1%.    Movement speed reduced by $s2%.
    waylay = {
        id = 51693,
        duration = 8,
        max_stack = 1,
    },
    weapon_expertise = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=30920)
        id = 30920,
        duration = 3600,
        max_stack = 1,
        copy = { 30920, 30919 },
    },
} )


-- Abilities
spec:RegisterAbilities( {
    --
    adrenaline_rush = {
        id = 13750,
        cast = 0,
        cooldown = 180,
        gcd = "totem",

        spend = 0,
        spendType = "energy",

        talent = "adrenaline_rush",
        startsCombat = true,
        texture = 136206,

        toggle = "cooldowns",

        handler = function ()
        end,
    },


    -- Ambush the target, causing 275% weapon damage plus 509 to the target.  Must be stealthed and behind the target.  Requires a dagger in the main hand.  Awards 2 combo points.
    ambush = {
        id = 48689,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 60,
        spendType = "energy",

        startsCombat = true,
        texture = 132282,

        handler = function ()
        end,
    },


    -- Backstab the target, causing 150% weapon damage plus 255 to the target.  Must be behind the target.  Requires a dagger in the main hand.  Awards 1 combo point.
    backstab = {
        id = 26863,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 60,
        spendType = "energy",

        startsCombat = true,
        texture = 132090,

        handler = function ()
        end,
    },


    --
    blade_flurry = {
        id = 13877,
        cast = 0,
        cooldown = 120,
        gcd = "totem",

        spend = 25,
        spendType = "energy",

        talent = "blade_flurry",
        startsCombat = true,
        texture = 132350,

        toggle = "cooldowns",

        handler = function ()
        end,
    },


    -- Blinds the target, causing it to wander disoriented for up to 10 sec.  Any damage caused will remove the effect.
    blind = {
        id = 2094,
        cast = 0,
        cooldown = 180,
        gcd = "totem",

        spend = 30,
        spendType = "energy",

        startsCombat = true,
        texture = 136175,

        toggle = "cooldowns",

        handler = function ()
        end,
    },


    -- Stuns the target for 4 sec.  Must be stealthed.  Awards 2 combo points.
    cheap_shot = {
        id = 1833,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 60,
        spendType = "energy",

        startsCombat = true,
        texture = 132092,

        handler = function ()
        end,
    },


    -- Instantly removes all existing harmful spell effects and increases your chance to resist all spells by 90% for 5 sec.  Does not remove effects that prevent you from using Cloak of Shadows.
    cloak_of_shadows = {
        id = 31224,
        cast = 0,
        cooldown = 90,
        gcd = "totem",

        startsCombat = true,
        texture = 136177,

        toggle = "cooldowns",

        handler = function ()
        end,
    },


    --
    cold_blood = {
        id = 14177,
        cast = 0,
        cooldown = 180,
        gcd = "off",

        talent = "cold_blood",
        startsCombat = true,
        texture = 135988,

        toggle = "cooldowns",

        handler = function ()
        end,
    },


    -- Finishing move that reduces the movement of the target by 50% for 6 sec and causes increased thrown weapon damage:     1 point  : 223 - 245 damage     2 points: 365 - 387 damage     3 points: 507 - 529 damage     4 points: 649 - 671 damage     5 points: 791 - 813 damage
    deadly_throw = {
        id = 48673,
        cast = -999.5,
        cooldown = 0,
        gcd = "totem",

        spend = 35,
        spendType = "energy",

        startsCombat = true,
        texture = 135430,

        handler = function ()
        end,
    },


    -- Disarm the enemy, removing all weapons, shield or other equipment carried for 10 sec.
    dismantle = {
        id = 51722,
        cast = 0,
        cooldown = 60,
        gcd = "totem",

        spend = 25,
        spendType = "energy",

        startsCombat = true,
        texture = 236272,

        toggle = "cooldowns",

        handler = function ()
        end,
    },


    -- Throws a distraction, attracting the attention of all nearby monsters for 10 seconds.  Does not break stealth.
    distract = {
        id = 1725,
        cast = 0,
        cooldown = 30,
        gcd = "totem",

        spend = 30,
        spendType = "energy",

        startsCombat = true,
        texture = 132289,

        handler = function ()
        end,
    },


    -- Finishing move that consumes your Deadly Poison doses on the target and deals instant poison damage.  Following the Envenom attack you have an additional 15% chance to apply Deadly Poison and a 75% increased frequency of applying Instant Poison for 1 sec plus an additional 1 sec per combo point.  One dose is consumed for each combo point:    1 dose:  180 damage    2 doses: 361 damage    3 doses: 541 damage    4 doses: 722 damage    5 doses: 902 damage
    envenom = {
        id = 32684,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 35,
        spendType = "energy",

        startsCombat = true,
        texture = 132287,

        handler = function ()
        end,
    },


    -- Increases the rogue's dodge chance by 50% and reduces the chance ranged attacks hit the rogue by 25%.  Lasts 15 sec.
    evasion = {
        id = 26669,
        cast = 0,
        cooldown = 180,
        gcd = "off",

        spend = 0,
        spendType = "energy",

        startsCombat = true,
        texture = 136205,

        toggle = "cooldowns",

        handler = function ()
        end,
    },


    -- Finishing move that causes damage per combo point:     1 point  : 256-391 damage     2 points: 452-602 damage     3 points: 648-813 damage     4 points: 845-1024 damage     5 points: 1040-1235 damage
    eviscerate = {
        id = 26865,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 35,
        spendType = "energy",

        startsCombat = true,
        texture = 132292,

        handler = function ()
        end,
    },


    -- Finishing move that exposes the target, reducing armor by 20% and lasting longer per combo point:     1 point  : 6 sec.     2 points: 12 sec.     3 points: 18 sec.     4 points: 24 sec.     5 points: 30 sec.
    expose_armor = {
        id = 8647,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 25,
        spendType = "energy",

        startsCombat = true,
        texture = 132354,

        handler = function ()
        end,
    },


    -- Performs a feint, causing no damage but lowering your threat by a large amount, making the enemy less likely to attack you.
    feint = {
        id = 27448,
        cast = 0,
        cooldown = 10,
        gcd = "totem",

        spend = 20,
        spendType = "energy",

        startsCombat = true,
        texture = 132294,

        handler = function ()
        end,
    },


    -- Garrote the enemy, silencing them for 3 sec causing 768 damage over 18 sec, increased by attack power.  Must be stealthed and behind the target.  Awards 1 combo point.
    garrote = {
        id = 26884,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 50,
        spendType = "energy",

        startsCombat = true,
        texture = 132297,

        handler = function ()
        end,
    },


    --
    ghostly_strike = {
        id = 14278,
        cast = 0,
        cooldown = 20,
        gcd = "totem",

        spend = 40,
        spendType = "energy",

        talent = "ghostly_strike",
        startsCombat = true,
        texture = 136136,

        handler = function ()
        end,
    },


    -- Causes 79 damage, incapacitating the opponent for 4 sec, and turns off your attack.  Target must be facing you.  Any damage caused will revive the target.  Awards 1 combo point.
    gouge = {
        id = 1776,
        cast = 0,
        cooldown = 10,
        gcd = "totem",

        spend = 45,
        spendType = "energy",

        startsCombat = true,
        texture = 132155,

        handler = function ()
        end,
    },


    --
    hemorrhage = {
        id = 16511,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 35,
        spendType = "energy",

        talent = "hemorrhage",
        startsCombat = true,
        texture = 136168,

        handler = function ()
        end,
    },


    --
    hunger_for_blood = {
        id = 51662,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 15,
        spendType = "energy",

        talent = "hunger_for_blood",
        startsCombat = true,
        texture = 236276,

        handler = function ()
        end,
    },


    -- A quick kick that interrupts spellcasting and prevents any spell in that school from being cast for 5 sec.
    kick = {
        id = 1766,
        cast = 0,
        cooldown = 10,
        gcd = "off",

        spend = 25,
        spendType = "energy",

        startsCombat = true,
        texture = 132219,

        handler = function ()
        end,
    },


    -- Finishing move that stuns the target.  Lasts longer per combo point:     1 point  : 2 seconds     2 points: 3 seconds     3 points: 4 seconds     4 points: 5 seconds     5 points: 6 seconds
    kidney_shot = {
        id = 8643,
        cast = 0,
        cooldown = 20,
        gcd = "totem",

        spend = 25,
        spendType = "energy",

        startsCombat = true,
        texture = 132298,

        handler = function ()
        end,
    },


    --
    killing_spree = {
        id = 51690,
        cast = 0,
        cooldown = 120,
        gcd = "totem",

        spend = 0,
        spendType = "energy",

        talent = "killing_spree",
        startsCombat = true,
        texture = 236277,

        toggle = "cooldowns",

        handler = function ()
        end,
    },


    --
    mutilate = {
        id = 1329,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 60,
        spendType = "energy",

        talent = "mutilate",
        startsCombat = true,
        texture = 132304,

        handler = function ()
        end,
    },


    --
    premeditation = {
        id = 14183,
        cast = 0,
        cooldown = 20,
        gcd = "off",

        spend = 0,
        spendType = "energy",

        talent = "premeditation",
        startsCombat = true,
        texture = 136183,

        handler = function ()
        end,
    },


    --
    preparation = {
        id = 14185,
        cast = 0,
        cooldown = 480,
        gcd = "totem",

        talent = "preparation",
        startsCombat = true,
        texture = 136121,

        toggle = "cooldowns",

        handler = function ()
        end,
    },


    --
    riposte = {
        id = 14251,
        cast = 0,
        cooldown = 6,
        gcd = "totem",

        spend = 10,
        spendType = "energy",

        talent = "riposte",
        startsCombat = true,
        texture = 132336,

        handler = function ()
        end,
    },


    -- Finishing move that causes damage over time, increased by your attack power.  Lasts longer per combo point:     1 point  : 346 damage over 8 secs     2 points: 505 damage over 10 secs     3 points: 685 damage over 12 secs     4 points: 887 damage over 14 secs     5 points: 1111 damage over 16 secs
    rupture = {
        id = 26867,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 25,
        spendType = "energy",

        startsCombat = true,
        texture = 132302,

        handler = function ()
        end,
    },


    -- Incapacitates the target for up to 45 sec.  Must be stealthed.  Only works on Humanoids that are not in combat.  Any damage caused will revive the target.  Only 1 target may be sapped at a time.
    sap = {
        id = 11297,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 65,
        spendType = "energy",

        startsCombat = true,
        texture = 132310,

        handler = function ()
        end,
    },


    --
    shadow_dance = {
        id = 51713,
        cast = 0,
        cooldown = 60,
        gcd = "off",

        spend = 0,
        spendType = "energy",

        talent = "shadow_dance",
        startsCombat = true,
        texture = 236279,

        toggle = "cooldowns",

        handler = function ()
        end,
    },


    --
    shadowstep = {
        id = 36554,
        cast = 0,
        cooldown = 30,
        gcd = "off",

        spend = 10,
        spendType = "energy",

        talent = "shadowstep",
        startsCombat = true,
        texture = 132303,

        handler = function ()
        end,
    },


    -- Performs an instant off-hand weapon attack that automatically applies the poison from your off-hand weapon to the target.  Slower weapons require more Energy.  Neither Shiv nor the poison it applies can be a critical strike.  Awards 1 combo point.
    shiv = {
        id = 5938,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 40,
        spendType = "energy",

        startsCombat = true,
        texture = 135428,

        handler = function ()
        end,
    },


    -- An instant strike that causes 98 damage in addition to 100% of your normal weapon damage.  Awards 1 combo point.
    sinister_strike = {
        id = 26862,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 45,
        spendType = "energy",

        startsCombat = true,
        texture = 136189,

        handler = function ()
        end,
    },


    -- Finishing move that increases melee attack speed by 40%.  Lasts longer per combo point:     1 point  : 9 seconds     2 points: 12 seconds     3 points: 15 seconds     4 points: 18 seconds     5 points: 21 seconds
    slice_and_dice = {
        id = 6774,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 25,
        spendType = "energy",

        startsCombat = true,
        texture = 132306,

        handler = function ()
        end,
    },


    -- Increases the rogue's movement speed by 70% for 15 sec.  Does not break stealth.
    sprint = {
        id = 11305,
        cast = 0,
        cooldown = 180,
        gcd = "off",

        spend = 0,
        spendType = "energy",

        startsCombat = true,
        texture = 132307,

        toggle = "cooldowns",

        handler = function ()
        end,
    },


    -- Allows the rogue to sneak around, but reduces your speed by 30%.  Lasts until cancelled.
    stealth = {
        id = 1784,
        cast = 0,
        cooldown = 10,
        gcd = "off",

        startsCombat = true,
        texture = 132320,

        handler = function ()
        end,
    },
} )


spec:RegisterOptions( {
    enabled = true,

    aoe = 3,

    gcd = 1752,

    nameplates = true,
    nameplateRange = 8,

    damage = false,
    damageExpiration = 6,

    -- package = "",
    -- package1 = "",
    -- package2 = "",
    -- package3 = ""
} )