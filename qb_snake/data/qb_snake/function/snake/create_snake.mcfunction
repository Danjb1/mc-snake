summon minecraft:marker ~ ~ ~ {Tags:[snake,head]}
$execute as @e[type=minecraft:marker,tag=snake,sort=nearest,limit=1] run function qb_snake:teams/join_team {team: $(team)}
execute as @e[type=minecraft:marker,tag=snake,sort=nearest,limit=1] run function qb_snake:snake/init_snake
