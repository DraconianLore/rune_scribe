import react from "react";
import Cookies from 'js-cookie'
import themes from "../components/common/themes";


const loadUserData = () => {
    console.log('%cWelcome Rune Scribe', 'font-size: 20px; color: #cca')
    console.log('%cI am your friendly Familiar here to help you with organizing and working out what runes and structures you can and should cast.', 'font-size: 16px; color: #cca')
    console.log('%cPlease wait while I set things up:', 'color: #cca')
  
    // LOAD DATA HERE
    let userData = {}
    fetch("/getUserData")
      .then(res => res.json())
      .then(
        (result) => {
          console.log(`   Loading User Data...`); 
          userData = result
          console.log(userData)  
          console.log(`   Loading Themes...`);
          Cookies.set('Theme', userData.theme, { sameSite: 'Lax'})
          const currentTheme = themes(userData.theme);
          const theme = 'color: ' + currentTheme.bodyFG;
          console.log(`%c   Loading Runes...`, theme);
  
          console.log(`%c   Loading Structures...`, theme);
          console.log(`%cData Load Succeeded.`, theme);
          console.log('%cWelcome Back ' + userData.name, 'font-size: 16px; ' + theme)
          return userData
        },
        (error) => {
          console.log("An error occurred: " + error)
        }
    )
  
};

const loadRuneData = () => {

}

const LoadStructureData = () => {

}

export default { loadUserData, loadRuneData, LoadStructureData }
