# Seeds for base structures

# Two Rune Structures
puts 'Adding two rune structures'

# Mind Structures
puts 'Mind...'
s = Structure.new(
    name: 'Agoraphobia',
    description: %(The target becomes deathly afraid of the sky. While the target is outdoors with the sky above them they must use their action to dash, and must use their movement to move directly to the nearest building, cave, or shelter with at least 3 walls and a roof.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: false,
    tldr: 'Eek! The sky is falling!'
)
s.runes << Rune.find_by(name: 'Rune of the Sky')
s.runes << Rune.find_by(name: 'Rune of Imagination')
s.tags << Tag.find_by(name: 'Debuff')
s.save!
    
s = Structure.new(
    name: 'Airlift',
    description: %(The target gets lifted 20ft into the air, their movement speed becomes 0, they gain a hover speed of 5ft. While in the air the target has advantage on all attacks against medium or smaller creatures.
    When the rune fades, the target slowly lowers to an unoccupied space on the ground within 5ft.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: '20ft airlift'
)
s.runes << Rune.find_by(name: 'Rune of Air')
s.runes << Rune.find_by(name: 'Rune of Air')
s.save!

s = Structure.new(
    name: 'Aura of Sight',
    description: %(creature in the aura shimmers with bright light, giving attackers advantage on them.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'invisible revealing aura'
)
s.runes << Rune.find_by(name: 'Rune of the Mind')
s.runes << Rune.find_by(name: 'Rune of Air')
s.tags << Tag.find_by(name: 'Aura')
s.save!

s = Structure.new(
    name: 'Calming Presence',
    description: %(You project an aura of calmness, allies within 20ft of you become immune to the Frightened, Charmed, Paralized and Stunned conditions for the duration.),
    target: ['Self'],
    trace: '3 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Imm to Stun, Para, Charm, Firght - aura'
)
s.runes << Rune.find_by(name: 'Rune of Fear')
s.runes << Rune.find_by(name: 'Rune of Imagination')
s.tags << Tag.find_by(name: 'Aura')
s.save!

s = Structure.new(
    name: 'Daymare',
    description: %(The target must make a wisdom saving throw or become crippled with terrible visions, and become stunned. The target may remake the saving throw at the end of each of their turns.),
    target: ['Creature'],
    trace: '2 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    tldr: 'WIS save or stunned'
)
s.runes << Rune.find_by(name: 'Rune of the Mind')
s.runes << Rune.find_by(name: 'Rune of Fear')
s.save!

s = Structure.new(
    name: 'Downforce',
    description: %(A 15ft cube centered on the target space is affected by a strong downforce, creatures inside the area must make a Strength saving throw of fall prone. While inside the area creatures have a movement speed of 0 and for each action, bonus action and reaction, they must make a saving throw or lose that action.),
    target: ['Surface'],
    trace: '2 Rounds',
    draw: '5 Minutes',
    strained: false,
    discovered: true,
    tldr: '15ft cube of slow/prone'
)
s.runes << Rune.find_by(name: 'Rune of the Mind')
s.runes << Rune.find_by(name: 'Rune of the Sky')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Enhanced Vision',
    description: %(The target gains blindsight to a range of 20ft, darkvition to 120ft, and can add your Rune Scribe bonus to their perception and investigation checks that rely on sight.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: true,
    tldr: 'blindsight + darkvision + RS to per/inv'
)
s.runes << Rune.find_by(name: 'Rune of Sight')
s.runes << Rune.find_by(name: 'Rune of Sight')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Force Field',
    description: %(A shimering shell protects the target, making them seem distorted to anyone looking at them.
    All attacks against the target are made with disadvantage.),
    target: ['Creature'],
    trace: '2 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Att at DisAdv v target'
)
s.runes << Rune.find_by(name: 'Rune of Force')
s.runes << Rune.find_by(name: 'Rune of Force')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Imaginarium',
    description: %(The target is paralyzed for the duration, this paralysis cannot be broken.
    For the duration, the taget believes they are doing everything they would normally be doing, but it is all in their mind. On their turn they may attack a target without dealing damage, and that target can attack them back.
    If they are killed in their mind, their mind will die and their body will follow.
    If they are still alive at the end of the duration, they must make a INT saving throw or be affected by a form of Indefinite Madness),
    target: ['Creature'],
    trace: '10 Minutes',
    draw: '1 Week',
    strained: true,
    discovered: true,
    tldr: 'Para target and trap in mind'
)
s.runes << Rune.find_by(name: 'Rune of Imagination')
s.runes << Rune.find_by(name: 'Rune of Imagination')
s.save!

s = Structure.new(
    name: 'Mindblank',
    description: %(The target loses their train of thought, temporarily forgetting the last few minutes of conversation. On their next turn the target cannot take an Action.),
    target: ['Creature'],
    trace: '1 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Lose action or forget stuff'
)
s.runes << Rune.find_by(name: 'Rune of the Mind')
s.runes << Rune.find_by(name: 'Rune of Air')
s.tags << Tag.find_by(name: 'Utility')
s.tags << Tag.find_by(name: 'Debuff')
s.save!

s = Structure.new(
    name: 'Mindread',
    description: %(The caster can see simple images depicting what the target is thinking in response to questions the caster asks.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    tldr: 'see targets thoughts'
)
s.runes << Rune.find_by(name: 'Rune of the Mind')
s.runes << Rune.find_by(name: 'Rune of Sight')
s.tags << Tag.find_by(name: 'Utility')
s.save!

s = Structure.new(
    name: 'Nausea',
    description: %(The target becomes overwhelmed with a queasy feeling, they can only take one Action or Bonus action on their turn, and cannot take reactions, movement speed is halved.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: 'Short Rest',
    strained: false,
    discovered: true,
    tldr: 'Similar to slow'
)
s.runes << Rune.find_by(name: 'Rune of the Mind')
s.runes << Rune.find_by(name: 'Rune of the Mind')
s.tags << Tag.find_by(name: 'Debuff')
s.save!

s = Structure.new(
    name: 'Pretty Pictures',
    description: %(Your target perceives things differently, where you would normally be frightened you see the enemies face as that of a random woodland creature. Target is immune to being frightened.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '20 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Imm to fear'
)
s.runes << Rune.find_by(name: 'Rune of Sight')
s.runes << Rune.find_by(name: 'Rune of Fear')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Soar',
    description: %(The target gains a flying speed of 60ft.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    tldr: '60ft fly speed'
)
s.runes << Rune.find_by(name: 'Rune of the Sky')
s.runes << Rune.find_by(name: 'Rune of the Sky')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Swift Wind',
    description: %(A swift wind pushes at your back, and only your back, increasing your movement speed while moving forward by 50%.

    5tf becomes 7.5ft of movement
    Only one such effect can be used on a creature),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: '+50% move speed'
)
s.runes << Rune.find_by(name: 'Rune of Air')
s.runes << Rune.find_by(name: 'Rune of Force')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Terror',
    description: %(You cloak yourself in unsettling psychic energy. For the duration, any enemy within 60 feet of you that can see you must spend 1 extra foot of movement for every foot it moves toward you. A creature ignores this effect if immune to being frightened.),
    target: ['Creature'],
    trace: '2 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Fear aura'
)
s.runes << Rune.find_by(name: 'Rune of Fear')
s.runes << Rune.find_by(name: 'Rune of Fear')
s.tags << Tag.find_by(name: 'Aura')
s.save!

s = Structure.new(
    name: 'Updraft',
    description: %(A 15ft cube centered on the target space is affected by a sudden updraft, sending any creature in the area 60ft into the air per round. Creatures inside the updraft have a fly speed of 5ft.),
    target: ['Surface'],
    trace: '2 Rounds',
    draw: '5 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Forced fly up'
)
s.runes << Rune.find_by(name: 'Rune of the Sky')
s.runes << Rune.find_by(name: 'Rune of Air')
s.tags << Tag.find_by(name: 'AoE')
s.save!

# Power structures
puts 'Power...'

s = Structure.new(
    name: 'Armour of Power',
    description: %(Your armour becomes a force to be reckoned with, you have advantage on Athletics ability checks and strength saving throws, and can grapple creatures up to two sizes larger than you.),
    target: ['Medium Armour', 'Heavy Armour'],
    trace: '2 Rounds',
    draw: '20 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Adv on Ath + STR saves, grapple bigger'
)
s.runes << Rune.find_by(name: 'Rune of Strength')
s.runes << Rune.find_by(name: 'Rune of Strength')
s.tags << Tag.find_by(name: 'Augment')
s.save!

s = Structure.new(
    name: 'Backlash',
    description: %(For the duration, any time a creature within 10ft of the target deals damage to them, that creature takes 3d6 fire damage, and the target can use their reaction to focus the heat on the attackers hands, causing them to drop whatever they are holding.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: false,
    tldr: 'Too hot! Retaliation Aura'
)
s.runes << Rune.find_by(name: 'Rune of Flames')
s.runes << Rune.find_by(name: 'Rune of Fury')
s.tags << Tag.find_by(name: 'Aura')
s.save!

s = Structure.new(
    name: 'Emberbane',
    description: %( When drawn on metal armour the armour becomes warm to the touch giving the creature wearing the armour resistance to cold and fire damage.),
    target: ['Metal Armour'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'Resist cold/fire dmg'
)
s.runes << Rune.find_by(name: 'Rune of Embers')
s.runes << Rune.find_by(name: 'Rune of Embers')
s.tags << Tag.find_by(name: 'Augment')
s.save!

s = Structure.new(
    name: 'Fire Starter',
    description: %(Embers fire from the run in a 30ft cone. Each creature in the range must make a Dexterity saving throw. A creature takes 3d6 fire damage on a failed save, or half as much on a succesful one.
    If a creature is behind another creature in the cone\(in a direct line\) they take half as much damage.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'instant',
    strained: false,
    discovered: true,
    tldr: '30ft cone of fire'
)
s.runes << Rune.find_by(name: 'Rune of Embers')
s.runes << Rune.find_by(name: 'Rune of Flames')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Forge Blade',
    description: %(When drawn on a metal weapon, the weapon becomes as hard as an anvil. As a reaction the weilder of the blade can parry one melee weapon attack, gaining +5 AC against the attack. If the attack fails, the attacker must roll a strength saving throw or drop their weapon.),
    target: ['Metal Weapon'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'Reaction +5 AC'
)
s.runes << Rune.find_by(name: 'Rune of the Forge')
s.runes << Rune.find_by(name: 'Rune of the Forge')
s.tags << Tag.find_by(name: 'Augment')
s.save!

s = Structure.new(
    name: 'Halo',
    description: %( When drawn on metal armour the armour becomes cool inside, and hot to the touch. The target gains resistance to cold damage. Any creature starting their turn within 5ft takes 1d8 fire damage from the heat radiation out from the armour.),
    target: ['Metal Armour'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'Cold resist + 5ft heat radius'
)
s.runes << Rune.find_by(name: 'Rune of Flames')
s.runes << Rune.find_by(name: 'Rune of Flames')
s.tags << Tag.find_by(name: 'Augment')
s.save!

s = Structure.new(
    name: 'Holy Flame',
    description: %(A vertical column of divine fire roars down from the heavens in a location you specify within 60ft of the structure. Each creature in a 10-foot-radius, 40-foot-high cylinder centered on a point within range must make a Dexterity saving throw. A creature takes 4d6 fire damage and 4d6 radiant damage on a failed save, or half as much damage on a successful one.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: false,
    tldr: "By the Light!\n40ft column of fire+rad dmg"
)
s.runes << Rune.find_by(name: 'Rune of Flames')
s.runes << Rune.find_by(name: 'Rune of Destruction')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Light Beam',
    description: %(A beam of light 5ft wide and 60ft long fires out from the rune, blinding any creature in its path. The creatures remain blinded until the end of your next turn.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: '60ft beam of blinding light'
)
s.runes << Rune.find_by(name: 'Rune of Light')
s.runes << Rune.find_by(name: 'Rune of Light')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Light Trick',
    description: %(You create up to twelve match-sized lights within 120ft of the structure, making them appear as torches, lanterns, or glowing orbs that hover in the air for the duration. You can also combine the twelve lights into one glowing vaguely humanoid form of Small size. Whichever form you choose, each light sheds dim light in a 10-foot radius.

    As a bonus action on your turn, you can move the lights up to 60 feet to a new spot within 120ft of the structure. A light must be within 20 feet of another light created by this spell, and a light winks out if it exceeds the spell's range),
    target: ['Surface'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'Mini dancing lights'
)
s.runes << Rune.find_by(name: 'Rune of Light')
s.runes << Rune.find_by(name: 'Rune of Embers')
s.tags << Tag.find_by(name: 'Utility')
s.save!

s = Structure.new(
    name: 'Meteor Storm',
    description: %(When drawn, chose 3 points within 120ft of the rune and at least 20ft apart, meteors come falling from the sky and plummet into the ground at those points.
        
        Any creature in a 10ft radius sphere centered on those points take 4d8 bludgeoning damage and are knocked prone.
        
        Any creature in a 20ft radius sphere centered on those points must make a dexterity saving throw or take 4d8 fire damage, or half as much on a succesful save.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: true,
    discovered: false,
    tldr: "Burn baby Burn!\n3x meteors hit"
)
s.runes << Rune.find_by(name: 'Rune of Destruction')
s.runes << Rune.find_by(name: 'Rune of Destruction')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Repressed Anger',
    description: %(While this structure is active, enemy attacks against you have disadvantage due to the pure fury they can see in your eyes.
        
        If you take any damage while this structure is active, a shockwave of pure destruction radiates out from you, you take damage equal to half your current hitpoints rounded up, and deal that amount of damage to all creatures within 30ft as fire damage.),
    target: ['Self'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: false,
    tldr: "Crazy Eyes!\nAttacks have Dis, if damaged half suicide bomb"
)
s.runes << Rune.find_by(name: 'Rune of Fury')
s.runes << Rune.find_by(name: 'Rune of Destruction')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Revengance',
    description: %(For the duration any time a creature damages the target, they become a Nemesis of the target, and can feel the pure rage of the target.
        
        The target has advantage on all attacks against the targets Nemeses, and nemeses making saving throws against the caster have disadvantage on their saves.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '20 Minutes',
    strained: false,
    discovered: false,
    tldr: "I will remember that!\nAdv on att + enemy disadv on saves"
)
s.runes << Rune.find_by(name: 'Rune of Embers')
s.runes << Rune.find_by(name: 'Rune of Fury')
s.tags << Tag.find_by(name: 'Debuff')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Savagery',
    description: %(While this rune is active, the target is partly blinded by rage.
        
        The target gains a +5 bonus to melee attacks, and has advantage on melee attacks.
        
        On their turn, the target moves towards the last creature who damaged them and attacks them with a mele weapon or their fists. If they have not taken any damage in the last three rounds, the target MUST move towards the nearest creature and attack them with a mele weapon or their fists.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: false,
    tldr: "ROAR!\nAdv & +5 att, attacks last to hit or anyone"
)
s.runes << Rune.find_by(name: 'Rune of Fury')
s.runes << Rune.find_by(name: 'Rune of Fury')
s.tags << Tag.find_by(name: 'Debuff')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Shockwave',
    description: %(You send out a burst of light, all enemy creatures within 60ft that can see you feel the light hit them with a powerful force, dealing 1d8 psychic damage to each.),
    target: ['Self'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: '60ft wave of psy dmg'
)
s.runes << Rune.find_by(name: 'Rune of Light')
s.runes << Rune.find_by(name: 'Rune of Strength')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Smiths Strength',
    description: %(You can attempt to crush any creature grappled by you as a bonus action while this rune is in effect. The target must make a strength saving throw or fall unconscious. If the target is wearing non-magical metal armour that armour is destroyed and falls to the ground.),
    target: ['Self'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Grapple to unconscious'
)
s.runes << Rune.find_by(name: 'Rune of Strength')
s.runes << Rune.find_by(name: 'Rune of the Forge')
s.save!

# Death Structures
puts 'Death...'

s = Structure.new(
    name: 'Corruption',
    description: %(Your touch inflicts disease. 
        
        At the end of each of the target's turns, the target must make a Constitution saving throw. If the target succeeds on three of these saves, it is no longer inflicted, and the structure ends. If the target fails three of these saves, the target is no longer inflicted, but choose one of the diseases below. The target is subjected to the chosen disease for 7 Days.
        
        Since this spell induces a natural disease in its target, any effect that removes a disease or otherwise ameliorates a disease's effects apply to it.
        
        Blinding Sickness:
        Pain grips the creature's mind, and its eyes turn milky white. The creature has disadvantage on Wisdom checks and Wisdom saving throws and is blinded.

        Filth Fever:       
        A raging fever sweeps through the creature's body. The creature has disadvantage on Strength checks, Strength saving throws, and attack rolls that use Strength.
        
        Flesh Rot:
        The creature's flesh decays. The creature has disadvantage on Charisma checks and vulnerability to all damage.
        
        Mindfire:        
        The creature's mind becomes feverish. The creature has disadvantage on Intelligence checks and Intelligence saving throws, and the creature behaves as if under the effects of the confusion spell during combat.
        
        Seizure:        
        The creature is overcome with shaking. The creature has disadvantage on Dexterity checks, Dexterity saving throws, and attack rolls that use Dexterity.
        
        Slimy Doom:        
        The creature begins to bleed uncontrollably. The creature has disadvantage on Constitution checks and Constitution saving throws. In addition, whenever the creature takes damage, it is stunned until the end of its next turn.
        
        Rust:
        Rust is a disease that afects metal constructs and flesh-and-blood creatures alike.
        When a creature takes damage from an infected construct, the damaged creature must succeed on a DC 13 Constitution saving throw or become infected.
        Symptoms appear in 1d4 days, beginning with an itchy rash around the site of the injury. Twenty-four hours later, the rash-covered skin peels of, revealing rusted metal. All efects that restore hit points are halved for the infected creature, including long rests; it recovers only half of its missing hit points from a long rest, but it still regains expended hit dice at the usual rate.
        At that point, the infected creature must make a DC 10 Constitution saving throw. If it succeeds, the disease stops spreading but the healing penalty remains in efect. If the saving throw fails, the patch of rust spreads, the healing penalty remains, the creature loses 1 point of Dexterity, and it must repeat the saving throw ater another 24 hours. The disease can be cured by lesser restoration or comparable magic. Lost Dexterity can be restored by greater restoration, or it returns naturally at the rate of 1 point ater each long rest, once the disease is cured.
        A construct that is damaged by an infected construct or that is successfully targeted by a spell cast by an infected arcanist must succeed on a DC 15 saving throw or become infected. Signs of infection appear immediately, with rust spreading across the creature’s body. An infected construct has disadvantage on all saving throws, but it takes no other damage or penalty. It is simply a carrier until the disease is ended with greater restoration or comparable magic.),
    target: ['Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: false,
    tldr: "You dont look so good...\nSimilar to Contagion spell"
)
s.runes << Rune.find_by(name: 'Rune of Earth')
s.runes << Rune.find_by(name: 'Rune of Oblivion')
s.save!

s = Structure.new(
    name: 'Death March',
    description: %(When drawn the caster selects three 5ft squares of unoccupied ground within 30ft. The first space selected becomes active.

    While the target is active and a creature enters the space it takes 2d6 bludgeoning damage and the target fades.
    After the first target space fades, the second becomes the active space, and once that fades the third becomes active.),
    target: ['Surface'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'line of land mines'
)
s.runes << Rune.find_by(name: 'Rune of Death')
s.runes << Rune.find_by(name: 'Rune of Death')
s.save!

s = Structure.new(
    name: 'Death Trap',
    description: %(When drawn, the drawer decides on 8 5ft squares of ground within 120ft, any creatures that moves into that square takes 2d6 bludgeoning damage.
    Any Creature starting their turns on that square take 2d6 bludgeoning damage.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '5 Minutes',
    strained: false,
    discovered: true,
    tldr: '8x 5 round land mines'
)
s.runes << Rune.find_by(name: 'Rune of Earth')
s.runes << Rune.find_by(name: 'Rune of Death')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'DemiVitae',
    description: %(The targets max and current hitpoints\(if above the new max\) is reduced to one third of its max hitpoints.),
    target: ['Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: true,
    discovered: false,
    tldr: "What doesn't kill you makes you weaker!\n-1/3 of max hp"
)
s.runes << Rune.find_by(name: 'Rune of Oblivion')
s.runes << Rune.find_by(name: 'Rune of Oblivion')
s.save!

s = Structure.new(
    name: 'Disrobe',
    description: %(The target armour crumbles to dust.),
    target: ['Non-magical Metal Armour'],
    trace: 'Instant',
    draw: 'Instant',
    strained: true,
    discovered: false,
    tldr: "Hope you have something on under that.\nNon-magic metal armour breaker"
)
s.runes << Rune.find_by(name: 'Rune of Ore')
s.runes << Rune.find_by(name: 'Rune of Oblivion')
s.save!

s = Structure.new(
    name: 'Hidden Defences',
    description: %(The next time the target is hit with a melee weapon attack, the attack misses and the attacker must make a Strength saving throw or drop their weapon, and the rune fades.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'next melee att misses'
)
s.runes << Rune.find_by(name: 'Rune of Protection')
s.runes << Rune.find_by(name: 'Rune of Death')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Impaler',
    description: %(When drawn, chose 6 5ft squares within 60ft of the rune, jagged spikes of metal stab up from the ground, dealing 8d6 piercing damage to any creature on those spaces),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: true,
    discovered: true,
    tldr: '6x high dmg spikes'
)
s.runes << Rune.find_by(name: 'Rune of Ore')
s.runes << Rune.find_by(name: 'Rune of Mountains')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Iron Boot',
    description: %(The target can walk on any solid terrain without being impeeded by rough terrain, target cannot fall prone while moving on a solid surface.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '2 Hours',
    strained: false,
    discovered: true,
    tldr: 'Resist prone'
)
s.runes << Rune.find_by(name: 'Rune of Earth')
s.runes << Rune.find_by(name: 'Rune of Protection')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Moat',
    description: %(When created, the caster chooses up to 6 5tf squares each touching at least one other target. The targeted area collapses as deep caverns collapse, causing the targeted tiles to drop 10ft.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: '10ft deep moat'
)
s.runes << Rune.find_by(name: 'Rune of Death')
s.runes << Rune.find_by(name: 'Rune of Mountains')
s.tags << Tag.find_by(name: 'AoE')
s.tags << Tag.find_by(name: 'Utility')
s.save!

s = Structure.new(
    name: 'Natural Wall',
    description: %(When drawn the drawer choses a 10ft wide, 120ft long line anywhere withing 240ft, the ground in that area raises 50ft for the duration before collapsing back into the earth.
    Can only be used on natural terrain, buildings or manmade ground only raise up 5ft.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: '120ft wall, 50ft high'
)
s.runes << Rune.find_by(name: 'Rune of Mountains')
s.runes << Rune.find_by(name: 'Rune of Mountains')
s.tags << Tag.find_by(name: 'AoE')
s.tags << Tag.find_by(name: 'Utility')
s.save!

s = Structure.new(
    name: 'Petrification',
    description: %(You attempt to turn one creature into stone. If the target's body is made of flesh, the creature must make a Constitution saving throw. On a failed save, it is restrained as its flesh begins to harden. On a successful save, the creature isn't affected.

    A creature restrained by this spell must make another Constitution saving throw at the end of each of its turns. If it successfully saves against this structure, the structure ends. If it fails its saves three times, it is turned to stone and subjected to the petrified condition for 1 Minute. The successes and failures don't need to be consecutive.
    
    If the creature is physically broken while petrified, it suffers from similar deformities if it reverts to its original state.),
    target: ['Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: 'Weak flesh-to-stone spell'
)
s.runes << Rune.find_by(name: 'Rune of Death')
s.runes << Rune.find_by(name: 'Rune of Stone')
s.save!

s = Structure.new(
    name: 'Prospector',
    description: %(For the duration you can pinpoint any metal or mineral deposit buried underground within 500ft.),
    target: ['Self'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: '500ft metal detector'
)
s.runes << Rune.find_by(name: 'Rune of Ore')
s.runes << Rune.find_by(name: 'Rune of Earth')
s.tags << Tag.find_by(name: 'Aura')
s.tags << Tag.find_by(name: 'Utility')
s.save!

s = Structure.new(
    name: 'Protective Shell',
    description: %(
        The target gains +2 AC. If the target gets hit with an attack, the rune shatters, and until the end of their next turn they have -1 AC.
        Only one such rune is effective if more than one is in a 5ft space),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: '+2 AC, -1 AC if hit'
)
s.runes << Rune.find_by(name: 'Rune of Protection')
s.runes << Rune.find_by(name: 'Rune of Protection')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Stone Skin',
    description: %(The target becomes immune to slashing and piercing, and becomes resistant to all other damage excluding psychic. The targets movement speed becomes 10ft unless it is already lower, and has disadvantage on dexterity saving throws.),
    target: ['Creature'],
    trace: '2 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Imm to s/p, resist to all except psy'
)
s.runes << Rune.find_by(name: 'Rune of Stone')
s.runes << Rune.find_by(name: 'Rune of Stone')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Transmutation',
    description: %(You choose an area of stone, mud, or metal that you can see that fits within a 40-foot cube and is within 120ft of the structure, and choose one of the following effects.
    
    Transmute Rock to Mud:
    Nonmagical rock of any sort in the area becomes an equal volume of thick, flowing mud that remains for the structure's duration.
    The ground in the structure's area becomes muddy enough that creatures can sink into it. Each foot that a creature moves through the mud costs 4 feet of movement, and any creature on the ground when you draw the structure must make a Strength saving throw. A creature must also make the saving throw when it moves into the area for the first time on a turn or ends its turn there. On a failed save, a creature sinks into the mud and is restrained, though it can use an action to end the restrained condition on itself by pulling itself free of the mud.
    If you target a ceiling, the mud falls. Any creature under the mud when it falls must make a Dexterity saving throw. A creature takes 4d8 bludgeoning damage on a failed save, or half as much damage on a successful one.

    Transmute Mud to Rock:    
    Nonmagical mud or quicksand in the area no more than 10 feet deep transforms into soft stone for the structure's duration. Any creature in the mud when it transforms must make a Dexterity saving throw. On a successful save, a creature is shunted safely to the surface in an unoccupied space. On a failed save, a creature becomes restrained by the rock. A restrained creature, or another creature within reach, can use an action to try to break the rock by succeeding on a DC 20 Strength check or by dealing damage to it. The rock has AC 15 and 25 hit points, and it is immune to poison and psychic damage.
    
    Transmute Metal to Sludge
    Natural metal\(ore\) of any sort in the area becomes an equal volume of thick, sticky sludge that remains for the structure's duration.
    The ground in the structure's area becomes sludgy enough that creatures can sink into it. Each foot that a creature moves through the sludge costs 5 feet of movement, and any creature on the ground when you draw the structure must make a Strength saving throw. A creature must also make the saving throw when it moves into the area for the first time on a turn or ends its turn there. On a failed save, a creature sinks into the sludge and is restrained, though it can use an action to end the restrained condition on itself by pulling itself free of the mud.
    If you target a ceiling, the sludge falls. Any creature under the sludge when it falls must make a Dexterity saving throw. A creature takes 6d8 bludgeoning damage on a failed save, or half as much damage on a successful one.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Transmute Rock spell + metals'
)
s.runes << Rune.find_by(name: 'Rune of Ore')
s.runes << Rune.find_by(name: 'Rune of Ore')
s.tags << Tag.find_by(name: 'AoE')
s.tags << Tag.find_by(name: 'Utility')
s.save!

s = Structure.new(
    name: 'Tremor',
    description: %(The ground in a 60ft cone erupts violently, causing any creature in  the area to make a dexterity saving throw or take 1d6 bludgeoning damage
    The area becomes rough terrain.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: '60ft cone quake'
)
s.runes << Rune.find_by(name: 'Rune of Earth')
s.runes << Rune.find_by(name: 'Rune of Earth')
s.tags << Tag.find_by(name: 'AoE')
s.save!

# Life Structures
puts 'Life...'

s = Structure.new(
    name: 'Anchor',
    description: %(The target has a swimming speed of 30ft, and can hold their breath for up to 1 hour. Any creature holding hands\(or other appendages\) with the target gain the same effects while they are holding hands.

    Creatures can chain this effect by holding hands with an affected creature.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: false,
    tldr: "Its not a race.\n30ft swim speed + 1hr hold breath, infinitely chainable"
)
s.runes << Rune.find_by(name: 'Rune of Life')
s.runes << Rune.find_by(name: 'Rune of Leaves')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Bubble Boy',
    description: %(The target becomes encased in a bubble of water for the duration, and unless they can breathe water they have disadvantage on all saving throws, and attacks against them have advantage.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '20 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Drown creature'
)
s.runes << Rune.find_by(name: 'Rune of Waves')
s.runes << Rune.find_by(name: 'Rune of Depth')
s.save!

s = Structure.new(
    name: 'Camouflage',
    description: %(Leaves fall from the sky in a 30ft cube, sticking to any creature in the area. For the duration any creature affected has +20 to stealth.
    If they  take any action or move more than 5ft in a round the stealth is lost. At the start of their next turn they gain the stealth again.),
    target: ['Surface'],
    trace: '5 Minutes',
    draw: '8 Hours',
    strained: false,
    discovered: true,
    tldr: '30ft stealth cube'
)
s.runes << Rune.find_by(name: 'Rune of Leaves')
s.runes << Rune.find_by(name: 'Rune of Leaves')
s.tags << Tag.find_by(name: 'Buff')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Cold Blooded',
    description: %(The target is immune to frost damage, and instead gain health equal to any frost damage they would take.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: false,
    tldr: "Frosty!\nImm to cold, regen from cold"
)
s.runes << Rune.find_by(name: 'Rune of Frost')
s.runes << Rune.find_by(name: 'Rune of Rebirth')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Cold Snap',
    description: %(When drawn, the ground in a 30ft cone from the rune becomes frozen solid. The frozen ground is rough terrain, and any creature in the area when the rune is drawn becomes frozen to the spot, reducing their movement speed to 0.),
    target: ['Surface'],
    trace: '4 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: true,
    tldr: '30ft cone, 0 movement, diff terrain'
)
s.runes << Rune.find_by(name: 'Rune of Frost')
s.runes << Rune.find_by(name: 'Rune of Frost')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Cryogenics',
    description: %(You encase the target in an icy shell, the target becomes immune to all damage and becomes petrified for the duration.),
    target: ['Creature'],
    trace: '4 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Imm to all dmg, petrified'
)
s.runes << Rune.find_by(name: 'Rune of Frost')
s.runes << Rune.find_by(name: 'Rune of Life')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Deep Touch',
    description: %(While this rune is active, the creature gains a swimming speed equal to their walking speed, and can hold their breath for 1 hour, and are immune to water pressure.
    Any creature touching the target creature gains the same benefits.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'Imm pressure, swim speed, 1hr hold breath'
)
s.runes << Rune.find_by(name: 'Rune of Depth')
s.runes << Rune.find_by(name: 'Rune of Depth')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Downpour',
    description: %(Rain starts pouring down in a 60ft cube, the ground in the area becomes rough terrain, and any creature in the area without eye protection\(see below\) is blind beyond 5ft.

    If the target is a creature, the cube moves with the creature.
         
    Eye protection can include goggles or eyewear, or a large hood as found on many cloaks, or a wide brimmed hat.),
    target: ['Surface', 'Creature'],
    trace: '3 Rounds',
    draw: '1d4 Hours',
    strained: false,
    discovered: true,
    tldr: '60ft cube heavy rain'
)
s.runes << Rune.find_by(name: 'Rune of Water')
s.runes << Rune.find_by(name: 'Rune of Water')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Hail Storm',
    description: %(A 30ft cube from the rune gets pelted with hailstones the size of sending stones, each creature in the area gets hit by a number of hail stones as shown on the table below, each hail stone deals 1d6 bludgeoning damage.),
    additional: %(Number of Hail Stones 	Creature Size
    1d4 -2 	Tiny
    1d4 	Small
    1d6 	Medium
    1d12 	Large
    2d12 	Huge
    4d12 	Gargantuan),
    target: ['Surface'],
    trace: '4 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Cube of damaging hailstones'
)
s.runes << Rune.find_by(name: 'Rune of Frost')
s.runes << Rune.find_by(name: 'Rune of Water')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'High Tide',
    description: %(A wall of water springs into existence at a point you choose 100ft of the structure. You can make the wall up to 100 feet long, 100 feet high, and 30 feet thick. The wall lasts for the duration.

    When the wall appears, each creature within its area must make a Strength saving throw. On a failed save, a creature takes 6d10 bludgeoning damage, or half as much damage on a successful save.
    
    At the start of each of your turns after the wall appears, the wall, along with any creatures in it, moves 30 feet away from you. Any Huge or smaller creature inside the wall or whose space the wall enters when it moves must succeed on a Strength saving throw or take 5d10 bludgeoning damage. A creature can take this damage only once per round. At the end of the turn, the wall's height is reduced by 50 feet, and the damage creatures take from the spell on subsequent rounds is reduced by 2d10. When the wall reaches 0 feet in height, the structure fades.
    
    A creature caught in the wall can move by swimming. Because of the force of the wave, though, the creature must make a successful Strength \(Athletics\) check against your rune save DC in order to move at all. If it fails the check, it can't move. A creature that moves out of the area falls to the ground.),
    target: ['Surface'],
    trace: '2 Rounds',
    draw: '2 Rounds',
    strained: false,
    discovered: true,
    tldr: 'Small Tsunami spell'
)
s.runes << Rune.find_by(name: 'Rune of Waves')
s.runes << Rune.find_by(name: 'Rune of Waves')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Lifeblood',
    description: %(Each time the target deals damage to a creature within 5ft of them, they gain health equal to half the damage dealt.
         
        This structure has no effect if the target damages a creature that does not bleed.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Vamparic attacks'
)
s.runes << Rune.find_by(name: 'Rune of Life')
s.runes << Rune.find_by(name: 'Rune of Waves')
s.tags << Tag.find_by(name: 'Buff')
s.tags << Tag.find_by(name: 'Healing')
s.save!

s = Structure.new(
    name: 'Miniaturization',
    description: %(You and up to 6 willing creatures within 10ft of you shrink for the duration to your choice of size between 1 inch and 1 foot.),
    target: ['Self'],
    trace: '10 Minutes',
    draw: '12 Hours',
    strained: false,
    discovered: false,
    tldr: "Ooh lets explore the mousehole!\nYou + 6 shrink to 1in - 1ft"
)
s.runes << Rune.find_by(name: 'Rune of Leaves')
s.runes << Rune.find_by(name: 'Rune of Rebirth')
s.save!

s = Structure.new(
    name: 'Restoration',
    description: %(The target gains the effects of a long rest.),
    target: ['Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: true,
    discovered: false,
    tldr: "Tired?.\nInstant long rest"
)
s.runes << Rune.find_by(name: 'Rune of Rebirth')
s.runes << Rune.find_by(name: 'Rune of Rebirth')
s.tags << Tag.find_by(name: 'Utility')
s.tags << Tag.find_by(name: 'Healing')
s.save!

s = Structure.new(
    name: 'Ring of Life',
    description: %(While active, the target and all creatures within 5ft of the target gain 1HP per level of Rune Scribe at the start of their turn.
    Only one such structure is effective on a creature at a time.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    tldr: '5ft heal aura'
)
s.runes << Rune.find_by(name: 'Rune of Life')
s.runes << Rune.find_by(name: 'Rune of Life')
s.tags << Tag.find_by(name: 'Aura')
s.tags << Tag.find_by(name: 'Healing')
s.save!

s = Structure.new(
    name: 'Water of Life',
    description: %(In a cube of 20ft around the rune a gentle rain starts to fall, each creature who starts their turn in the rain gains 1d4 HP),
    target: ['Surface'],
    trace: '5 Roudns',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    tldr: '20ft heal aura'
)
s.runes << Rune.find_by(name: 'Rune of Life')
s.runes << Rune.find_by(name: 'Rune of Water')
s.tags << Tag.find_by(name: 'AoE')
s.tags << Tag.find_by(name: 'Healing')
s.save!

s = Structure.new(
    name: 'Water Walk',
    description: %(This structure grants the ability to move across any liquid surface—such as water, acid, mud, snow, quicksand, or lava—as if it were harmless solid ground \(creatures crossing molten lava can still take damage from the heat\).

    If you target a creature submerged in a liquid, the spell carries the target to the surface of the liquid at a rate of 60 feet per round.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'Water walk spell'
)
s.runes << Rune.find_by(name: 'Rune of Life')
s.runes << Rune.find_by(name: 'Rune of Leaves')
s.tags << Tag.find_by(name: 'Buff')
s.save!

# Neutral Structures
puts 'Neutral...'

s = Structure.new(
    name: 'Aerating',
    description: %(You can lighten a metal weapon by adding air to the metal, creating small holes without damaging the structure.
    Any two handed weapon Aerated loses the 2-handed tag and becomes versitile.),
    target: ['Metal Weapon'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: false,
    tldr: "You need two hands fro that?\nMake 2 hand weapon versitile"
)
s.runes << Rune.find_by(name: 'Rune of Ore')
s.runes << Rune.find_by(name: 'Rune of Air')
s.tags << Tag.find_by(name: 'Augment')
s.save!

s = Structure.new(
    name: 'Autumn',
    description: %(Leaves fill the sky, falling in a 30ft cube , any creature in the area that relies on sight or smell to see are effectively blind.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '5 Rounds',
    strained: false,
    discovered: false,
    tldr: "Summer is over.\n30ft cube of blind"
)
s.runes << Rune.find_by(name: 'Rune of the Sky')
s.runes << Rune.find_by(name: 'Rune of Leaves')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Clarification',
    description: %(For the duration the target can see clearly in water no matter how murky or dark to a range of 120ft.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: false,
    tldr: "Did I want to see that?\nCan see in murky water."
)
s.runes << Rune.find_by(name: 'Rune of Waves')
s.runes << Rune.find_by(name: 'Rune of Sight')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Compression',
    description: %(Target suddenly feels the weight of the world crushing them, and loses half of their current health. Their lungs also get crushed, reducing the time they can hold their breath to 1 tenth of their original\(minimum of 6 seconds\).),
    target: ['Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: 'Reduce max health + breath'
)
s.runes << Rune.find_by(name: 'Rune of Force')
s.runes << Rune.find_by(name: 'Rune of Depth')
s.save!

s = Structure.new(
    name: 'Disturbia',
    description: %(A wave of fear radiates out from you, all creatures more than 20ft from you, and within 1 mile feel compelled to move away from you and will keep moving until they leave the ares.),
    target: ['Self'],
    trace: '10 Minutes',
    draw: '8 Hours',
    strained: true,
    discovered: false,
    tldr: "WTF is that?!?\n 1 Mile creature clearing"
)
s.runes << Rune.find_by(name: 'Rune of Fear')
s.runes << Rune.find_by(name: 'Rune of Oblivion')
s.tags << Tag.find_by(name: 'Aura')
s.save!

s = Structure.new(
    name: 'Effusive Eruption',
    description: %(Each round the highest point\(or points\) of ground within 120ft loses 5ft of height and turns to lava.
        Any creature on the area turning to lave must make a DEX saving throw to jump to the nearest clear space within 20ft, or take 18d10 fire damage on a failed save.
        Any creature starting their turn or moving into the lava takes 18d10 fire damage.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '10 Minutes',
    strained: true,
    discovered: false,
    tldr: "It's Melting!\nLava flows - extreme dmg"
)
s.runes << Rune.find_by(name: 'Rune of Mountains')
s.runes << Rune.find_by(name: 'Rune of Fury')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Fan the Flames',
    description: %(As you complete this structure, a thin sheet of flames shoots forth from it. Each creature in a 15-foot cone must make a Dexterity saving throw. A creature takes 3d6 fire damage on a failed save, or half as much damage on a successful one.
         
        The fire ignites any flammable objects in the area that aren't being worn or carried.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: 'Burning Hands spell'
)
s.runes << Rune.find_by(name: 'Rune of Air')
s.runes << Rune.find_by(name: 'Rune of Flames')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Firestorm',
    description: %(The air in a 30ft cube catches fire, all creatures in the area take 3d6 fire damage and must make a Constitution saving throw or take an additional 1d8 force damage from smoke inhalation.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: '30ft cube of fire'
)
s.runes << Rune.find_by(name: 'Rune of Embers')
s.runes << Rune.find_by(name: 'Rune of Leaves')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Fluid Thoughts',
    description: %(Your next rune or structure that targets a single creature and has a duration of more than 1 round is considered a Fluid Rune),
    additional: %(Fluid Runes can be transferred to another target of the same type as a bonus action on your turn, or as a reaction when the rune is about to be destroyed  - it still affects the target but is moved instead of being destroyed. Cannot be used on the turn the rune is cast.
     Fluid Runes have a range of 120ft),
    target: ['Self'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'Next structure is fluid'
)
s.runes << Rune.find_by(name: 'Rune of the Mind')
s.runes << Rune.find_by(name: 'Rune of Water')
s.tags << Tag.find_by(name: 'Utility')
s.save!

s = Structure.new(
    name: 'Frost Blade',
    description: %(The weapon becomes cold to the touch and emits frosty air, when the weapon hits a target, the damage becomes cold damage, and a target hit with the blade has its speed reduced to half\(does not stack\).),
    target: ['Metal Weapon'],
    trace: '3 Rounds',
    draw: '20 Minutes',
    strained: false,
    discovered: true,
    tldr: 'Change dmg to cold + slow movement'
)
s.runes << Rune.find_by(name: 'Rune of Frost')
s.runes << Rune.find_by(name: 'Rune of the Forge')
s.tags << Tag.find_by(name: 'Augment')
s.save!

s = Structure.new(
    name: 'Frostburn',
    description: %(The target weapon becomes wreathed in blue flame, and when it deals damage, that damage is fire damage, the weapon does additional damage equal to the fire damage in ice damage.),
    target: ['Metal Weapon'],
    trace: '1 Minute',
    draw: '30 Minutes',
    strained: false,
    discovered: true,
    tldr: 'fire + cold dmg from weapon'
)
s.runes << Rune.find_by(name: 'Rune of Frost')
s.runes << Rune.find_by(name: 'Rune of Flames')
s.tags << Tag.find_by(name: 'Augment')
s.save!

s = Structure.new(
    name: 'Ghost',
    description: %(A 12.5ft aura surrounds the target, hostile creatures cannot willingly move into the aura, and any creature hostile to the target inside the aura has disadvantage on ability checks and saving throws while in the aura, and while in the aura cannot take actions, bonus actions, or reactions.),
    target: ['Creature'],
    trace: '2 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: true,
    tldr: 'aura of fear + slow'
)
s.runes << Rune.find_by(name: 'Rune of Fear')
s.runes << Rune.find_by(name: 'Rune of Death')
s.tags << Tag.find_by(name: 'Aura')
s.save!

s = Structure.new(
    name: 'Hellscape',
    description: %(The target believes they are in hell, and takes 3d8 psychic damage at the start of each of their turns.
    The target takes no damage if they are immune to fire damage.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: false,
    tldr: "Go to Hell!\nPsy dmg each turn"
)
s.runes << Rune.find_by(name: 'Rune of Embers')
s.runes << Rune.find_by(name: 'Rune of Imagination')
s.save!

s = Structure.new(
    name: 'Jeopardize',
    description: %(The target has an AC of 10, and any beneficial magical effects are nullified for the duration\(including auras\).),
    target: ['Creature'],
    trace: '1 Roud',
    draw: '1 Minute',
    strained: false,
    discovered: false,
    tldr: "Like Aqua but better!\nAC = 10, remove magic effects"
)
s.runes << Rune.find_by(name: 'Rune of Destruction')
s.runes << Rune.find_by(name: 'Rune of Protection')
s.tags << Tag.find_by(name: 'Debuff')
s.save!

s = Structure.new(
    name: 'Leafy Amalgimate',
    description: %(You summon a Dancing Foliage in which forms above the rune.
        You can use your bonus action to control it on your turn.
        If you do not use your bonus action to control it, it will act on its own at the end of your turn, and will try to attack you if you are nearby as it feels your control over it.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: false,
    tldr: "Leaf me alone!\nSummon Dancinf Foliage"
)
s.runes << Rune.find_by(name: 'Rune of Fury')
s.runes << Rune.find_by(name: 'Rune of Leaves')
s.save!

s = Structure.new(
    name: 'Light Shell',
    description: %(Light ripples out from the rune in thin spiderweb like patterns, expanding to cover the targets body before sinking under the skin.
 
    The target gains +1 to AC, any creature that hits the target with a melee attack becomes blinded until the end of their next turn as light flares up from the wound.
    Only one such effect can be active on a creature at a time.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '5 Minutes',
    strained: false,
    discovered: true,
    tldr: '+1 AC - blind attackers'
)
s.runes << Rune.find_by(name: 'Rune of Protection')
s.runes << Rune.find_by(name: 'Rune of Light')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Light Wave',
    description: %(Any creature within 60ft that can see the target get pushed 5ft away as waves of light pulse out from the target making them stagger backwards.),
    target: ['Surface', 'Object', 'Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: '60ft push back 5ft'
)
s.runes << Rune.find_by(name: 'Rune of Force')
s.runes << Rune.find_by(name: 'Rune of Light')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Lillyputian',
    description: %(For the duration the target shrinks to one size smaller, and has 5 strength.
    Only one such structure can be active on a creature at a time.),
    target: ['Creature'],
    trace: '1 Round',
    draw: '1 Minute',
    strained: false,
    discovered: false,
    tldr: "You're not so big\nShrink creature, STR = 5"
)
s.runes << Rune.find_by(name: 'Rune of Strength')
s.runes << Rune.find_by(name: 'Rune of Oblivion')
s.save!

s = Structure.new(
    name: 'Mind Break',
    description: %(The target gains a form of Short-Term Madness with a duration of 1d6 rounds),
    target: ['Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: false,
    tldr: "Can Not Compute\nGive madness to target"
)
s.runes << Rune.find_by(name: 'Rune of the Mind')
s.runes << Rune.find_by(name: 'Rune of Destruction')
s.save!

s = Structure.new(
    name: 'Mind Shell',
    description: %(A warmness enters the targets mind, preventing dark thoughts from entering.
    The target gains resistance to Psychic damage and cannot be charmed.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'Resist psy, Imm charm'
)
s.runes << Rune.find_by(name: 'Rune of Force')
s.runes << Rune.find_by(name: 'Rune of Protection')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Mindbend',
    description: %(If the target fails an INT saving throw, you can command the target to complete a single task, similar to the Suggestion Spell.),
    target: ['Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: 'INT save or Suggestion spell'
)
s.runes << Rune.find_by(name: 'Rune of the Mind')
s.runes << Rune.find_by(name: 'Rune of Strength')
s.save!

s = Structure.new(
    name: 'Napalm',
    description: %(Sets the target on fire for 1d4 + 2 rounds, the fire cannot be put out except with dispel magic, any creature who attempts to put the fire out also catches fire and adds 1d4 rounds before the fire goes out.
        Attempting to use water to put out the fire causes the flame to briefly flare up causing any creature within 5ft of the target to catch fire and 1d6 more rounds are added. 
        At the end of your turn, each creature on fire takes 1d6 + your Rune Bonus modifier fire damage.),
    target: ['Creature'],
    trace: '1d4 + 2 Rounds',
    draw: '12 Rounds',
    strained: false,
    discovered: true,
    tldr: 'Water fueled fire'
)
s.runes << Rune.find_by(name: 'Rune of Flames')
s.runes << Rune.find_by(name: 'Rune of Water')
s.save!

s = Structure.new(
    name: 'Phoenix',
    description: %(If your health drops to 0 while this structure is active, you can use your reaction to implode your old body and create a new one for yourself within 30 feet.
    Warning: this structure is deemed unstable.),
    target: ['Self'],
    trace: '10 Minutes',
    draw: '3 Hours',
    strained: false,
    discovered: false,
    tldr: "From the ashes\nReaction to refill health at 0hp"
)
s.runes << Rune.find_by(name: 'Rune of Rebirth')
s.runes << Rune.find_by(name: 'Rune of Embers')
s.tags << Tag.find_by(name: 'Healing')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Reckoning',
    description: %(The target believes they are dying, and falls prone.

    On each of their turns they must make a death saving throw.
    
    On three successful saves they return to normal and break out of the Illusion.
    On three failed saves, they fall to 0hp and start their actual death saving throws.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '5 Rounds',
    strained: true,
    discovered: false,
    tldr: "The death curse!\nTarget makes death saves"
)
s.runes << Rune.find_by(name: 'Rune of Death')
s.runes << Rune.find_by(name: 'Rune of Imagination')
s.save!

s = Structure.new(
    name: 'Seismic Sight',
    description: %(The target gains Tremorsense to a range of 30ft.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '30 Minutes',
    strained: false,
    discovered: true,
    tldr: '30ft Tremorsense'
)
s.runes << Rune.find_by(name: 'Rune of Sight')
s.runes << Rune.find_by(name: 'Rune of Earth')
s.tags << Tag.find_by(name: 'Buff')
s.save!

s = Structure.new(
    name: 'Sinkhole',
    description: %(A swirling mass of 5-foot-deep water appears in a 30-foot radius circle from the structure. The point must be on the ground or in a body of water. Until the spell ends, that area is difficult terrain, and any creature that starts its turn there must succeed on a Strength saving throw or take 6d6 bludgeoning damage and be pulled 10 feet toward the center.),
    target: ['Surface'],
    trace: '5 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: false,
    tldr: "Suck it up!\n30ft whirlpool"
)
s.runes << Rune.find_by(name: 'Rune of Waves')
s.runes << Rune.find_by(name: 'Rune of Strength')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Smoulder',
    description: %(You cause the ground to start smouldering causing smoke to billow out causing darkness in a 5ft radius sphere, each round the radius of the smoke increases by 5ft.
        
        Strong winds will cause the smoke to be in a cone instead of a sphere.
        Does not work on stone, marble, or any other surface that cannot be burnt.),
    target: ['Surface'],
    trace: '1 Minute',
    draw: '30 Minutes',
    strained: false,
    discovered: true,
    tldr: 'smoke cloud = darkness'
)
s.runes << Rune.find_by(name: 'Rune of Embers')
s.runes << Rune.find_by(name: 'Rune of Earth')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Solar Flare',
    description: %(The sky 30ft above you flares brightly for the duration, any creature on lower terrain has disadvantage attacking creatures above them, and any creature attacking creatures on lower ground have advantage on their attacks. Creatures attacking creatures at least one size smaller also have advantage on those attacks if they are on even ground.),
    target: ['Self'],
    trace: '2 Rounds',
    draw: '5 Minutes',
    strained: false,
    discovered: false,
    tldr: "Look at me!\nBlind everyone on lower ground."
)
s.runes << Rune.find_by(name: 'Rune of the Sky')
s.runes << Rune.find_by(name: 'Rune of Light')
s.save!

s = Structure.new(
    name: 'Soothing',
    description: %(The rune burns into the skin of the target snapping them back to their senses.

    The target takes 1d4 damage and you may emove one of the following conditions from the target:
    Blind, Deaf, Charmed, Frightened, Stunned
    Excessive use of this structure may be hazardous to the health of the target.),
    target: ['Creature'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: 'remove status effect'
)
s.runes << Rune.find_by(name: 'Rune of Life')
s.runes << Rune.find_by(name: 'Rune of Force')
s.tags << Tag.find_by(name: 'Healing')
s.save!

s = Structure.new(
    name: 'Starburst',
    description: %(When the target is reduced to 0HP the rune shatters into a brilliant burst of light, blinding all creatures in a 10ft raduis until the end of their next turn.  The target regains 2d4 plus the casters Rune Bonus modifier HP instead of falling unconcious.

    Excessive use of this rune can be hazardous to the health of the target.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'on 0hp blind nearby and revive'
)
s.runes << Rune.find_by(name: 'Rune of Life')
s.runes << Rune.find_by(name: 'Rune of Light')
s.tags << Tag.find_by(name: 'Buff')
s.tags << Tag.find_by(name: 'Healing')
s.save!

s = Structure.new(
    name: 'Stone Strike',
    description: %(The weapon becomes enchanted and when it is used to attack the ground, a 5ft tall, 1ft wide stone pillar erupts at a point in range and deals the weapons damage as bludgeoning damage to the target on a hit.),
    target: ['Weapon'],
    trace: '5 Rounds',
    draw: '1 Hour',
    strained: false,
    discovered: true,
    tldr: 'long-range melee attacks'
)
s.runes << Rune.find_by(name: 'Rune of Stone')
s.runes << Rune.find_by(name: 'Rune of the Forge')
s.tags << Tag.find_by(name: 'Augment')
s.save!

s = Structure.new(
    name: 'Stony Gaze',
    description: %(A 15 ft beam comes from the targets eyes, any creature in the gaze becomes Paralyzed for 2 rounds.),
    target: ['Self'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: '15ft para beam'
)
s.runes << Rune.find_by(name: 'Rune of Stone')
s.runes << Rune.find_by(name: 'Rune of Sight')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Suffocation Aura',
    description: %(An aura of arilessness appears around the target with a radius of 10ft, any enemy creatures in the aura are suffocating, additionally any creature in the area that takes more than 10 damage loses 1 minute of air.),
    target: ['Creature'],
    trace: '5 Rounds',
    draw: '5 Minutes',
    strained: false,
    discovered: true,
    tldr: '10ft aurless aura'
)
s.runes << Rune.find_by(name: 'Rune of Air')
s.runes << Rune.find_by(name: 'Rune of Death')
s.tags << Tag.find_by(name: 'Aura')
s.save!

s = Structure.new(
    name: 'Tempering',
    description: %(You can strengthen a non-magical, unmodified weapon by adding 1ft square of metal to it using the following table for the type of metal.),
    additional: %(Metal Type 	Weapon Changes
    Iron/Steel/Silver 	+1
    Gold/Platinum 	+2
    Mithral 	+3
    Adamantine 	+4),
    target: ['Metal Weapon'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: 'add bonus to weapons'
)
s.runes << Rune.find_by(name: 'Rune of Ore')
s.runes << Rune.find_by(name: 'Rune of the Forge')
s.tags << Tag.find_by(name: 'Utility')
s.tags << Tag.find_by(name: 'Augment')
s.save!

s = Structure.new(
    name: 'Titanize',
    description: %(For the duration the target gains one size, and has 25 strength.
    Only one such structure can be active on a creature at a time.),
    target: ['Creature'],
    trace: '3 Rounds',
    draw: '10 Minutes',
    strained: false,
    discovered: false,
    tldr: "You will look up to me!\nSTR = 25, size +1"
)
s.runes << Rune.find_by(name: 'Rune of Strength')
s.runes << Rune.find_by(name: 'Rune of Rebirth')
s.save!

s = Structure.new(
    name: 'Virtigo',
    description: %(The target becomes deathly afraid of heights, it must use its movement to get to the lowest point it can see, and cannot jump, fly, or otherwise move to higher ground willingly. The target becomes incapacitated until it reaches the lowest level of ground it can see.),
    target: ['Creature'],
    trace: '1 Minute',
    draw: '30 Minutes',
    strained: false,
    discovered: true,
    tldr: 'fear of heights'
)
s.runes << Rune.find_by(name: 'Rune of Fear')
s.runes << Rune.find_by(name: 'Rune of Depth')
s.save!

s = Structure.new(
    name: 'Volcanic Cloud',
    description: %(A 60ft cube centered 35ft above you becomes full with ash and embers. Any creature in the area at the start of their turn takes 3d8 fire damage and cannot breath. If a creature takes 10 or more damage from this their flying speed is reduced to 0 until they regain at least 1hp, any airborn creature losing flying speed drops to the ground.),
    target: ['Self'],
    trace: '5 Rounds',
    draw: '20 Minutes',
    strained: false,
    discovered: false,
    tldr: "Get down here!\nFlying killer"
)
s.runes << Rune.find_by(name: 'Rune of the Sky')
s.runes << Rune.find_by(name: 'Rune of Embers')
s.tags << Tag.find_by(name: 'AoE')
s.save!

s = Structure.new(
    name: 'Wall of Light',
    description: %(A wall of light erupts from the ground behind the caster with its center 40ft from the caster, the wall is 60ft long, any creature facing the wall is blind.),
    target: ['Self'],
    trace: '1 Round',
    draw: '1d4 Minutes',
    strained: false,
    discovered: true,
    tldr: 'blinding wall behind caster'
)
s.runes << Rune.find_by(name: 'Rune of Light')
s.runes << Rune.find_by(name: 'Rune of Mountains')
s.tags << Tag.find_by(name: 'AoE')
s.save!

puts "Two Rune Structures populated"
