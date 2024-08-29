# Create a "pending tail" entity at our current location
summon minecraft:marker ~ ~ ~ {Tags:[snake,pendingTail]}

# Move according to our current speed
scoreboard players operation @s posX += @s speedX
scoreboard players operation @s posZ += @s speedZ
execute store result entity @s Pos[0] double 1 run scoreboard players get @s posX
execute store result entity @s Pos[2] double 1 run scoreboard players get @s posZ

# Center ourselves in the new block
execute at @s run tp ~0.5 ~ ~0.5

# Plan the next movement based on player input
execute at @s run function qb_snake:plan_next_move

# Broadcast the movement
execute at @s run function qb_snake:on_head_moved

# Now we can safely convert the pending tail to a real tail entity
tag @e[type=minecraft:marker,tag=pendingTail,limit=1] add tail
tag @e[type=minecraft:marker,tag=pendingTail,limit=1] remove pendingTail

# We have just moved, so reset the move timer
scoreboard players reset @s moveTimer
