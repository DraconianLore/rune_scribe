import React, { useState, useEffect } from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Layout from "../components/Layout";
import Cookies from 'js-cookie'
import themes from "../components/common/themes";

// Pages
import Settings from "../components/Settings";
import Home from "../components/Home";


// Initial data load
const loadUserData = () => {
  console.log('%cWelcome Rune Scribe', 'font-size: 20px; color: #cca')
  console.log('%cI am your friendly Familiar here to help you with organizing and working out what runes and structures you can and should cast.', 'font-size: 16px; color: #cca')
  console.log('%cPlease wait while I set things up:', 'color: #cca')

  // LOAD DATA HERE
  const userData = {name: 'Mandenbar'}

  // load user data if none loaded
  if (!Cookies.get('Name')) {
    console.log(`   Loading User Data...`); 
    Cookies.set('Name', userData.name, { sameSite: 'Lax'})
  }
  const user = {'name': Cookies.get('Name')}


  // Load Theme
  console.log(`   Loading Theme...`);
  user.theme = Cookies.get('Theme') || 'Mind'
  const currentTheme = themes(user.theme);
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
  return user
};

// Update settings
const updateData = (data) => {
  switch (data.type) {
    case 'Theme':
      Cookies.set('Theme', data.theme, { sameSite: 'Lax'})
      // Replace reload with actioncable change
      window.location.reload(false);
      break;
    default:
      break;
  }
}

function MainApp() {
  
  // actioncable connection
  const [userData, setUserData] = useState(loadUserData())
  
  
  return(
    <Router>
      <Routes>
        <Route path="/app" element={<Layout page={Home} user={userData} updateData={updateData} />} />
        <Route path="/app/settings" element={<Layout page={Settings} user={userData} updateData={updateData} />} />
      </Routes>
    </Router>
  );
}

export default MainApp;
