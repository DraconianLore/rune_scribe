import React, { createContext, useContext, useState, useEffect } from "react";
import Cookies from 'js-cookie'
import themes from "../components/common/themes";

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
                    console.log(`%c   Loading Tags...`, theme);
                    setTags(result.tags)
                    console.log(`%cData Load Succeeded.`, theme);
                },
                (error) => {
                    console.error("An error occurred: " + error)
                }
            )
            
        };
        loadStructures()
    }, []);
    function updateData() {
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
                console.log(`%c   updating Tags...`, theme);
                setTags(result.tags)
                console.log(`%cData Updated.`, theme);
            },
            (error) => {
                console.error("An error occurred: " + error)
            }
        )
    }

    return (
        <StructureContext.Provider value={{structures: structures, updateData: updateData}}>
            <RuneContext.Provider value={runes}>
                <TagContext.Provider value={tags}>
                    {children}
                </TagContext.Provider>
            </RuneContext.Provider>
        </StructureContext.Provider>
    )
}

export { StructureContextProvider, useStructureContext, useRuneContext, useTagContext }
