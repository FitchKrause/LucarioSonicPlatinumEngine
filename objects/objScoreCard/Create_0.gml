/// @description  Initialize

event_inherited();

// Single instance object
if (instance_number(objScoreCard) > 1)
{
    for (i = 1; i < instance_number(objScoreCard); i += 1) { instance_destroy(instance_find(objScoreCard, i)); } exit;
}

// no pause
objGame.can_pause = false;

// basics
state = 0;
name_tag = "";
act = objZone.act;
player_numb = 0;
player_id = objGame.player_id[player_numb].player_id;
move_player = true;

// bonues
time_bonus = 0;
rings_bonus = objData.player_rings[player_numb] * 100;
perfect_bonus = -1;
total_bonus = 0;
continue_token = false;
count_speed = 100;
change = 0;

// Name tag
name_tag = select(objData.player_character_id[player_numb] - 1, "Sonic", "Tails", "Knuckles");

// Time bonus (depending on timer)
if not (objZone.levelflags & LEVELFLAG_INFINITETIME)
{
    var total_time = objZone.timer div 60; // divide by 60 (60 frames == 1 second)
    if (total_time > 595) { time_bonus = 10000000; } // 100.000.000 points (< 5 seconds)
    else if (total_time > 590) { time_bonus = 1000000; } // 10.000.000 points (< 10 seconds)
    else if (total_time > 585) { time_bonus = 1000000; } // 1.000.000 points (< 15 seconds)
    else if (total_time > 580) { time_bonus = 500000; } // 500.000 points (< 20 seconds)
    else if (total_time > 575) { time_bonus = 100000; } // 100.000 points (< 25 seconds)
    else if (total_time > 570) { time_bonus = 50000; } // 50.000 points (< 30 seconds)
    else if (total_time > 555) { time_bonus = 10000; } // 10.000 points (< 45 seconds)
    else if (total_time > 540) { time_bonus = 5000; } // 5.000 points (< 1 minute)
    else if (total_time > 510) { time_bonus = 4000; } // 4.000 points (< 1 minute and 30 seconds)
    else if (total_time > 480) { time_bonus = 3000; } // 3.000 points (< 2 minutes)
    else if (total_time > 450) { time_bonus = 2500; } // 2.500 points (< 2 minutes and 30 seconds)
    else if (total_time > 420) { time_bonus = 2000; } // 2.000 points (< 3 minutes)
    else if (total_time > 390) { time_bonus = 1500; } // 1.500 points (< 4 minutes and 30 seconds)
    else if (total_time > 360) { time_bonus = 1000; } // 1.000 points (< 4 minutes)
    else if (total_time > 330) { time_bonus = 750; } // 750 points (< 4 minutes and 30 seconds)
    else if (total_time > 300) { time_bonus = 500; } // 500 points (< 5 minutes)
    else if (total_time > 270) { time_bonus = 250; } // 250 points (< 5 minutes and 30 seconds)
    else { time_bonus = 0; } // 0 points (+6 minutes)
}

// Perfect bonus
if (objZone.total_rings < 1) { perfect_bonus = 100000; }

// Setup font
draw_set_font(objResources.font_title_text2);

// Screen positions
title_ox1 = (objScreen.gui_width * 0.5);
title_ox2 = (objScreen.gui_width * 0.5);
act_ox = (objScreen.gui_width * 0.5) + 176; //88;
score_ox = (objScreen.gui_width * 0.5) - 208; //104; //92;
tally_ox = (objScreen.gui_width * 0.5) + 192; //96;
oval_ox = (objScreen.gui_width * 0.5) + 120;
act2_ox = (objScreen.gui_width * 0.5) + 148;

// Offsets
title_offset1 = ceil(title_ox1 * 0.0625) * 24 + 64;
title_offset2 = ceil((objScreen.gui_width - title_ox2) * 0.0625) * 24 + 64;
score_offset1 = ceil((objScreen.gui_width - score_ox) * 0.0625) * 18;
score_offset2 = score_offset1 + 32;
score_offset3 = score_offset1 + 64;
score_offset4 = score_offset1 + 96;
score_offset5 = score_offset1 + 128;
continues_offset = 192;
oval_offset = (objScreen.gui_width * 0.5) + 96;
act_offset = (objScreen.gui_width * 0.5) + 96;

// skip scorecard
if (objZone.levelflags & LEVELFLAG_SKIPSCORECARD) { state = 5; state_timer = 10; exit; }

// Music
if objData.level_finish {  music_play_overlay(bgmLevelClear); } else { music_play_single(bgmLevelClear); }
objMusic.music_flags |= MUSFLAG_NOCHANGE;

// Start event
state_timer = 60;