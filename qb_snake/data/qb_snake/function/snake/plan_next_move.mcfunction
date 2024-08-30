# Determine movement direction based on controlling player's selected item slot
execute as @a \
    if score @s team = @e[type=minecraft:marker,tag=currentSnake,limit=1] team \
    store result score @e[type=minecraft:marker,tag=currentSnake,limit=1] moveDir \
    run data get entity @s SelectedItemSlot

# Plan the next movement - but don't allow doubling back on ourselves
# => UP
execute if score @s moveDir matches 0 unless score @s speedZ matches 1 run scoreboard players set @s speedX 0
execute if score @s moveDir matches 0 unless score @s speedZ matches 1 run scoreboard players set @s speedZ -1
# => LEFT
execute if score @s moveDir matches 1 unless score @s speedX matches 1 run scoreboard players set @s speedX -1
execute if score @s moveDir matches 1 unless score @s speedX matches 1 run scoreboard players set @s speedZ 0
# => DOWN
execute if score @s moveDir matches 2 unless score @s speedZ matches -1 run scoreboard players set @s speedX 0
execute if score @s moveDir matches 2 unless score @s speedZ matches -1 run scoreboard players set @s speedZ 1
# => RIGHT
execute if score @s moveDir matches 3 unless score @s speedX matches -1 run scoreboard players set @s speedX 1
execute if score @s moveDir matches 3 unless score @s speedX matches -1 run scoreboard players set @s speedZ 0

# Find our collision marker
execute as @e[type=minecraft:marker,tag=collisionMarker] if score @s team = @e[type=minecraft:marker,tag=currentSnake,limit=1] team run tag @s add currentCollision

# Check for collisions at our new destination
execute as @e[type=minecraft:marker,tag=currentCollision,limit=1] run function qb_snake:snake/move_collision_marker

# Start moving the head animation towards the new destination
execute as @e[type=minecraft:block_display,tag=headAnim] if score @s team = @e[type=minecraft:marker,tag=currentSnake,limit=1] team run tp @s @e[type=minecraft:marker,tag=currentCollision,limit=1]

# Remove temporary tag
tag @e[type=minecraft:marker,tag=currentCollision,limit=1] remove currentCollision
