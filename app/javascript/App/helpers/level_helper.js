import React from "react"
import scribeFeatDetails from "./scribeFeatDetails"

const levels = {
    1: ['Rune Tracing', 'Sealing'],
    2: ['Advanced Tracing', 'Rune House'],
    3: ['Runestones'],
    4: ['Ability Score Improvement'],
    5: ['Fast Tracing'],
    6: [],
    7: ['Fast Tracing Upgrade'],
    8: ['Ability Score Improvement'],
    9: ['-'],
    10: ['Deconstruction'],
    11: ['-'],
    12: ['Ability Score Improvement'],
    13: ['-'],
    14: ['Restoration', 'Etching'],
    15: ['-'],
    16: ['Ability Score Improvement'],
    17: ['-'],
    18: [],
    19: ['Ability Score Improvement'],
    20: ['Joint Casting']
}
const houses = {
    'Mind': {
        1: [],
        2: ['<em>Gentle Breeze</em>'],
        3: [],
        4: [],
        5: [],
        6: ['<em>Mind Reading</em>'],
        7: [],
        8: [],
        9: [],
        10: ['<em>Master Mind</em>'],
        11: [],
        12: [],
        13: [],
        14: [],
        15: [],
        16: [],
        17: [],
        18: ['<em>All in the Mind</em>'],
        19: [],
        20: []
    },
    'Power': {
        1: [],
        2: ['<em>Flaming Brand</em>'],
        3: [],
        4: [],
        5: [],
        6: ['<em>Engravers Preservation</em>'],
        7: [],
        8: [],
        9: [],
        10: ['<em>Persistent Runes</em>'],
        11: [],
        12: [],
        13: [],
        14: [],
        15: [],
        16: [],
        17: [],
        18: ['<em>Lifeblood Blade</em>'],
        19: [],
        20: []
    },
    'Death': {
        1: [],
        2: ['<em>Dust to Dust</em>'],
        3: [],
        4: [],
        5: [],
        6: ["<em>Death's Apprentice</em>"],
        7: [],
        8: [],
        9: [],
        10: ["<em>Death's Companion</em>"],
        11: [],
        12: [],
        13: [],
        14: [],
        15: [],
        16: [],
        17: [],
        18: ["<em>Death's Master</em>"],
        19: [],
        20: []
    },
    'Life': {
        1: [],
        2: ['<em>Fluid Motion</em>'],
        3: [],
        4: [],
        5: [],
        6: ['<em>Master of Life</em>'],
        7: [],
        8: [],
        9: [],
        10: ['<em>Resouling</em>'],
        11: [],
        12: [],
        13: [],
        14: [],
        15: [],
        16: [],
        17: [],
        18: ['<em>Halflife</em>'],
        19: [],
        20: []
    },
    'None' : {
        1: [],
        2: [],
        3: [],
        4: [],
        5: [],
        6: [],
        7: [],
        8: [],
        9: [],
        10: [],
        11: [],
        12: [],
        13: [],
        14: [],
        15: [],
        16: [],
        17: [],
        18: [],
        19: [],
        20: []
    }
}

const levelDetails = {
    1: {
        'prof': '+2',
        'tracing': 0,
        'complexity': 'Single Rune'
    },
    2: {
        'prof': '+2',
        'tracing': 1,
        'complexity': 'Single Rune'
    },
    3: {
        'prof': '+2',
        'tracing': 1,
        'complexity': '2 Runes'
    },
    4: {
        'prof': '+2',
        'tracing': 2,
        'complexity': '2 Runes'
    },
    5: {
        'prof': '+3',
        'tracing': 2,
        'complexity': '2 Runes'
    },
    6: {
        'prof': '+3',
        'tracing': 2,
        'complexity': '4 Runes'
    },
    7: {
        'prof': '+3',
        'tracing': 4,
        'complexity': '4 Runes'
    },
    8: {
        'prof': '+3',
        'tracing': 4,
        'complexity': '4 Runes'
    },
    9: {
        'prof': '+4',
        'tracing': 4,
        'complexity': '4 Runes'
    },
    10: {
        'prof': '+4',
        'tracing': 4,
        'complexity': '8 Runes'
    },
    11: {
        'prof': '+4',
        'tracing': 8,
        'complexity': '8 Runes'
    },
    12: {
        'prof': '+4',
        'tracing': 8,
        'complexity': '8 Runes'
    },
    13: {
        'prof': '+5',
        'tracing': 8,
        'complexity': '8 Runes'
    },
    14: {
        'prof': '+5',
        'tracing': 8,
        'complexity': '16 Runes'
    },
    15: {
        'prof': '+5',
        'tracing': 16,
        'complexity': '16 Runes'
    },
    16: {
        'prof': '+5',
        'tracing': 16,
        'complexity': '16 Runes'
    },
    17: {
        'prof': '+6',
        'tracing': 16,
        'complexity': '32 Runes'
    },
    18: {
        'prof': '+6',
        'tracing': 32,
        'complexity': '32 Runes'
    },
    19: {
        'prof': '+6',
        'tracing': 32,
        'complexity': '64 Runes'
    },
    20: {
        'prof': '+6',
        'tracing': 64,
        'complexity': '128 Runes'
    },
    
}


const levelFeats = (level, house) => {
    
    const feats = levels[level].concat(house && houses[house][level])

    return(
        <span dangerouslySetInnerHTML={{ __html: feats.join(", ")}} />
    )
}


const levelRow = (level, userLevel, house) => {

    return(
        <tr className={userLevel === level ? 'current_level' : ''} key={level}>
            <td>{level === 1 ? '1st' : level === 2 ? '2nd' : level === 3 ? '3rd' : level + 'th'}</td>
            <td>{levelDetails[level]['prof']}</td>
            <td>{levelFeats(level, house)}</td>
            <td>{levelDetails[level]['tracing']}</td>
            <td>{levelDetails[level]['complexity']}</td>
        </tr>
    )
}

const scribeFeature = (feat, house) => {
    if(scribeFeatDetails[feat]['house'] === 'all' || scribeFeatDetails[feat]['house'] === house) {
        return(
            <div className={scribeFeatDetails[feat]['house'] === house ? 'scribe-feature house' : 'scribe-feature'} key={feat}>
                <h2>{scribeFeatDetails[feat]['name']}</h2>
                {scribeFeatDetails[feat]['description']}
            </div>
        )
    }
}
const playerFeatures = (house) => {
    const scribeFeats = [];

    // loop through all features and return ones that fit the house
    for(let i=1; i < Object.keys(scribeFeatDetails).length +1; i++) {
        scribeFeats.push(scribeFeature(i, house))
    }

    return(
        <>
            {scribeFeats}
        </>
    )
}

export default { levelFeats, levelRow, playerFeatures }