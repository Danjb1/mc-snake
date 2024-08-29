# Plan the next movement - but don't allow doubling back on ourselves
# TODO: Check the *owning* player's hotbar slot
execute store result score @s moveDir run data get entity @p SelectedItemSlot

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

# Move our collision marker to the intended destination
# TODO: Make sure we pick our own marker
tp @e[type=minecraft:marker,tag=collisionMarker,limit=1] @s
scoreboard players operation @e[type=minecraft:marker,tag=collisionMarker,limit=1] posX += @s speedX
scoreboard players operation @e[type=minecraft:marker,tag=collisionMarker,limit=1] posZ += @s speedZ
execute as @e[type=minecraft:marker,tag=collisionMarker,limit=1] store result entity @s Pos[0] double 1 run scoreboard players get @s posX
execute as @e[type=minecraft:marker,tag=collisionMarker,limit=1] store result entity @s Pos[2] double 1 run scoreboard players get @s posZ
execute as @e[type=minecraft:marker,tag=collisionMarker,limit=1] at @s run tp ~0.5 ~ ~0.5
execute as @e[type=minecraft:marker,tag=collisionMarker,limit=1] at @s run function qb_snake:check_collisions

# Tell the head animation to start moving to the new destination
# TODO: Don't move other snake's animations!
tp @e[type=minecraft:block_display,tag=headAnim,limit=1] @e[type=minecraft:marker,tag=collisionMarker,limit=1]
