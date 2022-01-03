import React, { useState } from "react";
import { StructureContextProvider } from "../../helpers/StructureContext";
import { useUserContextState } from "../../helpers/UserContext";
import styled from "styled-components";
import BonusActions from "./Pages/BonusActions";

function Homepage() {
  const user = useUserContextState() || ''
  const [section, setSection] = useState(null)

  const changePage = (page) => {
    setSection(page)
  }

  return(
    <StructureContextProvider>
      <HomeLayout>
        <PageHeading>Hello {user.name}</PageHeading>
          {/* Icon bar with various icons for each section that changes the state */}
          {section === 'Bonus Actions' && <BonusActions />}
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
