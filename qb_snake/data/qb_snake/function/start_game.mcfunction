# Clean up the previous game
function qb_snake:reset

# Setup snake(s)
execute if entity @a[team=Red] positioned -8 -31 0 run function qb_snake:snake/create_snake {team: 1}
execute if entity @a[team=Blue] positioned 8 -31 0 run function qb_snake:snake/create_snake {team: 2}

# Create the fruit marker (used to spawn fruit)
summon minecraft:marker 0 -31 0 {Tags:[fruitMarker]}

# Create the wall marker (used to spawn walls)
summon minecraft:marker -24 -31 -18 {Tags:[wallMarker],Rotation:[-90f,0f]}
scoreboard players set @e[type=minecraft:marker,tag=wallMarker,limit=1] moveDuration 3

# Start the countdown
function qb_snake:countdown/start_countdown
