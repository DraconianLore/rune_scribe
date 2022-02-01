const mind = {
    headerBG: "#334",
    headerFG: "#acf",
    bodyBG: "#112",
    bodyFG: "#9be",
    houseInfo: "House Firmament, house of mind and air, the magic in this house is based on the manipulation of the air around us, and using runes from a distance."
}
const power = {
    headerBG: "#530",
    headerFG: "#d95",
    bodyBG: "#310",
    bodyFG: "#c84",
    houseInfo: "House Sun, house of power and fire, the magic in this house is based on the manipulation of fire and energy, and focussed on items with rune magic."
}
const death = {
    headerBG: "#324",
    headerFG: "#bad",
    bodyBG: "#213",
    bodyFG: "#a9c",
    houseInfo: "House Dark, house of death and earth, the magic in this house is based on the manipulation of the earth, and using the rune magic to affect larger areas."
}
const life = {
    headerBG: "#343",
    headerFG: "#cfc",
    bodyBG: "#121",
    bodyFG: "#beb",
    houseInfo: "House Spring, house of life and water, the magic in this house is based on the manipulation of water and flora, and using the rune magic to travel in the blink of an eye."
}

export default (theme) => {
    let currentTheme;
    switch (theme) {
        case 'Mind':
            currentTheme = mind;
            break;
        case 'Power':
            currentTheme = power;
            break;
        case 'Death':
            currentTheme = death;
            break;
        case 'Life':
            currentTheme = life;
            break;
        default:
            currentTheme = mind;
            break;
    }
    return currentTheme;
}
