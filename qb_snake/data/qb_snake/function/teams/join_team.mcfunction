# Joins the team whose ID is provided to the function, (e.g. `function join_team {team:1}`).
# We save the team ID to a scoreboard because it's much easier to use this than it is to rely on team selectors.
$scoreboard players set @s team $(team)
execute if score @s team matches 1 run team join Red @s
execute if score @s team matches 2 run team join Blue @s
