import React, { useCallback, createContext, useContext, useState, useEffect } from "react";
import Cookies from 'js-cookie'
import themes from "../components/common/themes";
import Notification from "../components/common/Notification";

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
  const [notification, setNotification] = useState(false)
  const [notificationData, setNotificationData] = useState(null)

  const closeNotification = () => {
    setNotificationData(false)
    setNotification(false)
  }

  const updateData = (data) => {

    if (data.type == 'theme' || data.type == 'house') {
      
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
      console.log('hitting results')

        console.log('Updated: ', result);
        setUser(result)
        // themes require reload
        Cookies.set('Theme', data.theme, { sameSite: 'Lax'})
        window.location.reload(false);
      })
      .catch(error => {
        console.error('Error: ', error);
      })
    } else if (data.type == 'level') {
      let userData = {}
        fetch("/getUserData")
          .then(res => res.json())
          .then(
            (result) => {
              console.log(`   Updating Data...`); 
              userData = result
              Cookies.set('Theme', userData.theme, { sameSite: 'Lax'})
              setNotificationData(userData.notification ||'Level Change')
              setNotification(true)
              setUser(userData)
              const currentTheme = themes(userData.theme);
              const theme = 'color: ' + currentTheme.bodyFG;
              console.log(`%cUser Updated.`, theme);  
            },
            (error) => {
              console.error("An error occurred: " + error)
            }
        )
    } else if(data.type == 'other') {
      setNotificationData(data)
      setNotification(true)
    }
  }


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
            {notification && <Notification notificationData={notificationData} closeNotification={closeNotification} />}
            {children}
        </UserContextUpdater.Provider>
    </UserContextState.Provider>
  );
};

export { UserContextProvider, useUserContextState, useUserContextUpdater };
