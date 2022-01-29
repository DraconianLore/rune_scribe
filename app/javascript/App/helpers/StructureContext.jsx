import React, { createContext, useContext, useState, useEffect } from "react";
import Cookies from 'js-cookie'
import themes from "../components/common/themes";
import styled from "styled-components";
import Notification from "../components/common/Notification";

// create context
const StructureContext = createContext();
const RuneContext = createContext();
const TagContext = createContext();

// create hooks
const useStructureContext = () => {
    const context = useContext(StructureContext)
    // if `undefined`, throw an error
    if (context === undefined) {
        throw new Error("useStructureContextState was used outside of its Provider");
        }
    
    return context;
}
const useRuneContext = () => {
    const context = useContext(RuneContext)
    // if `undefined`, throw an error
    if (context === undefined) {
        throw new Error("useRuneContextState was used outside of its Provider");
        }
    
    return context;
}
const useTagContext = () => {
    const context = useContext(TagContext)
    // if `undefined`, throw an error
    if (context === undefined) {
        throw new Error("useTagContextState was used outside of its Provider");
        }
    
    return context;
}

const StructureContextProvider = ({ children }) => {
    const [structures, setStructures] = useState(null);
    const [runes, setRunes] = useState(null);
    const [tags, setTags] = useState(null);
    const [ready, setReady] = useState(false)
    const [notification, setNotification] = useState(false)
    const [notificationData, setNotificationData] = useState(null)
  
    useEffect(() => {
        const loadStructures = () => {
            setReady(false)
            fetch("/getStructures")
            .then(res => res.json())
            .then(
                (result) => {
                    const currentTheme = themes(Cookies.get('Theme'));
                    const theme = 'color: ' + currentTheme.bodyFG;
                    console.log(`%c   Loading Runes...`, theme);
                    setRunes(result.runes)
                    console.log(`%c   Loading Structures...`, theme);
                    setStructures(result.structures)
                    console.log(`%c   Loading Tags...`, theme);
                    setTags(result.tags)
                    console.log(`%cData Load Succeeded.`, theme);
                setReady(true)
                },
                (error) => {
                    console.error("An error occurred: " + error)
                }
            )
            
        };
        loadStructures()
    }, []);
    function updateData(data) {
        setReady(false)
        fetch("/getStructures")
        .then(res => res.json())
        .then(
            (result) => {
                const currentTheme = themes(Cookies.get('Theme'));
                const theme = 'color: ' + currentTheme.bodyFG;
                console.log(`%c   Updating Runes...`, theme);
                setRunes(result.runes)
                console.log(`%c   Updating Structures...`, theme);
                setStructures(result.structures)
                console.log(`%c   Updating Tags...`, theme);
                setTags(result.tags)
                console.log(`%cData Updated.`, theme);
                if(data.message == 'new structure') {
                    setNotificationData({type: 'structure', structure: data.structure})
                    setNotification(true)
                }
                setReady(true)
            },
            (error) => {
                console.error("An error occurred: " + error)
            }
        )
    }

    const closeNotification = () => {
        setNotification(false)
    }

    return (
        <StructureContext.Provider value={{structures: structures, updateData: updateData}}>
            <RuneContext.Provider value={runes}>
                <TagContext.Provider value={tags}>
                    {ready || <Loading />}
                    {notification && <Notification notificationData={notificationData} closeNotification={closeNotification} />}
                    {children}
                </TagContext.Provider>
            </RuneContext.Provider>
        </StructureContext.Provider>
    )
}

const Loading = styled.div`
    position: absolute;
    top: 0;
    left: 0;
    height: 100vh;
    width: 100vw;
    z-index: 3;
    background-color: rgba(0,0,0,0.1)
`

export { StructureContextProvider, useStructureContext, useRuneContext, useTagContext }
