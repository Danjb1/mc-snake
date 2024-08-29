# We don't want to remove the tail immediately, as that results in a small visual gap.
# Instead, we mark the tail for removal after a short delay.
tag @s add pendingDelete

# This should no longer be considered the end of the tail
tag @s remove lastTail
