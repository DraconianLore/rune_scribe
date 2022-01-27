import React, { useCallback, createContext, useContext, useState, useEffect } from "react";
import Cookies from 'js-cookie'
import themes from "../components/common/themes";

// create context
const UserContextState = createContext();
const UserContextUpdater = createContext();

// create hooks
const useUserContextState = () => {
    const context = useContext(UserContextState)
    // if `undefined`, throw an error
    if (context === undefined) {
    throw new Error("useUserContextState was used outside of its Provider");
    }

return context;
}
const useUserContextUpdater = () => {
    const context = useContext(UserContextUpdater)
    // if `undefined`, throw an error
    if (context === undefined) {
    throw new Error("useUserContextState was used outside of its Provider");
    }

return context;
}


const UserContextProvider = ({ children }) => {
  // the value that will be given to the context
  const [user, setUser] = useState(null);

  const updateData = useCallback((data) => {
    fetch("/update_settings",{
        method: 'PUT',
        headers:  {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: JSON.stringify(data)
    })
    .then(res => res.json())
    .then(result => {
        console.log('Updated: ', result);
        setUser(result)
        if (data.theme) {
            // themes require reload
            Cookies.set('Theme', data.theme, { sameSite: 'Lax'})
            window.location.reload(false);
        }
    })
    .catch(error => {
        console.error('Error: ', error);
    })
    })


  useEffect(() => {
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
              console.log(`   Loading Themes...`);
              Cookies.set('Theme', userData.theme, { sameSite: 'Lax'})
              const currentTheme = themes(userData.theme);
              const theme = 'color: ' + currentTheme.bodyFG;
      
              console.log(`%cUser Load Succeeded.`, theme);
              console.log('%cWelcome Back ' + userData.name, 'font-size: 16px; ' + theme)
              setUser(userData)
            },
            (error) => {
              console.error("An error occurred: " + error)
            }
        )
    };
    loadUserData()
  }, []);

  return (
    // the Provider gives access to the context to its children
    <UserContextState.Provider value={user}>
        <UserContextUpdater.Provider value={updateData}>
            {children}
        </UserContextUpdater.Provider>
    </UserContextState.Provider>
  );
};

export { UserContextProvider, useUserContextState, useUserContextUpdater };