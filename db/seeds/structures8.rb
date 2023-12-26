# Eight Rune Structures

puts 'Adding eight rune structures'

# Mind Structures
puts 'Mind...'
Structure.create(
    name: 'Projectile Vomiting',
    description: %(The target starts vomiting uncontrollably. The floor beneath them becomes covered in vomit and slippery.

    At the start of their turn they may make a CON save to stop vomiting. On a fail, the vomit on the floor spreads another 5ft in all directions, can only move 5ft, and is incapacitated.
    
    A creature that enters the vomit area or ends its turn there must also succeed on a Dexterity saving throw or fall prone.),
    target: ['Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Alexithymia').id, Structure.find_by(name: 'Condense').id],
    tag_ids: [],
    tldr: "Queue Team America scene\nVomit until CON save"
)

Structure.create(
    name: 'Kamikaze',
    description: %(The target rises 120ft into the air and hovers above you, and is set with a belief that they are your protector.

    The next time you take damage from a creature, the target will plumet down and land on top of the creature that dealt the damage, causing bludgeoning damage equal to the targets fall damage to the enemy, and the rune fades.
    
    If you take no damage before the rune fades, the target will fall on you.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Cannonball').id, Structure.find_by(name: 'Toadie').id],
    tag_ids: [],
    tldr: "Queue Team America scene\nIncapacitated until CON save"
)

Structure.create(
    name: 'Dementia',
    description: %(For the duration, the target is afflicted with a form of Short-Term Madness.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Fleeting Dementia').id, Structure.find_by(name: 'Fleeting Dementia').id],
    tag_ids: [],
    tldr: "I think I'm a banana tree!\nCauses madness"
)

Structure.create(
    name: 'Shuttle',
    description: %(When tracing the caster specifies a direction and a distance up to 100 Miles.

    An orb forms around you with a radius of 10ft, enough comfortable chairs materialize to seat all creatures within the orb, and a countdown begins from 10 counting down.
    
    When the countdown reaches 0, the orb is catapulted into the air, and soars towards the destination. When it hits the ground it digs halfway in and stops, the seats and orb dematerialize 10 seconds later.
    
    If the orb hits an obstacle such as a mountain, concludes its journey there.),
    target: ['Self'],
    trace: 'Instant',
    draw: 'Instant',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Cannonball').id, Structure.find_by(name: 'Snowglobe').id],
    tag_ids: [7],
    tldr: "The future of long distance travel!\n100 Mile fast travel"
)

Structure.create(
    name: 'Perfect Prediction',
    description: %(While this rune is active, you can predict every action of everyone around you. You have lived this day already in your dreams and can change a single thing about the day, as that one change makes the rest of the days events change.

    At any point you may use your reaction to undo any action made in the last minute.
    
    Tracing this rune gives you 1 point of exhaustion, and prevents exhaustion from being reduced on your next long rest, or by any other means for the next 30 hours.),
    target: ['Self'],
    trace: '24 Hours',
    draw: '24 Hours',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Psychogalvanize').id, Structure.find_by(name: 'Synesthesia').id],
    tag_ids: [7],
    tldr: "Déjà vu\nAlter the future"
)

Structure.create(
    name: 'Pocket Dimension',
    description: %(The target cloth becomes the entrance to a demiplane that is open while it is unfolded, and closes when folded. There is breathable air inside the demiplane.

    Anything inside the demiplane when the rune fades is ejected, tearing the cloth.),
    target: ['Cloth'],
    trace: '10 Minutes',
    draw: '2 Hours',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Condense').id, Structure.find_by(name: 'Condense').id],
    tag_ids: [7],
    tldr: "Whats smaller than small?\nCreate a demiplane"
)

Structure.create(
    name: 'Dislimbination',
    description: %(The target feels a burning pain moving through their body and may use their action to make a Constitution ability check to attempt to cut out the infection. On a success the target attacks themselves, dealing critical damage from the weapon in their right hand, and the structure fades.

    At the start of the casters next turn if the structure is still in place roll a 1d100 to see how the infection affects the target.
    1:
    The targets head explodes causing instant death
    2-5:
    The targets right arm explodes causing 3d10 damage to the target and half that to anyone withing 5ft of them.
    6-10:
    The targets left arm explodes causing 3d10 damage to the target and half that to anyone withing 5ft of them.
    11-20:
    The targets kneecap shatters giving them a permanent limp, reducing their speed by 10ft
    21-30:
    The targets nose falls off leaving a hideous pair of holes. Any check relying on smell now has disadvantage.
    31-49:
    The target loses an ear. Ability checks relying on sound have disadvantage.
    50:
    One of the targets eyes falls out, with only one eye the target has disadvantage on all vision based checks and saves.
    51-65:
    The targets hair falls out in patches all across their body, until the target has the opportunity to shave the remaining hair they have disadvantage on charisma checks.
    66-80:
    The targets skin turns a horrible shade of brownish yellow for 2d6 days, for the duration most creatures will shy away fearing a contagion.
    81-89:
    The target feels a pop inside their ear, and start feeling unsteady on their feet as their balance centre is damaged. All dexterity checks and saves have disadvantage.
    90-95: 
    The target's left hand falls off leaving a stump.
    Unless the target was right handed, they have a -1d4 penalty to attacks and checks using their off-hand
    96-99:
    The target's right hand falls off leaving a stump. Unless the target was left handed, they have a -1d4 penalty to attacks and checks using their off-hand
    100:
    One of the targets toes falls off),
    target: ['Creature'],
    trace: '1 Round',
    draw: '1 Round',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Condense').id, Structure.find_by(name: 'Atomizer').id],
    tag_ids: [5],
    tldr: "Cause serious damage to target"
)

# Power Structures
puts 'Power...'

Structure.create(
    name: 'Blade of Woe',
    description: %(The target weapon leaps into the air and mirrors the casters moves, moving to flank any creature they attack.

    Once per turn when the user attacks a creature they gain flanking advantage, and can make a free attack with the Blade of Woe. The Blade of Woe replaces the weapons original damage with 6d10 Radiant damage.),
    target: ['Metal Weapon'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Avenger Blade').id, Structure.find_by(name: 'Holy Wrath').id],
    tag_ids: [7],
    tldr: "Whats smaller than small?\nCreate a demiplane"
)

Structure.create(
    name: 'Blinding Light',
    description: %(The ammunition turns slightly transparent and radiates light with a blinding light at the tip, all damage done with the ammunition while the rune is active is radiant damage.

    Any attack roll of 17 or above with this ammunition counts as a critical hit. 
    
    Any creature hit with this ammunition is Blinded until the rune fades. Any creature hit with a critical hit with this ammunition is blind for 1 Hour.),
    target: ['Quiver', 'Ammunition Container'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Piercing Light').id, Structure.find_by(name: 'Piercing Light').id],
    tag_ids: [],
    tldr: "High crit ammo"
)

Structure.create(
    name: 'Automaton',
    description: %(The armour comes to life as an Automaton. As part of the casting you must equip the Automaton with the target armour, and you may equip one weapon.

    The Automaton has the same Initiative as you and you control it.
    
    When the Automaton dies or the rune fades, the target armour crumbles to ash, and any equipment it is carrying falls to the ground.
    
    The Automaton has 10d12 health, 15 STR, 10 DEX, 15 CON, 1 INT/WIS/CHA),
    target: ['Heavy Armour'],
    trace: '5 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Mass Disarm').id, Structure.find_by(name: 'Golden Armour').id],
    tag_ids: [],
    tldr: "Armour to spare?\nBring spare armour to life"
)

Structure.create(
    name: 'Gamma Ray',
    description: %(You look in a direction and a tight beam of radiation emits from your eyes to a maximum distance of 120ft.

    The closest creature in the line must make a DEX saving throw to dodge your gaze or take 6d6 fire damage and 6d6 radiant damage.
    
    If the target avoids your gaze or dies from the damage, the ray moves on to the next creature in the line, and continues until either a creature takes damage and does not die, or the beam reaches 120ft.),
    target: ['Self'],
    trace: 'Instant',
    draw: 'Instant',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Incineraotr').id, Structure.find_by(name: 'Lasik').id],
    tag_ids: [2],
    tldr: "120ft line of death"
)

Structure.create(
    name: 'Redirection',
    description: %(For the duration, any time an attack would hit you, you may use your reaction to attempt to redirect the attack. The attacker must make a STR saving throw.

    On a failed save the weapon flies from their hands as it hits you, and gets propelled to a target of your choice within 60ft. If the attack would hit the new target, it critically hits them.
    
    On a save, you take half the damage, and the attacker takes the other half.),
    target: ['Self'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Cold Shoulder').id, Structure.find_by(name: 'Fireworks').id],
    tag_ids: [4],
    tldr: "Reaction to redirect attack from self"
)

Structure.create(
    name: 'Hammer and Anvil',
    description: %(A shadow appears covering an area 60ft in radius from the structure.

    The structure expires at the end of your second turn, at that time, a massive hammer drops from the sky at the same time as the ground hardens. Any creature in the shadowed area takes 8d12 bludgeoning damage and 8d12 force damage and falls prone.),
    target: ['Surface'],
    trace: '2 Rounds',
    draw: '2 Rounds',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: "Thor's Hammer").id, Structure.find_by(name: 'Force Wall').id],
    tag_ids: [2],
    tldr: "120ft squash zone"
)

Structure.create(
    name: 'Liars Bane',
    description: %(Any creature that lies within 30ft of you takes 2d12 psychic damage, and must make a constitution saving throw or a performance ability check to avoid wincing and giving away their lie.),
    target: ['Self'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Psychogalvanize').id, Structure.find_by(name: 'Holy Wrath').id],
    tag_ids: [3],
    tldr: "Aura of lie punishing"
)

# Death Structures
puts 'Death...'

Structure.create(
    name: 'Aura of Terror',
    description: %(For the duration, a 20ft radius aura from you causes enemies to be battered by psychological terror.

    Any enemy creature that voluntarily moves within the aura must make a WIS or INT saving throw for each 5ft of movement. On a failed save the creature is paralyzed until the start of their next turn.),
    target: ['Self'],
    trace: '3 Rounds',
    draw: '5 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Repellent').id, Structure.find_by(name: 'Mindful Scream').id],
    tag_ids: [3],
    tldr: "Para Aura"
)

Structure.create(
    name: 'Exposure',
    description: %(For the duration, a 10ft radius aura from you magnifies damage against enemy creatures.

    Any enemy creature that takes damage within the aura takes double all dice rolls of damage and becomes immune to exposure for the next 1 minute.),
    target: ['Self'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Brief Exposure').id, Structure.find_by(name: "Vlad's Legacy").id],
    tag_ids: [3],
    tldr: "Crit Aura"
)

Structure.create(
    name: 'Endless March',
    description: %(The targets speed is reduced to 5ft, and each turn if they are not within 5ft of an enemy, they must take the dash action.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Funeral March').id, Structure.find_by(name: 'Funeral March').id],
    tag_ids: [5],
    tldr: "Catch me if you can!\nSlows enemy movement + forces dash"
)

Structure.create(
    name: 'Mile High Club',
    description: %(Every creature within 60ft of the structure instantly teleports 1 mile straight up.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Inverted Quake').id, Structure.find_by(name: 'Facsimile').id],
    tag_ids: [2],
    tldr: "Up Up and away!\nMoves the fight to the sky"
)

Structure.create(
    name: 'Hellstrike',
    description: %(Any creature you hit with a melee weapon attack that exceeds their AC by 5 or more is banished to a random circle of hell.),
    target: ['Self'],
    trace: '3 Rounds',
    draw: '5 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Hell on Earth').id, Structure.find_by(name: 'Facsimile').id],
    tag_ids: [],
    tldr: "Wheres my scythe?\nSend enemies to hell"
)

Structure.create(
    name: "Death's Embrace",
    description: %(Dark shadows start to form around the target, and increase each round.

    If the target has more than 1 hitpoint when the structure expires, they take 18d10 Psychic damage and 18d10 Force damage.
    
    The target is disintegrated if this damage leaves it with 0 hit points.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '5 Rounds',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Funeral March').id, Structure.find_by(name: 'Grim Reaper').id],
    tag_ids: [],
    tldr: "30 secound countdown to death."
)

Structure.create(
    name: "Implosion",
    description: %(Every manmade structure, wall, or object not being carried by a living creature in a 60ft radius from the structure shimmers and disappears.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Collapsing').id, Structure.find_by(name: 'Atomizer').id],
    tag_ids: [2],
    tldr: "Remove cover/buildings"
)

# Life Structures
puts 'Life...'

Structure.create(
    name: 'Vampirism',
    description: %(For the duration the target has 20 DEX/CON/STR, but is vulnerable to Radiant damage, and damage dealt by silver weapons. For every hour spent in daylight the target gains 1 point of exhaustion. No amount of clothing can protect them from daylight, aside from being underneath at least 10ft of solid material\(dirt/stone/wood\)

    The target can chose to drink the lifeblood of a living creature of size medium or larger to remove 1 point of exhaustion and extend the duration by 12 Hours.
    
    The target gains the Blood Drinking ability:
    
    Blood Drinking   
    As a bonus action you can drink the blood of a medium or larger creature, dealing 1d4 points of damage per character level. Killing a creature with this damage counts as drinking its lifeblood.),
    target: ['Creature'],
    trace: '12 Hours',
    draw: '1 Day',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Blood Drinking').id, Structure.find_by(name: 'Blood Drinking').id],
    tag_ids: [4, 5],
    tldr: "Make someone a Vampire"
)

Structure.create(
    name: 'Good Night',
    description: %(A sphere 20ft in diameter from the rune becomes a safe haven.

    Any creature outside the sphere finds itself unable to look at the sphere without making a DC 30 Wisdom ability check.
    
    The sphere itself is a Wall of Force that also blocks light and sound from leaving the sphere.
    
    If the sphere is exposed to daylight for more than 30 minutes the structure collapses along with the wall.),
    target: ['Surface'],
    trace: '6 Hours',
    draw: '12 Hours',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Safe Passage').id, Structure.find_by(name: 'Dawnbringer').id],
    tag_ids: [7],
    tldr: "Safe camping"
)

Structure.create(
    name: 'Four Seasons',
    description: %(Four 60ft cones radiate out from you, one for each compass direction. North starts with summer, East Spring, South Winter, West Autumn. At the start of your turn the cones rotate clockwise - Summer becomes Autumn, Autumn becomes Winter and so on.

    Summer: Each Creature in the area takes 5d12 Fire damage.
    
    Autumn: Each creature in the area must make a Dexterity save or be hit by lightning, taking 8d8 Lightning damage.
    
    Winter: Each creature takes 5d10 Cold damage and has its speed reduced to 10ft while it is in the area.
    
    Spring: The ground is covered in water and becomes difficult terrain. Each creature must succeed on a Dexterity saving throw or fall prone. A creature that enters the area or starts its turn there must also succeed on a Dexterity saving throw or fall prone.),
    target: ['Self'],
    trace: '4 Rounds',
    draw: '4 Rounds',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Frostwave').id, Structure.find_by(name: 'Late Autumn').id],
    tag_ids: [2],
    tldr: "60ft circle of mass damage"
)

Structure.create(
    name: 'Revitalization',
    description: %(A strange black rain starts falling in a 60ft cube centered on the structure. All enemies in the area take 8d4 necrotic damage. The total damage dealt can be redistributed as healing among creatures of your choice in the area.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Rain Dance').id, Structure.find_by(name: 'Volcanic Storm').id],
    tag_ids: [1, 2],
    tldr: "Damage bad guys, heal good guys"
)

Structure.create(
    name: 'Atmospheric Shell',
    description: %(Your armour and clothing becomes gaseous moving to intercept elemental damage.

    For the duration, you have vulnerability to Bludgeoning, Piercing, Slashing and Psychic damage. All other damage types heal you rather than damage you.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '5 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Chill Form').id, Structure.find_by(name: 'Gas Mask').id],
    tag_ids: [1, 4, 5],
    tldr: "Non physical damage heals target"
)

Structure.create(
    name: 'Aura of Life',
    description: %(A 30ft radius aura of life forms around you.

    Every living creature that starts its turn inside the aura regains 3d10 hitpoints. Every undead creature that starts its turn inside the aura takes 3d10 Radiant damage.),
    target: ['Self'],
    trace: '5 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Circle of Protection').id, Structure.find_by(name: 'Circle of Protection').id],
    tag_ids: [1, 3],
    tldr: "Heal living, damage undead"
)

Structure.create(
    name: 'Protection from Death',
    description: %(Damage that would reduce the target to 0 hitpoitns instead reduces them to 1 hitpoint, and they become encased in ice as in the Cryogenics structure until the next dawn and are teleported to the last place they woke from a long rest.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '4 Hours',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Hoarfrost').id, Structure.find_by(name: 'Last Stand').id],
    tag_ids: [],
    tldr: "Planned death prevention"
)

# Neutral Structures
puts 'Neutral...'

Structure.create(
    name: 'Reallocation',
    description: %(The target weapon jumps 10ft into the air above the caster and hovers there.

    As a bonus action of the casters turn, you can move the weapon up to 60ft then make a melee attack against an enemy creature.
    On a successful hit, a 60ft cone of energy bursts out from the weapon in the direction it attacked, spreading healing power equal to the damage dealt, starting at the closest ally in the cone, and reducing the healing power until it is used up, or the ally is fully healed, then moving on to the next if there is any healing power remaining.
    When the structure fades the weapon flies back to you and falls at your feet.),
    target: ['Melee Weapon'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Cirlce of Protection').id, Structure.find_by(name: 'Avenger Blade').id],
    tag_ids: [1,2],
    tldr: "Share the love\nDamage an enemy, heal allies in a cone"
)

Structure.create(
    name: 'Metempsychosis',
    description: %(For the duration, any number of people can share their memories of a dead humanoid. Each person who shares a memory may make a History check, the numbers are added together, so the more people who share, the lower the risk of mishaps. 

    At the discretion of the DM, based on the manner of the death, the time since the death, and the similarities between their previous body and the new one, there may be differences.
    
    If the target happens to be not deceased, or their soul is trapped somewhere, it is possible for another entity to inhabit the new body, using the shared memories as a knowledge base of who the caster was expecting.),
    target: ['Humanoid Corpse dead no longer than 1 hour'],
    trace: '10 Minutes',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'False Phoenix').id, Structure.find_by(name: 'Rememberance').id],
    tag_ids: [1, 7],
    tldr: "Lets recast this actor\nResurrect someone into a new body"
)

Structure.create(
    name: 'Extended Servitude',
    description: %(If the target is reduced to 0 hitpoints while this structure is active, they are healed to half their max hitpoints and become an undead creature of the same type as their previous form.

    While undead they cannot regain hitpoints in any way, are immune\(cannot be the target\) to rune structures, and are under the control of the caster. Each hour they take 1d4 damage as their body slowly falls apart.),
    target: ['Creature'],
    trace: '10 Minutes',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Blood Drinking').id, Structure.find_by(name: 'Toadie').id],
    tag_ids: [],
    tldr: "Target comes back as an undead servant"
)

Structure.create(
    name: 'Deweaponize',
    description: %(A 60ft cone spreads out from the structure, causing all held weapons in the area to twist and shake, each creature must make a strength saving throw or let go of their main hand weapon. Weapons let go fly straight up 120ft and hover above their owners. When the rune fades, the weapons drop, and any creature underneath takes 12d6 bludgeoning damage as well as damage equal to the weapons damage.),
    target: ['Surface'],
    trace: '1 Round',
    draw: '1 Round',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Repellent').id, Structure.find_by(name: 'Mass Disarm').id],
    tag_ids: [2],
    tldr: "Disarm in 60ft cone"
)

Structure.create(
    name: 'Last Rites',
    description: %(For the duration, any creature touching the target is immune to all damage, and any new condition effect such as stunned or restrained. Creatures touching the target can all move together 60ft carrying the target at the end of the round if they didn't use their action this round.),
    target: ['Corpse of a creature that died less than 1 minute ago'],
    trace: '3 Rounds',
    draw: '5 Minutes',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Funeral March').id, Structure.find_by(name: 'Safe Passage').id],
    tag_ids: [],
    tldr: "Immunity period - safe run away"
)

Structure.create(
    name: 'Sticky Tar',
    description: %(The target goes flying up to 60ft towards a point you can see, upon impact it explodes spreading sticky black tar in a 10ft radius area. Any creature in that area becomes restrained, they can make a athletics check to break free as an action on their turn, or be freed by another creature making a athletics check as an action. The ground in the area becomes difficult terrain.),
    target: ['Corpse'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Cannonball').id, Structure.find_by(name: 'Quagmire').id],
    tag_ids: [2],
    tldr: "Mass restrain using a corpse"
)

Structure.create(
    name: 'Undeath',
    description: %(Any creature you kill while this structure is active returns as n Agony that follows the caster around until it dies.

    The Agony cannot harm the caster or anyone they deem allies. Upon rising for the first time, and each time the caster takes a short or long rest, the Agony rolls a 100 sided die, on a 100 the agony breaks free and is able to harm its caster.),
    target: ['Self'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Last Stand').id, Structure.find_by(name: 'Grim Reaper').id],
    tag_ids: [],
    tldr: "Build up an army of undead"
)
