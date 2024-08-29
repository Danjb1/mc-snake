# Check if paused
execute if score paused globals matches 1 run return 0

# Remove tail entities pending delete
execute as @e[type=minecraft:marker,tag=tail,tag=pendingDelete] at @s run function qb_snake:remove_tail

# Move snake
execute as @e[type=minecraft:marker,tag=snake,tag=head] at @s run function qb_snake:tick_head

# TODO: Teleport player into position every tick while game is active

# DEBUG
#execute at @e[tag=collisionMarker] run particle flame ~ ~1 ~ 0 0 0 0 5 force
