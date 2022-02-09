import React, { useState, useEffect } from "react";
import { useStructureContext } from "../../helpers/StructureContext";
import { useUserContextState, useUserContextUpdater } from "../../helpers/UserContext";
import styled from "styled-components";
import themes from "../common/themes";
import Cookies from 'js-cookie'
import ChooseHouse from "../common/ChoseHouse";
// Pages
import ScribeLevels from './Pages/ScribeLevels'
import Structures from "./Pages/Structures";
import BonusActions from "./Pages/BonusActions";
import Tags from "./Pages/Tags";

// images
import img_levels from './images/levels.png'
import img_structures from './images/structures.png'
import img_bonus from './images/bonus-action.png'
import img_tags from './images/tags.png'
import img_sheets from './images/sheets.png'

// Websockets
import 'channels'
import UpdatesChannel from "../../../channels/updates_channel";


function Homepage() {
  const user = useUserContextState() || ''
  const {updateData} = useStructureContext()
  const updateUser = useUserContextUpdater()
  const [section, setSection] = useState('Levels')
  const changePage = (page) => {
    setSection(page)
  }


  useEffect(() => {
    UpdatesChannel.received = (data) => {
      if (data.message == 'level') {
        updateUser({type: 'level'})
      } else if (data.message == 'other') {
        updateUser({type: 'other', title: data.title, body: data.body, refresh:data.refresh})
      }
      updateData(data)
    }
  }, [])

  return(
      <HomeLayout>
        {user.level > 1 && user.house == 'None' && <ChooseHouse />}
        <PageHeading>{user.name} {user.house === 'None' ? '- Trainee Scribe' : 'of House ' + user.house}</PageHeading>
          { user.follower && <small>Follower of the {user.follower} of the House</small>}

          {/* Icon bar with various icons for each section that changes the state */}
          <IconBar>
            <Icon onClick={() => changePage('Levels')}>
              <img src={img_levels} />
              Class Details
            </Icon>
            <Icon onClick={() => changePage('Structures')}>
              <img src={img_structures} />
              Structures
            </Icon>
            <Icon onClick={() => changePage('Bonus Actions')}>
              <img src={img_bonus} />
              Bonus Actions
            </Icon>
            <Icon onClick={() => changePage('Tags')}>
              <img src={img_tags} />
              Tag Editor
            </Icon>
            <ExternalLink href='https://docs.google.com/spreadsheets/d/1X01wocKPtiUQuVIeHJRRl__avzNRAmfTyzZCJcWCOvI/edit#gid=0' target='_blank'><Icon>
              <img src={img_sheets} />
              Tracking
            </Icon></ExternalLink>
          </IconBar>
          {section === 'Levels' && <ScribeLevels level={user.level} house={user.house} />}
          {section === 'Structures' && <Structures />}
          {section === 'Bonus Actions' && <BonusActions />}
          {section === 'Tags' && <Tags />}
      </HomeLayout>
  );
}



export default Homepage

// Styling
let currentTheme = themes(Cookies.get('Theme') || 'Mind'); 

const HomeLayout = styled.div`
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  text-align: center;
  width: calc(100% - 4em)
`

const ExternalLink = styled.a`
  &:visited, &:link {
    color: ${currentTheme.headerFG}
  }
`
const PageHeading = styled.h1`
  margin: 0;
`
const IconBar = styled.div`
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  background-color: ${currentTheme.headerBG};
  color: ${currentTheme.headerFG};
  border-radius: 1em;
  padding: 1em;
  width: 100%;
  max-width: calc(800px + 6em);
  min-width: 500px;
  `
  
  const Icon = styled.div`
  display: flex;
  flex-direction: column;
  cursor: pointer;
  margin: 0 0.5em;
  img {
    width: 100px;
    height: 100px;
  }  
  &:hover {
    filter: brightness(120%);
    font-weight: 700;
    img {
      filter: drop-shadow(0px 0px 10px ${currentTheme.headerFG});
    }
  }
`

