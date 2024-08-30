#
# Dev-only function used to construct the arena.
#

fill -25 -31 -19 25 -31 19 minecraft:white_concrete replace
fill -24 -31 -18 24 -31 18 minecraft:air replace
fill -24 -30 -18 24 -30 18 minecraft:light[level=15] replace

# Prevent players escaping
fill -2 47 -2 2 50 2 minecraft:barrier hollow
