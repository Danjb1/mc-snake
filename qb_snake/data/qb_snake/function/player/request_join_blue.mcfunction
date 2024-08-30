# IMPORTANT: Reset the trigger so it can be used again in future
scoreboard players reset @s joinBlueTrigger
scoreboard players enable @s joinBlueTrigger

# Prevent changing teams mid-game
execute if score paused globals matches 0 run tellraw @s [{"text":"\n⚠ You cannot change teams while the game is in progress!\n","color":"red"}]
execute if score paused globals matches 0 run return 0

# Prevent joining the same team as another player
execute if entity @a[team=Blue] run tellraw @s [{"text":"\n⚠ Another player has already chosen that color!\n","color":"red"}]
execute if entity @a[team=Blue] run return 0

function qb_snake:teams/join_team {team:2}

tellraw @a [\
    {"text":"\n","color":"white"},\
    {"selector":"@s","color":"yellow"},\
    {"text":" is now controlling ","color":"aqua"},\
    {"text":"Blue","color":"blue"},\
    {"text":"!","color":"aqua"}]

function qb_snake:player/display_start_message
