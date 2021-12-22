import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import { setToLS } from "../utils/storage";
import Layout from "../components/Layout";
// Pages
import Settings from "../components/Settings";
import Home from "../components/Home";


function MainApp() {
  // setToLS('Theme', "Life") // todo: load data from rails
  return(
    <Router>
      <Routes>
        <Route path="/app" element={<Layout page={Home} />} />
        <Route path="/app/settings" element={<Layout page={Settings} />} />
      </Routes>
    </Router>
  );
}

export default MainApp;
