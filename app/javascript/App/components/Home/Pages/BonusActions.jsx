import React, {useEffect, useState} from "react"
import styled from "styled-components";
import Rune from "../../common/Rune";
import themes from "../../common/themes";
import Cookies from "js-cookie";

const RuneList = (props) => {
    let runes = [];
    for (let i = 0; i < props.runes.length; i++){
        runes.push(<Rune rune={props.runes[i]} bonusAction={true} key={'rune' + i} />)
    }

    return (
        <RuneContainer>
            {runes}
        </RuneContainer>
    )
}


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
    
    return(
        <>
            <h3>Bonus Actions</h3>
            {runes ? <RuneList runes={runes}/> : <h2>No Bonus action runes available until level 5</h2>}
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
