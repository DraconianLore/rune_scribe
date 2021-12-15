const mind = {
    headerBG: "#334",
    headerFG: "#acf"
}
const power = {
    headerBG: "#530",
    headerFG: "#d95"
}
const death = {
    headerBG: "#324",
    headerFG: "#bad"
}
const life = {
    headerBG: "#343",
    headerFG: "#cfc"
}

export default (theme) => {
    let currentTheme;
    switch (theme) {
        case 'mind':
            currentTheme = mind;
            break;
        case 'power':
            currentTheme = power;
            break;
        case 'death':
            currentTheme = death;
            break;
        case 'life':
            currentTheme = life;
            break;
        default:
            currentTheme = mind;
            break;
    }
    return currentTheme;
}
