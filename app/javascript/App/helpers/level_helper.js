import React from "react"
import scribeFeatDetails from "./scribeFeatDetails"
import styled from "styled-components"

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
        2: ['Gentle Breeze'],
        3: [],
        4: [],
        5: [],
        6: ['Mind Reading'],
        7: [],
        8: [],
        9: [],
        10: ['Master Mind'],
        11: [],
        12: [],
        13: [],
        14: [],
        15: [],
        16: [],
        17: [],
        18: ['All in the Mind'],
        19: [],
        20: []
    },
    'Power': {
        1: [],
        2: ['Flaming Brand'],
        3: [],
        4: [],
        5: [],
        6: ['Engravers Preservation'],
        7: [],
        8: [],
        9: [],
        10: ['Persistent Runes'],
        11: [],
        12: [],
        13: [],
        14: [],
        15: [],
        16: [],
        17: [],
        18: ['Lifeblood Blade'],
        19: [],
        20: []
    },
    'Death': {
        1: [],
        2: ['Dust to Dust'],
        3: [],
        4: [],
        5: [],
        6: ["Death's Apprentice"],
        7: [],
        8: [],
        9: [],
        10: ["Death's Companion"],
        11: [],
        12: [],
        13: [],
        14: [],
        15: [],
        16: [],
        17: [],
        18: ["Death's Master"],
        19: [],
        20: []
    },
    'Life': {
        1: [],
        2: ['Fluid Motion'],
        3: [],
        4: [],
        5: [],
        6: ['Master of Life'],
        7: [],
        8: [],
        9: [],
        10: ['Resouling'],
        11: [],
        12: [],
        13: [],
        14: [],
        15: [],
        16: [],
        17: [],
        18: ['Halflife'],
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
        'complexity': 'Single Rune',
        'features': [1, 2]
    },
    2: {
        'prof': '+2',
        'tracing': 1,
        'complexity': 'Single Rune',
        'features': [3,4,5,6,7,8]
    },
    3: {
        'prof': '+2',
        'tracing': 1,
        'complexity': '2 Runes',
        'features': [9]
    },
    4: {
        'prof': '+2',
        'tracing': 2,
        'complexity': '2 Runes',
        'features': [10]
    },
    5: {
        'prof': '+3',
        'tracing': 2,
        'complexity': '2 Runes',
        'features': [11]
    },
    6: {
        'prof': '+3',
        'tracing': 2,
        'complexity': '4 Runes',
        'features': [12,13,14,15]
    },
    7: {
        'prof': '+3',
        'tracing': 4,
        'complexity': '4 Runes',
        'features': [16]
    },
    8: {
        'prof': '+3',
        'tracing': 4,
        'complexity': '4 Runes',
        'features': [10]
    },
    9: {
        'prof': '+4',
        'tracing': 4,
        'complexity': '8 Runes',
        'features': []
    },
    10: {
        'prof': '+4',
        'tracing': 4,
        'complexity': '8 Runes',
        'features': [17,18,19,20,21]
    },
    11: {
        'prof': '+4',
        'tracing': 8,
        'complexity': '8 Runes',
        'features': []
    },
    12: {
        'prof': '+4',
        'tracing': 8,
        'complexity': '8 Runes',
        'features': [10]
    },
    13: {
        'prof': '+5',
        'tracing': 8,
        'complexity': '16 Runes',
        'features': []
    },
    14: {
        'prof': '+5',
        'tracing': 8,
        'complexity': '16 Runes',
        'features': [22,23]
    },
    15: {
        'prof': '+5',
        'tracing': 16,
        'complexity': '16 Runes',
        'features': []
    },
    16: {
        'prof': '+5',
        'tracing': 16,
        'complexity': '16 Runes',
        'features': [10]
    },
    17: {
        'prof': '+6',
        'tracing': 16,
        'complexity': '32 Runes',
        'features': []
    },
    18: {
        'prof': '+6',
        'tracing': 32,
        'complexity': '32 Runes',
        'features': [24,25,26,27]
    },
    19: {
        'prof': '+6',
        'tracing': 32,
        'complexity': '64 Runes',
        'features': []
    },
    20: {
        'prof': '+6',
        'tracing': 64,
        'complexity': '128 Runes',
        'features': [28]
    },
    
}


const levelFeats = (level, house) => {
    
    const feats = levels[level].concat(house && houses[house][level])

    return(
        <span>
            {feats.join(", ")}
        </span>
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

const newLevelDetails = (level, house) => {
    const levelDetail = levelDetails[level]
    const levelFeatures = []

    levelDetail.features.forEach(feature => {
        if(scribeFeatDetails[feature]['house'] == 'all' || scribeFeatDetails[feature]['house'] === house) {
            levelFeatures.push(scribeFeatDetails[feature])
        }
    });
    
    const levelInfo = {
        levelDetails: levelDetail,
        levelFeats: levelFeatures
    }
    
    return levelInfo
}



export default { levelFeats, levelRow, playerFeatures, newLevelDetails }
