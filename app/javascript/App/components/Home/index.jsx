import React, { useState } from "react";
import { StructureContextProvider } from "../../helpers/StructureContext";
import { useUserContextState } from "../../helpers/UserContext";
import styled from "styled-components";
import BonusActions from "./Pages/BonusActions";
import ScribeLevels from '../common/ScribeLevels'

function Homepage() {
  const user = useUserContextState() || ''
  const [section, setSection] = useState('Levels')

  const changePage = (page) => {
    setSection(page)
  }

  return(
    <StructureContextProvider>
      <HomeLayout>
        <PageHeading>{user.name} {user.house === 'None' ? '- Trainee Scribe' : 'of House ' + user.house}</PageHeading>
          {/* Icon bar with various icons for each section that changes the state */}
          {section === 'Bonus Actions' && <BonusActions />}
          {section === 'Levels' && <ScribeLevels level={user.level} house={user.house} />}
      </HomeLayout>
    </StructureContextProvider>
  );
}



export default Homepage

// Styling
const HomeLayout = styled.div`
  height: 2000px;
  max-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
`

const PageHeading = styled.h1`
  margin: 0.5em;
`
