import React, { useState, useEffect } from "react";
import styled from "styled-components";
import themes from "../common/themes";


const ItemTile = (props) => {

    return(
        <Tile house={props.house} size={props.tileSize}>
            <TileText status={props.status} header={props.header}>{props.header || (props.status === 'not found' ? 'X' : props.status === 'unknown' ? '?' : '✓')}</TileText>
        </Tile>
    )
}


export default ItemTile;


// Styling
const Tile = styled.div`
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: ${props => themes(props.house || 'None').bodyBG};
    color: ${props => themes(props.house || 'None').bodyFG};
    width: ${props => props.tileSize} || auto;
    height: ${props => props.tileSize} || auto;
    border: 1px solid black;
    flex-grow: 1;
    padding: 0.5em 0;
`
const TileText = styled.p`
    ${props => props.header && 'writing-mode: vertical-rl; height: 5em;'} 
`
