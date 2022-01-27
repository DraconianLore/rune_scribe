import React, { useState, useEffect } from "react"
import styled from "styled-components";
import Structure from "../../common/Structure";
import themes from "../../common/themes";
import Cookies from "js-cookie";
import { useRuneContext, useStructureContext } from "../../../helpers/StructureContext";
import Rune from "../../common/Rune";
import { useUserContextState } from "../../../helpers/UserContext";


function Structures() {
    const { structures } = useStructureContext() || ''
    const runes = useRuneContext() || '';
    const user = useUserContextState() || '';
    const [search, setSearch] = useState(null)
    const [runeFilter, setRuneFilter] = useState(true)
    const [structureFilter, setStructureFilter] = useState(true)
    const [houseFilter, setHouseFilter] = useState(false)
    const [favoriteFilter, setFavoriteFilter] = useState(false)



    const StructureList = () => {
        const structureList = structures.filter((data) => {
            if (!structureFilter) {
                return
            }
            if (!favoriteFilter || data.fav_by.includes(user.id)) {
                if (!houseFilter || data.dominant === user.house) {
                    if(search == null) {
                        return data
                    }
                    else if (data.name.toLowerCase().includes(search.toLowerCase()) || data.description.toLowerCase().includes(search.toLowerCase())) {
                        return data
                    }
                }
            }
        }).map((data) => {
            return(<Structure structure={data} key={data.id}  />)    
        })

        return (
            <>
                {structureList}
            </>
        )
    }
    const RuneList = () => {
        const runeList = runes.filter((data) => {
            if (!runeFilter) {
                return
            }
            if (!favoriteFilter || data.fav_by.includes(user.id)) {
                if (!houseFilter || data.house === user.house) {
                    if(search == null) {
                        return data
                    }
                    else if (data.name.toLowerCase().includes(search.toLowerCase()) || data.description.toLowerCase().includes(search.toLowerCase())) {
                        return data
                    }
                }
            }
        }).map((data) => {
            return(<Rune rune={data} bonusAction={false} key={data.id} />)    
   
        })

        return (
            <>
                {runeList}
            </>
        )
    }
    return(
        <>
            <h3>Runes and Structures</h3>
            <StructureHeader>
                <input type='text' id='tag-filter' placeholder='Filter' onChange={(e) => setSearch(e.target.value)}></input>
                <Filter onClick={() => setRuneFilter(!runeFilter)} className={runeFilter ? 'active' : 'inactive'}>Runes</Filter>
                <Filter onClick={() => setStructureFilter(!structureFilter)} className={structureFilter ? 'active' : 'inactive'}>Structures</Filter>
                <Filter onClick={() => setHouseFilter(!houseFilter)} className={houseFilter ? 'active' : 'inactive'}>Dominant</Filter>
                <Filter onClick={() => setFavoriteFilter(!favoriteFilter)} className={favoriteFilter ? 'active' : 'inactive'}><i className="fas fa-heart" aria-hidden='true' /></Filter>
            </StructureHeader>
            <ItemContainer>
                <RuneList />
                <StructureList />
            </ItemContainer>
        </>
    )
    
    
}

export default Structures


// styling

let currentTheme = themes(Cookies.get('Theme') || 'Mind'); 

const StructureHeader = styled.div`
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    height: 60px;
    background-color: ${currentTheme.headerBG};
    max-width: calc(900px + 4em);
    margin-top: 0.5em;
    border-radius: 10px 10px 0 0;
    padding: 0 0.5em;
    border-bottom: 3px ${currentTheme.bodyBG} dotted;

    input {
        width: 100px;
        margin-left: 10px;
    }
    i {
        margin-right: 10px;
    }

`

const Filter = styled.h3`
    cursor: pointer;
    background-color: rgba(0,0,0,0.5);
    padding: 5px 10px;
    border-radius: 5px;
    i {
        padding-left: 10px;
    }
    &.inactive {
        filter: brightness(50%);
    }
`

const ItemContainer = styled.div`
    Display: flex;
    flex-wrap: wrap;
    width: 100%;
    background-color: ${currentTheme.headerBG};
    justify-content: space-evenly;
    max-width: calc(900px + 4em);
    padding: 0.5em;
`

