import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Layout from "../components/Layout";
import Cookies from 'js-cookie'
import themes from "../components/common/themes";

// Pages
import Settings from "../components/Settings";
import Home from "../components/Home";

const loadUserData = () => {
  console.log('%cWelcome Rune Scribe', 'font-size: 20px; color: #cca')
  console.log('%cI am your friendly Familiar here to help you with organizing and working out what runes and structures you can and should cast.', 'font-size: 16px; color: #cca')
  console.log('%cPlease wait while I set things up:', 'color: #cca')

  // load user data if none loaded
  if (!Cookies.get('Name')) {
    console.log(`   Loading User Data...`); 
  }
  const user = {'name': 'Mandenbar'}
  // Load Theme
  console.log(`   Loading Theme...`);
  const currentTheme = themes(Cookies.get('Theme') || "Mind");
  const theme = 'color: ' + currentTheme.bodyFG;

  // load runes and structures if not loaded
  if (!Cookies.get('Name')) {
    console.log(`%c   Loading Runes...`, theme);
    console.log(`%c   Loading Structures...`, theme);
  }

  // final output once checks pass
  if (Cookies.get('Name')) {
    // update of data
    console.log(`%cUpdate Complete.`, 'font-size: 16px; ' + theme);
  } else {
    // initial load of data
    console.log(`%cData Load Succeeded.`, theme);
    console.log('%cWelcome Back ' + user.name, 'font-size: 16px; ' + theme)
  }
  
};

function MainApp() {
  loadUserData();
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
