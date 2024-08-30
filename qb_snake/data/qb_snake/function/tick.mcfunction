# Tick players
execute as @a at @s run function qb_snake:player/tick_player

# Check if paused
execute if score paused globals matches 1 run return 0

# Remove tail entities pending delete
execute as @e[type=minecraft:marker,tag=tail,tag=pendingDelete] at @s run function qb_snake:snake/remove_tail

# Move snakes
execute as @e[type=minecraft:marker,tag=snake,tag=head] at @s run function qb_snake:snake/tick_snake

# DEBUG
#execute at @e[type=minecraft:marker,tag=collisionMarker] run particle flame ~ ~1 ~ 0 0 0 0 5 force
#execute at @e[type=minecraft:marker,tag=head] run particle minecraft:composter ~ ~1 ~ 0 0 0 0 5 force
