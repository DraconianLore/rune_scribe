import React, { createContext, useContext, useState, useEffect } from "react";
import Cookies from 'js-cookie'
import themes from "../components/common/themes";

// create context
const StructureContext = createContext();
const RuneContext = createContext();

// create hooks
const useStructureContext = () => {
    const context = useContext(StructureContext)
    // if `undefined`, throw an error
    if (context === undefined) {
        throw new Error("useUserContextState was used outside of its Provider");
        }
    
    return context;
}
const useRuneContext = () => {
    const context = useContext(RuneContext)
    // if `undefined`, throw an error
    if (context === undefined) {
        throw new Error("useUserContextState was used outside of its Provider");
        }
    
    return context;
}

const StructureContextProvider = ({ children }) => {
    const [structures, setStructures] = useState(null);
    const [runes, setRunes] = useState(null);

    useEffect(() => {
        const loadStructures = () => {
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
                    console.log(`%cData Load Succeeded.`, theme);
                },
                (error) => {
                    console.error("An error occurred: " + error)
                }
            )
            
        };
        loadStructures()
    }, []);

    return (
        <StructureContext.Provider value={structures}>
            <RuneContext.Provider value={runes}>
                {children}
            </RuneContext.Provider>
        </StructureContext.Provider>
    )
}

export { StructureContextProvider, useStructureContext, useRuneContext }
