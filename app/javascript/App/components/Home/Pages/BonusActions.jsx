import React, {useEffect, useState} from "react"
import styled from "styled-components";
import Rune from "../../common/Rune";
import themes from "../../common/themes";
import Cookies from "js-cookie";


function BonusActions() {

    const [runes, setRunes] = useState(null);

    useEffect(() => {
        const loadBonusActionRunes = () => {
            fetch("/getBonusActions")
            .then(res => res.json())
            .then(
                (result) => {
                    setRunes(result.runes)
                },
                (error) => { 
                    console.error("An error occurred: " + error)
                }
            )
        }
        loadBonusActionRunes();
    }, []);
    const RuneList = () => {
        const runeList = runes.map((rune, i) => {
            return(<Rune rune={rune} bonusAction={true} key={i}  />)    
        })

        return (
            <RuneContainer>
                {runeList}
            </RuneContainer>
        )
    }
    
    return(
        <>
            <h3>Bonus Actions</h3>
            {runes ? <RuneList /> : <h2>No Bonus action runes available until level 5</h2>}
        </>
    )
}

export default BonusActions

// Styling

let currentTheme = themes(Cookies.get('Theme') || 'Mind'); 

const RuneContainer = styled.div`
    Display: flex;
    flex-wrap: wrap;
    width: 100%;
    background-color: ${currentTheme.headerBG};
    justify-content: space-evenly;
    max-width: calc(900px + 4em);
    padding: 0.5em;
`
