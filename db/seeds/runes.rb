# Seeds for base runes

# Mind Runes
Rune.create(
    name: 'Rune of Force',
    description: %(A strong wind protects the target, ranged attacks have disadvantage against the target.),
    target: ['Creature'],
    trace: '2 Rounds',
    draw: '1 Hour',
    house: 'Mind',
    level: 1
)
Rune.create(
    name: 'Rune of the Mind',
    description: %(When drawn the target must make a dexterity saving throw or be overwhelmed with a sensation of vertigo.

    Target has disadvantage on attacks and saving throws.
    The first time the target moves on a turn it must make a dexterity saving throw or fall prone.),
    target: ['Creature'],
    trace: '2 Rounds',
    draw: '5 Minutes',
    house: 'Mind',
    level: 2
)
Rune.create(
    name: 'Rune of Air',
    description: %(When drawn, a strong wind blows out from the rune in a 60ft cone.

    While inside the cone:
    
        Creatures moving towards the rune must use 2ft of movement per 1ft moved.
        Creatures moving away from the rune may move 2ft per 1ft of movement.
    
    If the rune is on an object and the object is moved or turned, the cone moves with it.),
    target: ['Object', 'Surface'],
    trace: '5 Rounds',
    draw: '5 Minutes',
    house: 'Mind',
    level: 3
)
Rune.create(
    name: 'Rune of Sight',
    description: %(While the rune is active, the target gains blindsight to 10ft and darkvision to 120ft.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Mind',
    level: 4
)
Rune.create(
    name: 'Rune of Fear',
    description: %(While the rune is active, any creature within 120ft wanting to move closer to the target must make a intelligence saving throw or have their speed reduced to 0 for this turn.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Mind',
    level: 5
)
Rune.create(
    name: 'Rune of the Sky',
    description: %(When drawn the air in a cylinder 20ft high in a 30ft radius from the rune becomes lighter, all creatures in the area weighing less than 200lb are lifted 10ft in the air.
    While held in the air the creatures without flying speed can move only by pushing or pulling against a fixed object or surface within reach such as a wall or a ceiling, which allows it to move as if it were climbing.),
    target: ['Surface'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Mind',
    level: 7
)
Rune.create(
    name: 'Rune of Imagination',
    description: %(You craft an illusion that takes root in the mind of a creature that you can see within range. The target must make an Intelligence saving throw. On a failed save, you create a phantasmal object, creature, or other visible phenomenon of your choice that is no larger than a 10-foot cube and that is perceivable only to the target for the duration. This structure has no effect on undead or constructs.

    The phantasm includes sound, temperature, and other stimuli, also evident only to the creature.

    The target can use its action to examine the phantasm with an Intelligence \(Investigation\) check against your rune save DC. If the check succeeds, the target realizes that the phantasm is an illusion, and the structure fades.

    While a target is affected by the structure, the target treats the phantasm as if it were real. The target rationalizes any illogical outcomes from interacting with the phantasm. For example, a target attempting to walk across a phantasmal bridge that spans a chasm falls once it steps onto the bridge. If the target survives the fall, it still believes that the bridge exists and comes up with some other explanation for its fall—it was pushed, it slipped, or a strong wind might have knocked it off.

    An affected target is so convinced of the phantasm's reality that it can even take damage from the illusion. A phantasm created to appear as a creature can attack the target. Similarly, a phantasm created to appear as fire, a pool of acid, or lava can burn the target. Each round on your turn, the phantasm can deal 1d6 psychic damage to the target if it is in the phantasm's area or within 5 feet of the phantasm, provided that the illusion is of a creature or hazard that could logically deal damage, such as by attacking. The target perceives the damage as a type appropriate to the illusion.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Mind',
    level: 10
)
puts "Mind runes populated"

# Power Runes
Rune.create(
    name: 'Rune of Light',
    description: %(Bright light emits from the rune in a 30ft radius, only one such rune is effective if more than one is in a 5ft space.),
    target: ['Object', 'Surface'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Power',
    level: 1
)
Rune.create(
    name: 'Rune of Embers',
    description: %(While active, the weapon glows a faint orange, and any attack that hits with this weapon does an extra 1d4 fire damage.
    Only one such rune can be effective on a weapon.),
    target: ['Metal Weapon'],
    trace: '5 Rounds',
    draw: '5 Minutes',
    house: 'Power',
    level: 2
)
Rune.create(
    name: 'Rune of Flames',
    description: %(The weapon becomes so hot the metal turns to liquid and catches fire.

    Attacks made with the target weapon have an extra 5ft of reach, and all damage dealt by this weapon is fire damage.
    Only one such rune can be active on a weapon at a time.),
    target: ['Metal Weapon'],
    trace: '5 Rounds',
    draw: '5 Minutes',
    house: 'Power',
    level: 3
)
Rune.create(
    name: 'Rune of the Forge',
    description: %(The target weapon becomes as hard as a forge hammer.
    Any attack that hits a target wearing non-adamantine metal armour gives that armour a permanent cumulitive -1 AC penalty, if the armour has a penalty of -5 the creature inside is crushed by the armour and falls to 0 HP.),
    target: ['Bludgeoning Weapon'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Power',
    level: 4
)
Rune.create(
    name: 'Rune of Strength',
    description: %(The armour feels as if it has become alive, aiding your movement and strength.
    While wearing this armour you can move over rough terrain as if it was normal, and have advantage on strength and dexterity saving throws.),
    target: ['Medium Armour', 'Heavy Armour'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Power',
    level: 5
)
Rune.create(
    name: 'Rune of Fury',
    description: %(While this rune is active, the target is blinded by rage.
    The target gains a +5 bonus to melee attacks, and any attack against the target has advantage.
    On their turn, the target MUST move towards the nearest creature and attack them with a mele weapon or their fists.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '1 Hour',
    house: 'Power',
    level: 7
)
Rune.create(
    name: 'Rune of Destruction',
    description: %(When drawn, chose 3 points within 60ft of the rune, three flaming rocks come falling from the sky as if hurtled from a volcano.

    Any creature hit by one of these flaming rocks takes 3d6 bludgeoning damage and 3d6 fire damage.
    Any creature within 5ft of the target must make a dexterity saving throw or take 3d6 fire damage, or half as much on a succesful save.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    house: 'Power',
    level: 10
)
puts "Power runes populated"

# Death Runes
Rune.create(
    name: 'Rune of Protection',
    description: %(While the rune is active the target gains a +1 bonus to AC
    Structures that increase AC using this Rune do not stack.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Death',
    level: 1
)
Rune.create(
    name: 'Rune of Death',
    description: %(While the rune is active and a creature touches the surface it takes 2d6 bludgeoning damage and the rune fades.
    Only one such rune is effective if more than one is in a 5ft space.),
    target: ['Object', 'Surface'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Death',
    level: 2
)
Rune.create(
    name: 'Rune of Earth',
    description: %(When drawn, the drawer decides on 6 5ft squares to erupt and become cracked. The squares must be adjacent to at least one other square, or the initial rune.

    Any creature in one of these spaces when the rune is drawn must make a dexterity saving throw or take 1d6 bludgeoning damage
    The squares become rough terrain.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    house: 'Death',
    level: 3
)
Rune.create(
    name: 'Rune of Mountains',
    description: %(When the rune is drawn, a 5ft wide, 30ft long line of the ground raises up 10ft forming a wall. The starting point of the line must be within 30ft of the rune.

    Any creature in in the line must make a dexterity saving throw, on a failed save they rake 3d8 bludgeoning damage and is pushed 5 ft to a random side of the wall, or half on a succesful save and they stay on top of the wall.
    Each 5ft section of the wall has 60HP.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    house: 'Death',
    level: 4
)
Rune.create(
    name: 'Rune of Stone',
    description: %(While the rune is active the targets skin turns to stone, giving them resistance to bludgeoning, slashing, and piercing damage, and disadvantage on dexterity saving throws.
    Only one such rune is effective if more than one is in a 5ft space.),
    target: ['Creature', 'Object'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Death',
    level: 5
)
Rune.create(
    name: 'Rune of Ore',
    description: %(While the rune is active the object changes to a type of metal. One rune can convert up to 1ft square of the object, multiple runes can convert a larger object.
    Metal choices can be: Iron, Lead, Tin, Brass, Bronze, Copper, Steel, Silver, Electrum, Gold, Platinum, Mithral, Adamantine),
    target: ['Item'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Death',
    level: 7
)
Rune.create(
    name: 'Rune of Oblivion',
    description: %(When drawn the target must make a constitution saving throw take 3d10 bludgeoning damage, or half as much on a succesful save. A creature reduced to less than 10 HP from this damage turns to clay.

    A creature turned to clay this way has an AC of 10, and any damage will cause the creature to crumble to dirt.
    If a creature is clay when the rune fades, it reverts to its original form and becomes stable with 0 HP.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '1 Hour',
    house: 'Death',
    level: 10
)
puts "Death runes populated"

# Life Runes
Rune.create(
    name: 'Rune of Life',
    description: %(While the rune is active, it restores 1 HP per round per level of Rune Scribe
    Only one such rune is effective on a creature at a time.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '10 Minutes',
    house: 'Life',
    level: 1
)
Rune.create(
    name: 'Rune of Water',
    description: %(While the rune is active rain pours from the sky.
    Each square in a 30ft radius is considered rough terrain due to being slippery.),
    target: ['Surface'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Life',
    level: 2
)
Rune.create(
    name: 'Rune of Leaves',
    description: %(When this rune is cast, a 10ft square of the ground becomes covered in leaves and sticks, hiding anything underneath from sight.),
    target: ['Surface'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Life',
    level: 3
)
Rune.create(
    name: 'Rune of Depth',
    description: %(While this rune is active, the creature gains a swimming speed equal to their walking speed, and can hold their breath for 1 hour.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Life',
    level: 4
)
Rune.create(
    name: 'Rune of Frost',
    description: %(When drawn, the ground in a 30ft cone from the rune becomes frozen solid. The frozen ground is rough terrain, and any creature starting their turn in the area or moving into the area must make a dexterity saving throw or fall prone and take 1d6 bludgeoning damage and 1d8 cold damage.),
    target: ['Surface'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Life',
    level: 5
)
Rune.create(
    name: 'Rune of Waves',
    description: %(When drawn, a 40ft cube adjacent to the rune becomes flooded wath water as water erupts from the air around the cube.

    Any creature that starts their turn inside the cube must make a strength saving throw or be unable to move during their turn.
    Creatures inside the cube are considered underwater, and have the associated fighting and movement penalties as well as no oxygen.),
    target: ['Surface'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Life',
    level: 7
)
Rune.create(
    name: 'Rune of Rebirth',
    description: %(While the rune is active, if the target is at 0 HP or drops below 1HP, they regain 2d6 HP and become prone instead of falling unconscious and this rune fades.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    house: 'Life',
    level: 10
)
puts "Life runes populated"
