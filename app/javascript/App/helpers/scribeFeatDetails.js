import React from "react"

export default {
    1: {
        'name': 'Rune Tracing',
        'house': 'all',
        'description': (<p>You have the ability to create rune structures you know up to the complexity level in the above table by tracing them on a surface. Each rune takes half a minute to trace or two minutes to draw.<br />Drawing requires ink, one bottle of ink can draw 10 runes. You can also use other methods or items to draw runes, for example drawing in the dirt, drawing with blood.</p>)
    },
    2: {
        'name': 'Sealing',
        'house': 'all',
        'description': (<><p>You have the ability to repair(seal) broken rune structures by tracing over the breaks, allowing you to repair even the most complex rune structures.<br />Repairing structures takes more time as you need to understand the structure before you attempt repairs, see the below table for times to repair the structures:
        </p>
        <table className='smallTable'>
            <thead><tr>
                <th>Runes</th><th>Time</th><th>House Dominant</th>
            </tr></thead>
            <tbody>
                <tr><td>2</td><td>3 Minutes</td><td>2 Minutes</td></tr>
                <tr><td>4</td><td>15 Minutes</td><td>10 Minutes</td></tr>
                <tr><td>8</td><td>2 Hours</td><td>90 Minutes</td></tr>
                <tr><td>16</td><td>7 Hours</td><td>4 Hours</td></tr>
                <tr><td>32</td><td>4 Days</td><td>2.5 Days</td></tr>
                <tr><td>64</td><td>2 Weeks</td><td>10 Days</td></tr>
                <tr><td>128</td><td>3 Months</td><td>2 Months</td></tr>
            </tbody>
            </table>
            <p>If the structure is dominant to your house it takes less time for you to repair the structure as shown in the <strong>House Dominant</strong> column.</p>
            </>)
    },
    3: {
        'name': 'Advanced Tracing',
        'house': 'all',
        'description': (<p>From level 2 you are proficient in tracing runes, and can now trace a rune structure as an action, see the Rune Tracing table for how many runes the structure can contain as an action. You also can draw runes faster, each minute you can draw a number of runes equal to the Rune Tracing table.<br />
            You can now also tattoo runes if you are proficient with a tattoo kit, and have the equipment. Tattooing a structure takes 10 minutes per non-house rune, and 5 minutes per house rune. Tattooed runes last 10x the time a drawn rune would, up to a maximum of 12 hours.</p>)
    },
    4: {
        'name': 'Rune House',
        'house': 'all',
        'description': (<p>Starting at level 2 you align yourself with one of the four houses, and within that house chose to follow the Lord or Lady of that house.</p>)
    },
    5: {
        'name': 'Gentle Breeze',
        'house': 'Mind',
        'description': (<p>Beginning at level 2 you gain the ability to create rune structures in the air, which you can then motion towards a surface within 30 feet to activate.<br />
            Additionally you can add your Rune Bonus modifier to damage rolls made for structures dominant in Mind runes.</p>)
    },
    6: {
        'name': 'Flaming Brand',
        'house': 'Power',
        'description': (<p>Beginning at level 2 you can engrave runes into items, the engraving lasts 24 hours and takes 30 minutes per rune to engrave, Power runes take 15 minutes to engrave in this fashion.<br />
            Additionally you can add you Rune Bonus modifier to the damage rolls made for structures dominant in Power runes.</p>)
    },
    7: {
        'name': 'Dust to Dust',
        'house': 'Death',
        'description': (<p>Beginning at level 2 when you create rune structures that have an area affect, the area is increased by 50%.<br />
            Also applies to non-rune scribe auras and spells.<br />            
            Additionally you can add you Rune Bonus modifier to the damage rolls made for structures dominant in Death runes.</p>)
    },
    8: {
        'name': 'Fluid Motion',
        'house': 'Life',
        'description': (<p>Beginning at level 2 as a bonus action you can step into any liquid surface at least 5 feet wide and teleport to another liquid surface at least 5 feet wide within 60 ft, you can use this ability a number of times equal to your proficiency bonus. You regain all uses when you finish a long rest.<br />
            Additionally you can add you Rune Bonus modifier to the damage rolls and healing made for structures dominant in Life runes.</p>)
    },
    9: {
        'name': 'Runestones',
        'house': 'all',
        'description': (<p>Starting from level 3 you can draw runes on stones to be used by anyone.<br />
Carving a rune on a flat faced stone that has been cut into a hexagonal shape stores its power, and can be activated by any creature as an action, by pushing the stone against its target, which uses up the runestone. Any save DC or attack roll for this is based on your stats.<br />
Carving a runestone and its rune takes 20 minutes, and its power fades when you complete a long rest rendering it useless. If you a set of masons tools the time to carve is reduced to 10 minutes.<br />
You can have a number of stones drawn equal to your Proficiency Bonus at any time.</p>)
    },
    10: {
        'name': 'Ability Score Improvement',
        'house': 'all',
        'description': (<p>You can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can't increase an ability score above 20 using this feature.<br />
        If your DM allows the use of feats, you may instead take a feat.</p>)
    },
    11: {
        'name': 'Fast Tracing',
        'house': 'all',
        'description': (<p>From level 5 you can trace single runes <strong>from your house</strong> as a bonus action.</p>)
    },
    12: {
        'name': 'Mind Read',
        'house': 'Mind',
        'description': (<p>At level 6 you gain the ability to see intentions as images from hostile creatures minds. As a Bonus Action, choose a creature, that creature must make a INT saving throw against your Rune Save DC, on a fail you gain the following benefits until the start of your next turn, depending on who you follow.<br />
            <br />
            <strong>Followers of the Lord</strong> gain advantage on WIS and INT saving throws against this creature, and they have disadvantage on all saving throws against you.
            <br /><br />
            <strong>Followers of the lady</strong> gain advantage on melee attacks against this creature, and they have disadvantage on attacks against you.</p>)
    },
    13: {
        'name': 'Engravers Preservation',
        'house': 'Power',
        'description': (<p>Beginning at level 6 you can touch up the previous engravings made by Flaming Brand on an item in the evening before you take a long rest, doing so takes 10 minutes per item. At the start of a new day you can reinforce old engravings that were touched up the previous evening taking only 10 minutes per rune, or 5 minutes per Power rune. You can also add additional runes with Flaming Brand to create larger structures containing the existing runes.<br />
            You also gain one of the following based on who you follow:<br />
            <br />
            <strong>Followers of the Lord</strong> can wreath themselves in flames gaining a defensive bonus. As a reaction can gain 3 AC, this ability can be used as many times as your proficiency bonus per long rest.
            <br /><br />
            <strong>Followers of the lady</strong> are masters of weaponry. As a free action once per round you can either sheath two weapons and draw up to two weapons or shields, or throw a weapon to an ally within 30ft, that ally must use their reaction to catch the weapon, otherwise it falls at their feet.</p>)
    },
    14: {
        'name': "Death's Apprentice",
        'house': 'Death',
        'description': (<p>Beginning at level 6 you have mastered the power of death, you gain proficiency in death saving throws, you also gain one of the following depending on who you follow:<br />
            <br />
            <strong>Followers of the Lord</strong> always know where an attack is coming from, and cannot be surprised, because you can feel attacks coming you also gain +1 to your AC.
            <br /><br />
            <strong>Followers of the lady</strong> are masters of dealing death, on your first attack each turn you may add your proficiency bonus to the damage roll as force damage.</p>)
    },
    15: {
        'name': 'Master of Life',
        'house': 'Life',
        'description': (<p>Beginning at level 6 you gain the ability to touch a dying ally as a bonus action and give them 1 hit point per level of Rune Scribe. You also gain of of the following depending on who you follow:<br />
            <br />
            <strong>Followers of the Lord</strong> gain the ability to heal the soul as well as the body, when you restore hit points to a creature, both you and the target regain an additional number of hit points equal to your proficiency bonus.
            <br /><br />
            <strong>Followers of the lady</strong> gain the ability to disrupt healing, when a creature gains hit points you may use your reaction to disrupt that healing, the disrupted creature cannot gain hit points until the start of your next turn.</p>)
    },
    16: {
        'name': 'Fast Tracing Improvement',
        'house': 'all',
        'description': (<p>At level 7 you have mastered the basic runes from the other houses. You can trace single runes up to level 2 from other houses as a bonus action, however the trace duration is halved for these runes.</p>)
    },
    17: {
        'name': 'Deconstruction',
        'house': 'all',
        'description': (<p>From level 10 you learn how to deconstruct structures as they are being cast by casting the structure in reverse. As a reaction you can counter a rune spell being cast as long as you recognize the structure and the number of runes in the structure are within your Rune Tracing number.<br />
            If you successfully deconstruct a structure you cannot use bonus actions until the end of your next turn.</p>)
    },
    18: {
        'name': 'Master Mind',
        'house': 'Mind',
        'description': (<><p>By level 10 you have learned to master your own mind, and can now spend 1 minute to enter a trance in search of one of the following:</p>
        <ul>
            <li>Find the answers to a question about something you have forgotten, or that your subconscious mind may know the answer to.</li>
            <li>Utilize the power of your subconscious mind to decide between two options, or narrow down your choices where more than two options are presented.</li>
            <li>Intentionally remove something from your memory leaving a false memory in its place.</li>
            <li>Remove one point of exhaustion from yourself</li>
        </ul>
        Or as a Bonus Action
        <ul>
            <li>Remove any Charmed or Frightened effects from yourself</li>
        </ul>
        <p>After using this ability, you must finish a long rest before using it again..</p>
        </>)
    },
    19: {
        'name': 'Persistent Runes',
        'house': 'Power',
        'description': (<p>At level 10 you learn the art of crating more long term runes. Chose one of the following:<br />
            <br />
            <strong>Carver:</strong> You learn how to extend your runestone carving abilities, when you create a runestone, you can spend an additional 20 minutes creating a copy of the runestone, repeating this up to a number of times equal to your Proficiency Bonus. These copies do not count towards your maximum number of runestones.<br />
            <br />
            <strong>Engraver:</strong> You learn how to engrave runes deep into metal, allowing you to engrave runes onto metal weapons and armour that multiplies the drawn duration of runes engraved this way by your Proficiency Bonus.</p>)
    },
    20: {
        'name': "Death's Companion",
        'house': 'Death',
        'description': (<p>By level 10 you have gained the attention of Death's minions, who flit around you unseen to all but you to a distance of 15ft.<br />
        Allies in the aura have advantage on death saving throws, and any undead in the aura are vulnerable to bludgeoning, piercing, and slashing damage.</p>)
    },
    21: {
        'name': 'Resouling',
        'house': 'Life',
        'description': (<>
            <p>At level 10, you have the ability to return a soul to a body, essentially bringing a person back from the dead. There are however limitations to this ability:</p>
            <ol>
                <li>The person <em>should</em> not have been dead more than 3 days, otherwise their mind may not survive the return to their body.</li>
                <li>The person <em>should</em> be a humanoid, and have had their wounds tended to before Resouling, otherwise they may just expire again.</li>
                <li>The soul must be made aware that their remaining lifespan will be halved before they agree to return.</li>
                <li>The soul must be free and willing to return to the body.</li>
            </ol>
            <p>After using this ability, you cannot use it again until three days and three hours(99 hours) have passed.</p>
        </>)
    },
    22: {
        'name': 'Restoration',
        'house': 'all',
        'description': (<p>From level 14 you can spend 10 days in deep meditation, mentally etching runes on your internal organs preserving them and reducing the effects of aging for the next 350 days, if used once per year you will reduce your bodies aging to only 2 weeks every year.<br />
            Any disturbance from this restoration will cancel out the entire process and require you to start the meditation again.</p>)
    },
    23: {
        'name': 'Etching',
        'house': 'all',
        'description': (<p>From level 14 you also have the ability to etch structures onto the bones of creatures, allowing certain structures to be permanently active. Doing this requires you to have access to the creatures bones, and the bones need to be clean prior to the etching. Etching structures takes 1 hour per rune, and only some structures will take and stay active permanently, other structures may only last as long as their tattooed duration.</p>)
    },
    24: {
        'name': 'All in the Mind',
        'house': 'Mind',
        'description': (<p>At level 18 you gain the ability to trick creatures minds into thinking time has stopped. As an action, you can paralyze all creatures aside from you within 1 mile for 1 minute, for the duration all creature affected are blind and deaf. When the effect ends, creatures will not realize time has passed.<br />
            While the ability is active, you can touch a creature who subconsciously trusts you, and they will blindly follow you.<br />            
            After using this ability, you must complete a long rest before it can be used again.</p>)
    },
    25: {
        'name': 'Lifeblood Blade',
        'house': 'Power',
        'description': (<p>At level 18 you gain the ability to pour your life into a weapon making it come alive briefly. You lose all but 1hp, and deal an amount of necrotic damage equal to the life you lost to up to 10 creatures of your choice as the blade moves faster than the eye can see and strikes at each target.<br />
            After using this ability you must take a long rest before being able to use it again.</p>)
    },
    26: {
        'name': "Death's Master",
        'house': 'Death',
        'description': (<p>By level 18 you have become deaths master, and while death may not be thwarted in the taking of a life, you can attempt to change the life it takes. Once per day when a creature is about to die, you may as a free action call on death to take another life in their place. In doing this the creature that was about to die will become stabilized, and another random creature within 1 mile will suddenly collapse as death takes his fee.<br />
            Death cannot be cheated, and will only take a life he sees as at least equal, saving the life of a woodland creature will result in a similar creature being taken, whereas saving the life of a more intelligent creature will result in a creature of similar intelligence being taken.</p>)
    },
    27: {
        'name': 'Halflife',
        'house': 'Life',
        'description': (<p>At level 18 you have the ability to save creatures lives at a cost of reducing the quality of their continued existence.<br />
            As a reaction when a creature you can see is about to die, you can restore them to 1hp. They suffer a permanent -5 penalty to Constitution. If a creature has less than 5 Constitution when you use this ability, that creature dies, and you feel their death, taking a permanent -5 to your own Constitution.< br />
            You can use this ability a number of times equal to your Proficiency bonus each day.</p>)
    },
    28: {
        'name': "Joint Casting",
        'house': 'all',
        'description': (<p>From level 20, as an action you can create a partial rune structure and hold it, using your reaction on another Rune Scribes turn to join it to their partial structure in order to create larger structures.</p>)
    }
}
    
