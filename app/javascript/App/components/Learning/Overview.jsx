import React, { useState, useEffect } from "react";
import styled from "styled-components";
import themes from "../common/themes";
import Cookies from 'js-cookie'


const Overview = (props) => {

    const [headers, setHeaders] = useState(null);
    const [tableData, setTableData] = useState(null);

    // Load data for specific number of runes
    useEffect(() => {
        const loadTable = () => {
            fetch(`/learning/overview/${props.numberOfRunes}`)
            .then(res => res.json())
            .then(
                (result) => {
                    setHeaders(result.headers)
                    setTableData(result.tableData)
                },
                (error) => { 
                    console.error("An error occurred: " + error)
                }
            )
        }
        loadTable();
    }, [])

    return(
        <>
            <h1>Overview {props.numberOfRunes} Runes</h1>
            <p>{headers}</p>
        </>
    )
}


export default Overview;

// Styling

