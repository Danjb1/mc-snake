# IMPORTANT: Reset the trigger so it can be used again in future
scoreboard players reset @s leaveTeamTrigger
scoreboard players enable @s leaveTeamTrigger

# Prevent changing teams mid-game
execute if score paused globals matches 0 run tellraw @s [{"text":"\n⚠ You cannot change teams while the game is in progress!\n","color":"red"}]
execute if score paused globals matches 0 run return 0

# Do nothing if we are not on a team
execute unless score @s team matches 1.. run tellraw @s [{"text":"\n⚠ You are not controlling a snake!\n","color":"red"}]
execute unless score @s team matches 1.. run return 0

function qb_snake:teams/leave_team

tellraw @a [\
    {"text":"\n","color":"white"},\
    {"selector":"@s","color":"yellow"},\
    {"text":" is no longer controlling a snake!","color":"aqua"}]
