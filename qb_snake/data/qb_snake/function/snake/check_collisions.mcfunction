# Check for fruit
execute if entity @e[type=minecraft:item_display,tag=fruit,distance=..0.5,limit=1] run function qb_snake:snake/collided_with_fruit

# If 2 snakes collide head-on, it's a tie
# TODO: Not quite working - it triggers a tie if you hit the first tail block
execute if entity @e[type=minecraft:marker,tag=snake,tag=head,distance=..0.5,limit=1] run function qb_snake:snake/collided_with_snake_head
execute if entity @e[type=minecraft:marker,tag=snake,tag=head,distance=..0.5,limit=1] run return 0

# If a snake hits a wall (or the body of another snake), it's game over
execute unless block ~ ~ ~ minecraft:air run function qb_snake:snake/collided_with_obstacle
