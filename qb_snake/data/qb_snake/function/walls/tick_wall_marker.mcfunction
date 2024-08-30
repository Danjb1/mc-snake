# Move to the next block whenever our moveTimer reaches moveDuration
scoreboard players add @s moveTimer 1
execute if score @s moveTimer >= @s moveDuration run function qb_snake:walls/move_wall_marker
