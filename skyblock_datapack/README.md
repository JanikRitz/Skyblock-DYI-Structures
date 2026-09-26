# Skyblock DIY Structures

## Zombie iron

Zombies drop an iron nugget with a 10% chance (12% + 2% per extra Looting level),
on any death, not only player kills. The vanilla 0.83% iron ingot entry is removed;
carrot and potato keep their vanilla rates and conditions.

## Mineshaft module

Anchor: `minecraft:lodestone`, placed in the tunnel floor between the two fence posts.

The tunnel interior is 3x3, the surrounding stone shell makes it 5x5, and the tunnel
must be at least 3 blocks long. A plain tunnel slice and the centre support arch:

```
  plain slice          support arch
  S S S S S            S S S S S
  S . . . S            S L L L S    L = oak log
  S . . . S            S F . F S    F = oak fence
  S . . . S            S F . F S
  S S S S S            S S A S S    A = lodestone anchor
```

Requirements:

- Shell: `minecraft:stone` on all four sides of all three slices.
- Arch: two oak fence posts, an oak log beam above them, the lodestone in the floor.
- The tunnel interior is never checked, so rails, torches and cobwebs are free.
- Longer mines are built by repeating the arch every 3 blocks; each lodestone is its
  own module.

Behaviour:

- Placing the lodestone registers a marker; the build is re-checked once per second.
- On success the module activates with a beacon sound and an action bar message.
- Every 20 seconds an active module picks one random shell block: stone becomes coal
  ore (70%) or iron ore (30%), and a mined-out air gap heals back into stone.
- Breaking the lodestone removes the module. Breaking the arch deactivates it until
  it is repaired.

