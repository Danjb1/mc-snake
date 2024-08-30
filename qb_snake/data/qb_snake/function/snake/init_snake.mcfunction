# Temporary tag so we can refer to this snake throughout the function
tag @s add currentSnake

# Initialize scoreboards
scoreboard players set @s moveDuration 3
scoreboard players set @s lastTailIndex 4
scoreboard players set @s speedX 0
scoreboard players set @s speedZ -1
execute store result score @s posX run data get entity @s Pos[0]
execute store result score @s posZ run data get entity @s Pos[2]

# Spawn the movement "animation" for the head.
# This is a block display that relies on interpolation to create smooth movement.
summon minecraft:block_display ~ ~ ~ {Tags: [headAnim,currentAnim]}
function qb_snake:snake/init_anim
tag @e[type=minecraft:block_display,tag=currentAnim,limit=1] remove currentAnim

# Spawn the movement "animation" for the tail (as above).
summon minecraft:block_display ~ ~ ~ {Tags: [tailAnim,currentAnim]}
function qb_snake:snake/init_anim
tag @e[type=minecraft:block_display,tag=currentAnim,limit=1] remove currentAnim

# Spawn the marker used to check for collisions
summon minecraft:marker ~ ~ ~ {Tags: [collisionMarker,currentCollision]}
execute store result score @e[type=minecraft:marker,tag=currentCollision,limit=1] posX run data get entity @s Pos[0]
execute store result score @e[type=minecraft:marker,tag=currentCollision,limit=1] posZ run data get entity @s Pos[2]
execute store result score @e[type=minecraft:marker,tag=currentCollision,limit=1] team run scoreboard players get @s team
execute as @e[type=minecraft:marker,tag=currentCollision,limit=1] run function qb_snake:teams/join_team
tag @e[type=minecraft:marker,tag=currentCollision,limit=1] remove currentCollision

# The snake has "moved" to its initial position
function qb_snake:snake/on_snake_moved

# Plan the first movement
function qb_snake:snake/plan_next_move

# Remove temporary tag
tag @s remove currentSnake
