import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Layout from "../components/Layout";
import { UserContextProvider } from "../helpers/UserContext";

// Pages
import Settings from "../components/Settings";
import Home from "../components/Home";



function MainApp() {
  
  return(
    <UserContextProvider>
      <Router>
        <Routes>
          <Route path="/app" element={<Layout page={Home}  />} />
          <Route path="/app/settings" element={<Layout page={Settings} />} />
        </Routes>
      </Router>
    </UserContextProvider>
  );
}

export default MainApp;
