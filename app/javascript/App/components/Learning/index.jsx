import React, { useState, useEffect } from "react";
import styled from "styled-components";
import themes from "../common/themes";
import Cookies from 'js-cookie'

import Overview from "./Overview";

// Websockets
import 'channels'
import UnlockChannel from "../../../channels/unlocking_channel";

const loadInitialData = () => {
  // make call to backend so each user gets only their available details
  // Sort data into sections
  let runeData2 = null;
  let runeData4 = null;
  let runeData8 = null;
  let runeData16 = null;
  return {2: runeData2, 4: runeData4, 8: runeData8, 16: runeData16}
  // set structureSize to players max current
}

function StructureUnlocking() {
    // Data
    const [rawData, setRawData] = useState(loadInitialData);
    const [currentData, setCurrentData] = useState(null);
    const [structureSize, setStructureSize] = useState('Two');
    const [showStructureSelect, setShowStructureSelect] = useState(false);
    
    // Views
    const [overview, setOverview] = useState(true) // Show overview of structure size area
    const [houseView, setHouseView] = useState(false) // Show House view for current structure size
    const [singleView, setSingleView] = useState(false) // Show Rune or Structure view for a single item
    
    
    const updateStructures = (data) => {
      // make call to backend so each user gets only their available details
      // Sort data into sections as in 'loadInitialData' function
        
    }

    useEffect(() => {
        UnlockChannel.received = (data) => {
          // LOAD OR RELOAD DATA after receiving this trigger from WS
          updateStructures(data)
        }
      }, [])

    const changeView = (newView) => {
      setShowStructureSelect(false)
      setOverview(newView.changeTo == 'Overview' ? true : false)
      setHouseView(false)
      setSingleView(false)
      // TODO: load new data for view

      // set correct view for house or rune
      newView.changeTo == 'House' && setHouseView(newView.house)
      newView.changeTo == 'Rune' && changeSingleItem({house: newView.house, rune: newView.item})
    }

    const changeSingleItem = (newItem) => {
      const house = newItem.house;
      const item = newItem.item;
      //   change current data to reflect selected rune or structure
      setHouseView(house);
      setSingleView(item);
    }
    const LearningBar = () => {
      // overview button, tree view, structure size button
      return (
          <NavBar>
              <NavTree>
                  <BarButton size='200%' onClick={() => changeView({changeTo: 'Overview'})}>Overview</BarButton>
                  {houseView && <BarButton size='150%' onClick={() => changeView({changeTo: 'House', house: houseView})}>{houseView}</BarButton>}
                  {singleView && <BarButton size='100%'>{singleView}</BarButton>}
              </NavTree>
              <NumberOfRunes>
                  <CurrentStructureSize open={showStructureSelect} onClick={() => setShowStructureSelect(!showStructureSelect)}>{structureSize} Rune Structures</CurrentStructureSize>
                {showStructureSelect &&<RuneSizeSelect>
                  {structureSize !== 'Two' &&<StructureSizeSelect onClick={() => {  setStructureSize('Two'); changeView({changeTo: 'Overview'});}}>
                    Two Runes
                  </StructureSizeSelect>}
                  {structureSize !== 'Four' &&<StructureSizeSelect  onClick={() => {  setStructureSize('Four'); changeView({changeTo: 'Overview'});}}>
                    Four Runes
                  </StructureSizeSelect>}
                  {structureSize !== 'Eight' &&<StructureSizeSelect  onClick={() => {  setStructureSize('Eight'); changeView({changeTo: 'Overview'});}}>
                    Eight Runes
                  </StructureSizeSelect>}
                  {structureSize !== 'Sixteen' &&<StructureSizeSelect  onClick={() => { setStructureSize('Sixteen'); changeView({changeTo: 'Overview'});}}>
                    Sixteen Runes
                  </StructureSizeSelect>}
                </RuneSizeSelect>}
              </NumberOfRunes>
          </NavBar>
      )
    }


    return(
        <>
          <LearningBar />
          {/* TODO: Figure out what views would best show the data tables, ie; without Xs, house columns, single rune/structure columns... */}
          {overview && <Overview numberOfRunes={structureSize} />}
          {/* <HouseView data={currentData} /> */}
          {/* <SingleView data={currentData} /> */}
        </>
    )
}

export default StructureUnlocking

// Styling
let currentTheme = themes(Cookies.get('Theme') || 'Mind'); 


const RuneSizeSelect = styled.div`
  position: absolute;
  top: 2em;
  left: 20%;
  width: 80%;
  p:last-of-type {
    border-radius: 0 0 10px 10px;
  }
  p:first-of-type {
    border-radius: 0 10px 0 0;
  }
`


const NavBar = styled.div`
  display: flex;
  max-width: 800px;
  align-items: center;
  justify-content: space-between;
  background-color: ${currentTheme.headerBG};
  width: 100%;
  margin-top: 1em;
  border-radius: 20px;
  padding: 1em;
`
const NavTree = styled.div`
  display: flex;
  align-items: center;
  justify-content: flex-start;
`
const BarButton = styled.p`
  background-color: ${currentTheme.bodyBG};
  color: ${currentTheme.headerFG};
  padding: 0.2em 1em;
  border-radius: 0 10px 10px 0;
  font-size: ${props => props.size};
  margin: 0;
  height: fit-content;
  cursor: pointer;
  &:hover {
      filter: brightness(50%);
  }
`
const NumberOfRunes = styled.div`
  background-color: ${currentTheme.bodyBG};
  padding: 0.2em 1em;
  border-radius: 10px;
  height: fit-content;
  color: ${currentTheme.headerFG};
  margin: 0;
  position: relative;
`

const CurrentStructureSize = styled.div`
  font-size: 150%;
  cursor: pointer;
  &:hover {
      filter: brightness(50%);
  }
  ${props => props.open && 'filter: brightness(50%)'}
`

const StructureSizeSelect = styled.p`
  background-color: ${currentTheme.bodyFG};
  color: ${currentTheme.bodyBG};
  padding: 0.2em 1em;
  margin: 0;
  font-size: 100%;
  height: fit-content;
  cursor: pointer;
  &:hover {
      font-size: 150%;
      filter: brightness(50%);
  }
`
