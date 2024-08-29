scoreboard players add @s moveTimer 1
execute if score @s moveTimer >= @s moveDuration run function qb_snake:move_head

# DEBUG
#particle flame ~ ~ ~ 0 0 0 0 5 force
