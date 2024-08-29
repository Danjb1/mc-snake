# Initialize scoreboards
scoreboard players set @s moveDuration 3
scoreboard players set @s lastTailIndex 4
scoreboard players set @s speedX 0
scoreboard players set @s speedZ -1
execute store result score @s posX run data get entity @s Pos[0]
execute store result score @s posZ run data get entity @s Pos[2]

# Spawn the movement "animation" for the head.
# This is a block display that relies on interpolation to create smooth movement.
# We translate by (-0.5, -0.5) to center it in the block.
# We scale it down a tiny bit so it doesn't prevent the block underneath it from being lit.
summon minecraft:block_display ~ ~ ~ {\
    Tags: [headAnim,currentAnim],\
    block_state:{Name:"minecraft:red_concrete"},\
    brightness:{sky:15,block:0},\
    transformation:{\
        left_rotation:[0f,0f,0f,1f],\
        right_rotation:[0f,0f,0f,1f],\
        translation:[-0.5f,0f,-0.5f],\
        scale:[0.995f,0.995f,0.995f]}\
    }
execute store result entity @e[type=minecraft:block_display,tag=currentAnim,limit=1] teleport_duration int 1.0 run scoreboard players get @s moveDuration
tag @e[type=minecraft:block_display,tag=currentAnim,limit=1] remove currentAnim

# Spawn the movement "animation" for the tail (as above).
summon minecraft:block_display ~ ~ ~ {\
    Tags: [tailAnim,currentAnim],\
    block_state:{Name:"minecraft:red_concrete"},\
    brightness:{sky:15,block:0},\
    transformation:{\
        left_rotation:[0f,0f,0f,1f],\
        right_rotation:[0f,0f,0f,1f],\
        translation:[-0.5f,0f,-0.5f],\
        scale:[0.995f,0.995f,0.995f]}\
    }
execute store result entity @e[type=minecraft:block_display,tag=currentAnim,limit=1] teleport_duration int 1.0 run scoreboard players get @s moveDuration
tag @e[type=minecraft:block_display,tag=currentAnim,limit=1] remove currentAnim

# Spawn the marker used to check for collisions
summon minecraft:marker ~ ~ ~ {Tags: [collisionMarker,currentCollision]}
execute store result score @e[type=minecraft:marker,tag=currentCollision,limit=1] posX run data get entity @s Pos[0]
execute store result score @e[type=minecraft:marker,tag=currentCollision,limit=1] posZ run data get entity @s Pos[2]
tag @e[type=minecraft:marker,tag=currentCollision,limit=1] remove currentCollision

# The head has "moved" to its initial position
function qb_snake:on_head_moved

# Plan the first movement
function qb_snake:plan_next_move
