import React from "react"

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


const levelFeats = (level, house) => {
    const feats = levels[level].concat(house && houses[house][level])

    return(
        <span>
            {feats.join(", ")}
        </span>
    )
}

const playerFeats = () => {

}

export default { levelFeats, playerFeats }