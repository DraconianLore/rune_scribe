import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Layout from "../components/Layout";
import { UserContextProvider } from "../helpers/UserContext";
import { StructureContextProvider } from "../helpers/StructureContext";

// Pages
import Settings from "../components/Settings";
import Home from "../components/Home";
import StructureUnlocking from "../components/Learning";

function MainApp() {
  
  return(
    <UserContextProvider>
      <StructureContextProvider>
        <Router>
          <Routes>
            <Route path="/app" element={<Layout page={Home}  />} />
            <Route path="/app/settings" element={<Layout page={Settings} />} />
            <Route path="/app/Learning-Runes" element={<Layout page={StructureUnlocking} />} />
          </Routes>
        </Router>
        </StructureContextProvider>
    </UserContextProvider>
  );
}

export default MainApp;
