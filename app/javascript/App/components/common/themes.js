const mind = {
    headerBG: "#334",
    headerFG: "#acf",
    bodyBG: "#112",
    bodyFG: "#9be"
}
const power = {
    headerBG: "#530",
    headerFG: "#d95",
    bodyBG: "#310",
    bodyFG: "#c84"
}
const death = {
    headerBG: "#324",
    headerFG: "#bad",
    bodyBG: "#213",
    bodyFG: "#a9c"
}
const life = {
    headerBG: "#343",
    headerFG: "#cfc",
    bodyBG: "#121",
    bodyFG: "#beb"
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
