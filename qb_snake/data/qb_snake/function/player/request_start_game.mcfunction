# IMPORTANT: Reset the trigger so it can be used again in future
scoreboard players reset @s startGameTrigger
scoreboard players enable @s startGameTrigger

# Do nothing if the game has already started
execute if score paused globals matches 0 run tellraw @s [{"text":"\n⚠ The game is already in progress!\n","color":"red"}]
execute if score paused globals matches 0 run return 0

# Do nothing if we are not on a team
execute if score @s team matches 0 run tellraw @s [{"text":"\n⚠ Only an active player can start the game!\n","color":"red"}]
execute if score @s team matches 0 run return 0

# Count the number of active teams
scoreboard players reset numTeams globals
execute if entity @a[team=Red] run scoreboard players add numTeams globals 1
execute if entity @a[team=Blue] run scoreboard players add numTeams globals 1

# Ensure we have at least 1 team
execute if score numTeams globals matches 0 run tellraw @s [{"text":"\n⚠ At least 1 active player is required!\n","color":"red"}]
execute if score numTeams globals matches 0 run return 0

# Clean up the previous game
function qb_snake:reset

# Setup snake(s)
execute if entity @a[team=Red] positioned -8 -31 0 run function qb_snake:snake/create_snake {team: 1}
execute if entity @a[team=Blue] positioned 8 -31 0 run function qb_snake:snake/create_snake {team: 2}

# Start the countdown
function qb_snake:countdown/start_countdown
