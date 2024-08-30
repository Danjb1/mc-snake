# Copy the snakes's position (just for good measure)
execute store result entity @s Pos[0] double 1 run scoreboard players get @e[type=minecraft:marker,tag=currentSnake,limit=1] posX
execute store result entity @s Pos[2] double 1 run scoreboard players get @e[type=minecraft:marker,tag=currentSnake,limit=1] posZ

# Move according to the snake's current speed
scoreboard players operation @s posX += @e[type=minecraft:marker,tag=currentSnake,limit=1] speedX
scoreboard players operation @s posZ += @e[type=minecraft:marker,tag=currentSnake,limit=1] speedZ
execute store result entity @s Pos[0] double 1 run scoreboard players get @s posX
execute store result entity @s Pos[2] double 1 run scoreboard players get @s posZ

# Center ourselves in the new block
execute at @s run tp ~0.5 ~ ~0.5

# Check for collisions at the destination
execute at @s run function qb_snake:snake/check_collisions
