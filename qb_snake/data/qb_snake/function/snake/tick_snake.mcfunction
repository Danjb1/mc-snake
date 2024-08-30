# Temporary tag so we can refer to this snake throughout the tick
tag @s add currentSnake

# Move to the next block whenever our moveTimer reaches moveDuration
scoreboard players add @s moveTimer 1
execute if score @s moveTimer >= @s moveDuration run function qb_snake:snake/move_snake

# Remove temporary tag
tag @s remove currentSnake
