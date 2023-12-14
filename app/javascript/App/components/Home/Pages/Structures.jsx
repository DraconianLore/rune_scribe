import React, { useState, useEffect } from "react"
import styled from "styled-components";
import Structure from "../../common/Structure";
import themes from "../../common/themes";
import Cookies from "js-cookie";
import { useRuneContext, useStructureContext, useTagContext } from "../../../helpers/StructureContext";
import Rune from "../../common/Rune";
import { useUserContextState } from "../../../helpers/UserContext";


function Structures({searchRef}) {
    const { structures } = useStructureContext() || ''
    const runes = useRuneContext() || '';
    const user = useUserContextState() || '';
    const tags = useTagContext() || '';
    const [search, setSearch] = useState(null)
    const [runeFilter, setRuneFilter] = useState(true)
    const [structureFilter, setStructureFilter] = useState(true)
    const [houseFilter, setHouseFilter] = useState(false)
    const [favoriteFilter, setFavoriteFilter] = useState(false)
    const [tagFilter, setTagFilter] = useState(false)
    const [tagFilters, setTagFilters] = useState([])
    
    const toggleTagFilters = () => {
        setTagFilter(!tagFilter)
        setTagFilters([])
    }

    const choseTagFilters = (tagId) => {
        if(tagId == 'all') {
            setTagFilters(tags.map(tag => tag.id))
        } else if(tagId == 'none') {
            setTagFilters([])
        } else {

            if (tagFilters.includes(tagId)) {
                setTagFilters(tagFilters.filter(tag => tag !== tagId))
            } else {
                setTagFilters([...tagFilters, tagId])
            }
        }
    }

    const TagFilterList = () => {

        const filteredTags = tags.map((tag) => {
            return(
                    <Tag fgColour={tag.colour} bgColour={tag.background} key={tag.id} id={tag.id} onClick={() => choseTagFilters(tag.id)} className={tagFilters.includes(tag.id) ? 'include' : 'exclude'} >{tag.name}</Tag>
                )
        })
        return (
            <>
            <TagList>
                <Tag fgColour='#cca' bgColour='#223' key='all' onClick={() => choseTagFilters('all')} className={`large ${tagFilters.length == tags.length ? 'include' : 'exclude'}`} >All Tags</Tag>
                <Tag fgColour='#cca' bgColour='#223' key='none' onClick={() => choseTagFilters('none')} className={`large ${tagFilters.length == 0 ? 'include' : 'exclude'}`} >No Tags</Tag>
            </TagList>
            <TagList border={true}>
                {filteredTags}
            </TagList>
            </>
        )
    }

    const StructureList = () => {
        const structureList = structures.filter((data) => {
            const tagIds = data.tags.map(tag => tag.id)
            if (!structureFilter) {
                return
            }
            if (!favoriteFilter || data.fav_by.includes(user.id.toString())) {
                if (!houseFilter || data.dominant === user.house) {
                    if (!tagFilter || tagIds.some(id => tagFilters.includes(id))) {
                        if(search == null) {
                            return data
                        }
                        else if (data.name.toLowerCase().includes(search.toLowerCase()) || data.description.toLowerCase().includes(search.toLowerCase()) || data.trace.toLowerCase().includes(search.toLowerCase()) || data.target.toString().toLowerCase().includes(search.toLowerCase())) {
                            return data
                        }
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
            const tagIds = data.tags.map(tag => tag.id)
            if (!runeFilter) {
                return
            }
            if (!favoriteFilter || data.fav_by.includes(user.id.toString())) {
                if (!houseFilter || data.house === user.house) {
                    if (!tagFilter || tagIds.some(id=>tagFilters.includes(id))) {
                        if(search == null) {
                            return data
                        }
                        else if (data.name.toLowerCase().includes(search.toLowerCase()) || data.description.toLowerCase().includes(search.toLowerCase()) || data.trace.toLowerCase().includes(search.toLowerCase()) || data.target.toString().toLowerCase().includes(search.toLowerCase())) {
                            return data
                        }
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
            <StructureHeader border={!tagFilter}>
                <input type='text' id='tag-filter' placeholder='Filter' onChange={(e) => setSearch(e.target.value)} ref={searchRef}></input>
                <Filter onClick={() => setRuneFilter(!runeFilter)} className={runeFilter ? 'active large' : 'inactive large'}>Runes</Filter>
                <Filter onClick={() => setStructureFilter(!structureFilter)} className={structureFilter ? 'active large' : 'inactive large'}>Structures</Filter>
                <Filter onClick={() => toggleTagFilters()} className={tagFilter ? 'active' : 'inactive'}>Tags</Filter>
                <Filter onClick={() => setHouseFilter(!houseFilter)} className={houseFilter ? 'active' : 'inactive'}>Dominant</Filter>
                <Filter onClick={() => setFavoriteFilter(!favoriteFilter)} className={favoriteFilter ? 'active' : 'inactive'}><i className="fas fa-heart" aria-hidden='true' /></Filter>
            </StructureHeader>
                {tagFilter && <TagFilterList />}
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
    border-bottom: ${props => props.border && "3px " + currentTheme.bodyBG + " dotted"};
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
    &.large {
        font-size: 200%;
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

const TagList = styled.div`
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
    background-color: ${currentTheme.headerBG};
    border-bottom: ${props => props.border && "3px " + currentTheme.bodyBG + " dotted"};
    width: 100%;
    max-width: calc(900px + 4em);
    padding: 0.5em 0.5em 1em;
    `
    
    const Tag = styled.p`
    background-color: ${props => props.bgColour};
    color: ${props => props.fgColour};
    margin: 0.1em;
    padding: 0.1em 0.4em;
    border-radius: 5px;
    height: 1.2em;
    cursor: pointer;
    &:hover {
        filter: drop-shadow(0px 0px 5px #cca);
    }
    &.exclude {
        filter: brightness(50%);
        &:hover {
            filter: drop-shadow(0px 0px 5px #cca) brightness(75%);
        }
    }
    &.large {
        font-size: 150%;
    }
    
`

