# Four Rune Structures

puts 'Adding four rune structures'

# Mind Structures
puts 'Mind...'

Structure.create(
    name: 'Alexithymia',
    description: %(Any time in the duration the target feels any strong emotion, they become dizzy and faint and must make a CON saving throw of vomit.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Calming Presence').id, Structure.find_by(name: 'Nausea').id]
)

Structure.create(
    name: 'Cannonball',
    description: %(The target gets pushed 200ft into the air instantaneously, and will fall to the ground at the end of their next turn.),
    target: ['Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Airlift').id, Structure.find_by(name: 'Swift Wind').id]
)

Structure.create(
    name: 'Condense',
    description: %(The target feels a great strain on their body as forces push down on them from above, and up from below.

    Until the rune fades, the target becomes 2ft shorter.
    This structure cannot be used on creatures less than 2.5ft tall.),
    target: ['Creature'],
    trace: '1 Day',
    draw: '1 Month',
    strained: true,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Updraft').id, Structure.find_by(name: 'Downforce').id]
)

Structure.create(
    name: 'Fleeting Dementia',
    description: %(You afflict the target with a form of Long-Term Madness for the duration.),
    target: ['Creature'],
    trace: '1 Day',
    draw: '1 Month',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Reckoning').id, Structure.find_by(name: 'Mindbend').id]
)

Structure.create(
    name: 'Psychogalvanize',
    description: %(Any creature within 1ft of the structure can more easily determine if someone they can see is lying to them. They gain +15 to insight checks and their passive insight.),
    target: ['Surface'],
    trace: '10 Minutes',
    draw: '12 Hours',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Mindread').id, Structure.find_by(name: 'Light Shell').id]
)

Structure.create(
    name: 'Snowglobe',
    description: %(An icy dome appears around the target, encasing them in a transparent globe.

    For the duration nothing can cross the icy wall as if it was a wall of force.
    The caster can as an action make the cold inside unbarable temporarily, causing snow to fall inside the globe, and dealing 1d6 cold damage to the creature inside.),
    target: ['Creature'],
    trace: '2 Minutes',
    draw: '1 Hour',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Frostburn').id, Structure.find_by(name: 'Force Field').id]
)

Structure.create(
    name: 'Synesthesia',
    description: %(You see faint outlines around people when they speak, in shifting colours depending on what they believe.

    Red - They are lying.
    
    White - They believe what they are saying to their core.
    
    Blue - They heard it from someone they believed.
    Green - They are telling the truth but omitting something.),
    target: ['Self'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Enhanced Vision').id, Structure.find_by(name: 'Mindread').id]
)

Structure.create(
    name: 'Toadie',
    description: %(For the duration, all creatures within 30ft of you think you are the most wonderful and amazing person around, and will do and tell you whatever they think you want to know to make you happy.),
    target: ['Self'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Pretty Pictures').id, Structure.find_by(name: 'Daymare').id]
)

# Power Structures
puts 'Power...'

Structure.create(
    name: 'Avenger Blade',
    description: %(The target weapon jumps 10ft into the air above the caster and hovers there.

    While the structure is active, any time an ally within 30ft is attacked, the weapon will fly down and make an attack as if from your hand against the attacker.
    When the structure fades, the weapon drops to your feet.),
    target: ['Metal Weapon'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Backlash').id, Structure.find_by(name: 'Revengance').id]
)

Structure.create(
    name: 'Cold Shoulder',
    description: %(While the structure is active any time a creature attacks your back, flames reach up to lick the weapon, and then turn to ice trapping the weapon and causing the attack to miss.
    The attacker must make a STR saving throw to pull the weapon free, or be grappled unless they drop the weapon.),
    target: ['Metal Armour'],
    trace: '5 Rounds',
    draw: '20 Minutes',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Repressed Anger').id, Structure.find_by(name: 'Emberbane').id]
)

Structure.create(
    name: 'Fireworks',
    description: %(Flaming balls shoot up from the structure until thei hit the ceiling or reach 100ft, where they explode into a shower of stars, distracting all creatures within 100ft who have not seen fireworks before, stunning them for 1 round.
    If the ceiling is less than 80ft high, the shower of stars damages every creature in the area at the start of your next turn, dealing 6d6 fire damage.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Shockwave').id, Structure.find_by(name: 'Starburst').id]
)

Structure.create(
    name: 'Frostbite Blade',
    description: %(The target weapon emanates cold, and any creature damaged by it gains the Frostblood virus.),
    additional: %(Frostblood is a nasty virus that affects a creatures red blood cells, slowly turning them to ice until the creature becomes a statue with their soul trapped inside.

    Each round while a creature has this condition, their maximum hitpoints is reduced by 1d6 - their CON modifier or 1 whichever is higher, as their blood freezes.
    
    For every 20 maximum hitpoints reduced by frostblood, the creature loses 1 point of Dexterity.
    
    Frostblood is cured if the target takes 10 or more fire damage from a single source.
    A creature reduced to 0 maximum hitpoints while infected with frostblood dies and becomes an ice statue, with their soul trapped inside and unable to move.),
    target: ['Metal Weapon'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Stone Strike').id, Structure.find_by(name: 'Frostburn').id]
)

Structure.create(
    name: 'Golden Armour',
    description: %(Your armour takes on a golden sheen as it glows with power.
    Your AC is increased by 1 for the duration, and any creature within 10ft that deals damage to you takes half the damage they dealt as radiant damage as the armour flares brightly and sends a pulse of energy through the attackers weapon.),
    target: ['Metal Armour'],
    trace: '5 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Armour of Power').id, Structure.find_by(name: 'Halo').id]
)

Structure.create(
    name: 'Holy Wrath',
    description: %(At the start of each of their turns, a beam of holy light comes down from the heavens, dealing 6d10 radiant damage to the target, and half as much damage to any creature within 10ft of them.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '20 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Holy Flame').id, Structure.find_by(name: 'Meteor Storm').id]
)

Structure.create(
    name: 'Incinerator',
    description: %(The target is encased in a crystal shell, flames fill the shell burning the creature inside.

    At the start of the target creatures round, they take 4d6 fire damage. While inside the shell they are considered blind.
    The shell has 50hp and an AC of 14.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Napalm').id, Structure.find_by(name: 'Light Shell').id]
)

Structure.create(
    name: 'Lasik',
    description: %(You look in a direction and a tight beam of light emmits from your eyes to a maximum distance of 60ft.

    The closest creature in the line must make a DEX saving throw to dodge your gaze or take 4d6 fire damage.
    If the target avoids your gaze or dies from the damage, the laser moves on to the next creature in the line, and continues until either a creature takes damage and does not die, or the beam eaches 60ft.),
    target: ['Self'],
    trace: 'instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Fire Starter').id, Structure.find_by(name: 'Light Beam').id]
)

Structure.create(
    name: 'Mass Disarm',
    description: %(A 30ft cone spreads out from the structure, causing momentary rage in all creatures in its area. Each creature in the area throws any weapons and shields currently being held to the ground and howls at the sky similar to how a wolf howls at the moon.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Savagery').id, Structure.find_by(name: 'Shockwave').id]
)

Structure.create(
    name: 'Piercing Light',
    description: %(The ammunition turns slightly transparent and radiates light, all damage done with the ammunition while the rune is active deals radiant damage, and targets all creatures a straight line\(separate attack rolls needed for each target\) as it flies through the targets and continues on until it reaches the end of its range.

    Attack rolls have disadvantage once the ammunition reaches the long range distance.),
    target: ['Quiver', 'Ammunition Container'],
    trace: '5 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Forge Blade').id, Structure.find_by(name: 'Light Trick').id]
)

Structure.create(
    name: "Thor's Hammer",
    description: %(A massive translucent hammer drops from the sky, its head 40ft in diameter, the ground where it hits drops 10ft, and a bright flaming ring stays around the outside of the hole for the duration.

    Any creature in the area when the hammer drops takes 8d6 bludgeoning damage and falls prone.
    
    Any creature crossing the edge of the ring while the structure is active takes 4d6 fire damage.
    The hole stays after the structure fades.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '30 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Sinkhole').id, Structure.find_by(name: 'Halo').id]
)

# Death Structures
puts 'Death...'

Structure.create(
    name: 'Brief Exposure',
    description: %(The targets armour seems to take on a life of its own, instead of protecting its wearer it enhances the blows of their enemies.
         
        The target is vulnerable to all damage unless they have resistance or immunity to the damage type, in that case they lose their immunity or resistance instead.),
    target: ['Creature'],
    trace: '2 Rounds',
    draw: '2 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Disrobe').id, Structure.find_by(name: 'Corruption').id]
)

Structure.create(
    name: 'Earthen Shell',
    description: %(A dome of solid stone 5ft thick appears 10ft from you, any creature in the 5ft thick section gets pushed outside the dome.
         
        While the structure is active, you can clearly see outside the dome to a range of 120ft, and on each of your turns may use your bonus action to attack a target within 120ft, making a melee spell attack, and on a hit dealing 8d4 bludgeoning damage as the earth they are standing on strikes at them.
         
        The dome is resistant to piercing, slahsing and bludgeoning damage, and immune to psychic, necrotic and radiant damage.
        The dome will collapse if 100 damage is dealt to it.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Seismic Sight').id, Structure.find_by(name: 'Stone Strike').id]
)

Structure.create(
    name: 'Facsimile',
    description: %(When submerged in water, the caster can select another Facsimile structure within 100,000 miles, that becomes the target location, and anybody submerging themselves in the water above the rune will be teleported to that location.
        At any time the caster can change the target location to any known Facsimile structures.
         
        The caster is the only one who can change the target, but the target doesnt need to be created by the caster.),
    target: ['Surface'],
    trace: '1 Day',
    draw: '1 Year',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'DemiVitae').id, Structure.find_by(name: 'Phoenix').id]
)

Structure.create(
    name: 'Funeral March',
    description: %(Every 5ft of voluntary movement the target takes 1d4 points of damage.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Iron Boot').id, Structure.find_by(name: 'Death March').id]
)

Structure.create(
    name: 'Hell on Earth',
    description: %(Hostile creatures within 60ft see the world change before them, everything looks burnt, ash floats in the air, everywhere they look they see devils, including an archdevil.
    For the duration, as long as they are inside the structures area hostile creatures will attack the nearest creature to them, they are also Frightened of the caster whom they percieve as an archdevil.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '20 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Hellscape').id, Structure.find_by(name: 'Disrobe').id]
)

Structure.create(
    name: 'Inverted Quake',
    description: %(Any creature on at least 5ft higher ground than the rune must make a DEX saving throw at the start of each of their turns or be knocked prone and have a movement speed of 0 until their next turn.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Natural Wall').id, Structure.find_by(name: 'Tremor').id]
)

Structure.create(
    name: 'Mindful Scream',
    description: %(As a bonus action on each of your turns, you may target a creature that you can see within 60ft of you and scream telepathically into their mind.
    The target is crippled by the scream and becomes Paralyzed until the start of your next turn.),
    target: ['Self'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Mind Shell').id, Structure.find_by(name: 'Light Shell').id]
)

Structure.create(
    name: 'Quagmire',
    description: %(A line 60ft long and 20ft wide no more than 30ft from the structure appears to melt before your eyes.
        All creatures in the line must make a DEX saving throw to jump free of the area, or sink into the ground up to their necks on a failed save.
        Any creature trapped can make an Athletics check with disadvantage against your Rune Save DC to try and climb out, otherwise they are Incapacitated and Restrained.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Transmutation').id, Structure.find_by(name: 'Moat').id]
)

Structure.create(
    name: 'Repellent',
    description: %(The first time each round an attack would hit the target, the damage is instead dealt to the attacker.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '20 Minutes',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Protective Shell').id, Structure.find_by(name: 'Hidden Defences').id]
)

Structure.create(
    name: "Vlad's Legacy",
    description: %(When the target takes damage for the first time in a round, the ground beneath its attacker erupts in a sharp spike dealing 4d8 Piercing damage and they become restrained until the start of their next turn.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Impaler').id, Structure.find_by(name: 'Hidden Defences').id]
)

# Life Structures
puts 'Life...'

Structure.create(
    name: 'Blood Drinking',
    description: %(You can fill a flask or bottle with the blood of a corpse that has been dead no longer than 1 minute. The runes purify the blood creating a drinkable solution that heals you.
        You gain one Potion of Healing for a Small or smaller creature, one Potion of Greater Healing for the blood of a Medium to Large creature, or one Potion of Superior Healing for creatures Huge or larger.
         
        This structure fails if the creature does not have blood.),
    target: ['Corpse'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Lifeblood').id, Structure.find_by(name: 'Water of Life').id]
)

Structure.create(
    name: 'Chill Form',
    description: %(You become immune to all damage aside from Bludgeoning and Fire damage.
        You be come vulnerable to Bludgeoning damage.
        If you take more than 30 fire damage from a single source, the structure fades.),
    target: ['Self'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Cold Blooded').id, Structure.find_by(name: 'Cryogenics').id]
)

Structure.create(
    name: 'Circle of Protection',
    description: %(A 60ft aura surrounds you, protecting you and your allies from deaths touch.
        When you or an ally inside the aura drop to 0hp, they are restored to their maximum hp and the aura fades.),
    target: ['Self'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Restoration').id, Structure.find_by(name: 'Ring of Life').id]
)

Structure.create(
    name: 'Dawnbringer',
    description: %(The sky lights up as bright as day for 1 mile in all directions, and the air around you fills with small crystals, looking into the crystals you can see clearly any point within a 1 mile radius.
         
        You have +10 to perception checks to see anything within 1 mile, however as you cannot look everywhere at once, your search will need to be focussed.),
    target: ['Self'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Clarification').id, Structure.find_by(name: 'Starburst').id]
)

Structure.create(
    name: 'Frostwave',
    description: %(A wave manifests in a ring around the caster and instantly turns to ice.
        The wave is 20ft thick, 20ft high, and starts 20ft away from the caster.
         
        Creatures caught in the ring have no air and start Suffocating.
         
        While encased in the ice, creatures are immune to all damage except psychic damage and the cold damage the ring deals itself.),
    target: ['Self'],
    trace: '2 Minutes',
    draw: '2 Hours',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'High Tide').id, Structure.find_by(name: 'Cold Snap').id]
)

Structure.create(
    name: 'Gas Mask',
    description: %(A sealed helmet covers the targets head and starts filling with fumes.
        For the duration the target is blinded, and starts suffocating.
         
        The helmet has 50hp and an AC equal to the targets AC, destroying the helmet causes the structure to fade.),
    target: ['Creature'],
    trace: '2 Minutes',
    draw: '2 Hours',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Bubble Boy').id, Structure.find_by(name: 'Volcanic Cloud').id]
)

Structure.create(
    name: 'Late Autumn',
    description: %(Leaves appear in the air swirling around you to a distance of 60ft.
        While the structure is active you have 3/4 cover.
        As a bonus action on your turn you can select up to 6 creatures inside the leafy aura, the leaves start swirlding closer to those targets cutting them with their edges dealing 10d4 slashing damage to each target.),
    target: ['Self'],
    trace: '5 Rounds',
    draw: '20 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Autumn').id, Structure.find_by(name: 'Leafy Amalgimate').id]
)

Structure.create(
    name: 'Rain Dance',
    description: %(Rain starts pouring down in a 120ft cube above the structure For the duration the caster can walk on the rain, giving them a flying speed of 60ft while inside the structures area. Any time the caster attacks a creature below them, they have advantage as the rain falls into the enemies eyes.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '2 Hours',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Water Walk').id, Structure.find_by(name: 'Downpour').id]
)

Structure.create(
    name: 'Safe Passage',
    description: %(The target shrinks to be 1 inch tall, and becomes encased in a protective bubble 1 inch from them.
        While inside this 3 inch bubble they can be carried safely through most environments.
        Inside the bubble is a perfect temperature for the target, provides oxygen, and prevents anything from getting inside including spells and spell effects.
         
        The bubble has 100hp and 20AC, if the bubble is destroyed the target returns to their normal size.),
    target: ['Creature'],
    trace: '10 Minutes',
    draw: '10 Hours',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Miniaturization').id, Structure.find_by(name: 'Bubble Boy').id]
)

Structure.create(
    name: 'Volcanic Storm',
    description: %(A sudden hail storm fills a 60ft cube, however they all seem to bounce off creatures without harming them.
 
    24 random squares inside the cube immediately turn to lava, any creature on one of those squares must make a DEX saving throw to jump to the nearest clear square within 10ft, or take 18d10 fire damage on a failed save.),
    target: ['Surface'],
    trace: '6 Rounds',
    draw: '6 Rounds',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Effusive Eruption').id, Structure.find_by(name: 'Hail Storm').id]
)

# Neutral Structures
puts 'Neutral...'

Structure.create(
    name: 'Anti-Gravity',
    description: %(This structure reverses gravity in a 50-foot-radius, 100-foot-high cylinder with an edge touching the structure. All creatures and objects that aren't somehow anchored to the ground in the area fall upward and reach the top of the area when you draw this structure. A creature can make a Dexterity saving throw to grab onto a fixed object it can reach, thus avoiding the fall.

    If some solid object \(such as a ceiling\) is encountered in this fall, falling objects and creatures strike it just as they would during a normal downward fall. If an object or creature reaches the top of the area without striking anything, it remains there, oscillating slightly, for the duration.
    
    At the end of the duration, affected objects and creatures fall back down.),
    target: ['Surface'],
    trace: '1 Minute',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Savagery').id, Structure.find_by(name: 'Airlift').id]
)

Structure.create(
    name: 'Atomizer',
    description: %(If the target drops to 0hp while this structure is active, they deal 18d10 force damage to all creatures  and structures within 300ft.),
    target: ['Creature'],
    trace: '1 Hour',
    draw: '1 Day',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Meteor Storm').id, Structure.find_by(name: 'Hidden Defences').id]
)

Structure.create(
    name: 'Collapsing',
    description: %(If there is a hollow area less than 10ft beneath the structure, the floor crubmles to dust around the structure to the size of the room or tunnel below, dropping all creatures to the room below.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Downforce').id, Structure.find_by(name: 'Tremor').id]
)

Structure.create(
    name: 'False Phoenix',
    description: %(The target believes they are invincible and will attack rekclessly.

    If the target has a shield they will drop it.
    The targets AC is reduced by 2, and all attacks against the target have advantage. The targets attack and damage rolls have +2.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '20 Minutes',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Disturbia').id, Structure.find_by(name: 'Phoenix').id]
)

Structure.create(
    name: 'Force Wall',
    description: %(An invisible wall of force springs into existence at a point you choose within 60 feet of the structure. The wall appears in any orientation you choose, as a horizontal or vertical barrier or at an angle. It can be free floating or resting on a solid surface. You can form it into a hemispherical dome or a sphere with a radius of up to 10 feet, or you can shape a flat surface made up of ten 10-foot-by-10-foot panels. Each panel must be contiguous with another panel. In any form, the wall is 1/4 inch thick. It lasts for the duration. If the wall cuts through a creature's space when it appears, the creature is pushed to one side of the wall \(your choice which side\).

    Nothing can physically pass through the wall. It is immune to all damage and can't be dispelled by dispel magic. A disintegrate spell destroys the wall instantly, however. The wall also extends into the Ethereal Plane, blocking ethereal travel through the wall.),
    target: ['Surface'],
    trace: '10 Minutes',
    draw: '10 Hours',
    strained: true,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Natural Wall').id, Structure.find_by(name: 'Force Field').id]
)

Structure.create(
    name: 'Grim Reaper',
    description: %(This is a Fluid Rune.
    A shadowy form appears above the structure holding a scythe.

    The caster selects a target creature, which the structure slides across the ground and attaches itself to, and the figure sets that creature as its target.
    The target is Frightened of the shadowy form.
    At the end of the target creatures turn, the shadowy from moves 20ft towards them and attempts to swing its scythe through them. The shadowy form has 10ft reach, and if it touches its target, the target takes 18d10 psychic damage.),
    additional: %(Fluid Runes can be transferred to another target of the same type as a bonus action on your turn, or as a reaction when the rune is about to be destroyed  - it still affects the target but is moved instead of being destroyed. Cannot be used on the turn the rune is cast.
    Fluid runes have a range of 120ft),
    target: ['Surface'],
    trace: '1 Minute',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Reckoning').id, Structure.find_by(name: 'Ghost').id]
)

Structure.create(
    name: 'Hoarfrost',
    description: %(The air starts to freeze in a 30ft cube with an edge touching the structure.

    While inside the area, creatures movement speed is reduced to 5ft.
    Any creature starting their turn inside the cube takes 10 damage for each round the cube has been active.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '10 Minutes',
    strained: true,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Cryogenics').id, Structure.find_by(name: 'Updraft').id]
)

Structure.create(
    name: 'Last Stand',
    description: %(If the target drops to 0hp while this structure is active, the structure flares, encasing the body in fiery light and giving the creature a last push of strength.
    While encased in the fiery light, the target has advantage on all attacks, and a roll of 18 or more on the attack die counts as a critical. However the target cannot be healed, and at the end of their next turn they fall unconscious and instantly lose 2 death saving throws, and the structure fades.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Lifeblood').id, Structure.find_by(name: 'Smiths Strength').id]
)

Structure.create(
    name: 'Rememberance',
    description: %(A wall of light, 10ft wide and 10ft high appears 10ft in front of the target.
    For the duration, the target can show memories on the wall. If the target is coerced into thinking about something that triggers a memory, that memory will show.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Wall of Light').id, Structure.find_by(name: 'Fluid Thoughts').id]
)

Structure.create(
    name: 'Snail Trail',
    description: %(The targets boots appear to cover in rust, and then as they walk they leave a thick layer of rust on the ground behind them.

    The target becomes Immune to Russet Mold for 1 hour, and the trail they leave behind is Russet Mold),
    additional: %(The fungus known as russet mold is reddish-brown in color and found only in places that are dark, warm, and wet. Russet mold that spreads out across a metal object can be mistaken for natural rust, and a successful DC 15 Intelligence \(Nature\) or Wisdom \(Survival\) check is required to identify it accurately by sight in such a case.

    Any creature that comes within 5 feet of russet mold must make a DC 13 Constitution saving throw as the mold emits a puff of spores. On a failed save, the creature becomes poisoned. While poisoned in this way, the creature takes 2d6 poison damage at the start of each of its turns, sprouting mold as it takes damage. The creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. Any magic that neutralizes poison or cures disease kills the infestation. A creature reduced to 0 hit points by the mold's poison damage dies. If the dead creature is a beast, a giant, or a humanoid, one or more newborn vegepygmies emerge from its body 24 hours later: one newborn from a Small corpse, two from a Medium corpse, four from a Large corpse, eight from a Huge corpse, or sixteen from a Gargantuan corpse.
    
    Russet mold can be hard to kill, since weapons and most types of damage do it no harm. Effects that deal acid, necrotic, or radiant damage kill 1 square foot of russet mold per 1 damage dealt. A pound of salt, a gallon of alcohol, or a magical effect that cures disease kills russet mold in a square area that is 10 feet on a side. Sunlight kills any russet mold in the light's area.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: false,
    sub_structures: [Structure.find_by(name: 'Water Walk').id, Structure.find_by(name: 'Corruption').id]
)

Structure.create(
    name: 'Submariner',
    description: %(The target is encased in a bubble, and then drops directly down to the bottom the body of water they are floating in to a maximum depth of 1 mile.
    If the target is not floating in or above water this structure has no effect.),
    target: ['Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Downforce').id, Structure.find_by(name: 'Deep Touch').id]
)

Structure.create(
    name: 'Unhanding',
    description: %(The target believes their left hand has become posessed, and makes an attack against himself with advantage, on a hit, he cuts his hand off as well as dealing normal damage to himself.
    Does not work on a creature wielding a two-handed weapon, or missing their left hand.),
    target: ['Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: true,   
    discovered: true,
    sub_structures: [Structure.find_by(name: 'Smiths Strength').id, Structure.find_by(name: 'Daymare').id]
)

puts "Four Rune Structures populated"


