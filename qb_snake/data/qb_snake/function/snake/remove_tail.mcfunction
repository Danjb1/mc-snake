# Don't remove the block if a wall has replaced the tail!
execute unless block ~ ~ ~ white_concrete run setblock ~ ~ ~ minecraft:air replace
kill @s
