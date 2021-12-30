import React, { useEffect } from "react";
import { StructureContextProvider } from "../../helpers/StructureContext";
import { useUserContextState } from "../../helpers/UserContext";

function Homepage() {
  

  return(
    <StructureContextProvider>
      <p>users home page</p>
    </StructureContextProvider>
  );
}


export default Homepage

// Styling

