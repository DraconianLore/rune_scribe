import React, { useState, useEffect } from "react";
import styled from "styled-components";
import themes from "../common/themes";
import Cookies from "js-cookie";

import ItemTile from "./ItemTile";


const Overview = () => {
    return (<OverviewScreen>
        <SideColumn>
            {'\u00a0' /* filler for correct spacing*/} 
            <TitleGap />
        </SideColumn>
        <OverviewColumn house='Mind'>
            <OverviewItem house='Mind' header>Mind</OverviewItem>
            <ItemTileList house='Mind'>
                <ItemTile house='Mind' status='found' header='Force'></ItemTile>
                <ItemTile house='Mind' status='found' header='Mind'></ItemTile>
                <ItemTile house='Mind' status='found' header='Air'></ItemTile>
                <ItemTile house='Mind' status='found' header='Sight'></ItemTile>
                <ItemTile house='Mind' status='found' header='Fear'></ItemTile>
                <ItemTile house='Mind' status='found' header='Sky'></ItemTile>
                <ItemTile house='Mind' status='found' header='Imagination'></ItemTile>
                {/* <ItemTile house='Mind' status='unknown'></ItemTile>
                <ItemTile house='Mind' status='not found'></ItemTile>
                <ItemTile house='Mind' status='found'></ItemTile>
                <ItemTile house='Mind' status='found'></ItemTile>
                <ItemTile house='Mind' status='found'></ItemTile>
                <ItemTile house='Mind' status='found'></ItemTile> */}
            </ItemTileList>

        </OverviewColumn>
        <OverviewColumn house='Power'>
            <OverviewItem house='Power' header>Power</OverviewItem>
            <ItemTileList house='Power'>
                <ItemTile house='Power' status='found' header='Light'></ItemTile>
                <ItemTile house='Power' status='found' header='Embers'></ItemTile>
                <ItemTile house='Power' status='found' header='Flames'></ItemTile>
                <ItemTile house='Power' status='found' header='Forge'></ItemTile>
                <ItemTile house='Power' status='found' header='Strength'></ItemTile>
                <ItemTile house='Power' status='found' header='Fury'></ItemTile>
                <ItemTile house='Power' status='found' header='Destruction'></ItemTile>
            </ItemTileList>
        </OverviewColumn>
        <OverviewColumn house='Death'>
            <OverviewItem house='Death' header>Death</OverviewItem>
            <ItemTileList house='Death'>
                <ItemTile house='Death' status='found' header='Protection'></ItemTile>
                <ItemTile house='Death' status='found' header='Death'></ItemTile>
                <ItemTile house='Death' status='found' header='Earth'></ItemTile>
                <ItemTile house='Death' status='found' header='Mountains'></ItemTile>
                <ItemTile house='Death' status='found' header='Stone'></ItemTile>
                <ItemTile house='Death' status='found' header='Ore'></ItemTile>
                <ItemTile house='Death' status='found' header='Oblivion'></ItemTile>
            </ItemTileList>
        </OverviewColumn>
        <OverviewColumn house='Life'>
            <OverviewItem house='Life' header>Life</OverviewItem>
            <ItemTileList house='Life'>
                <ItemTile house='Life' status='found' header='Life'></ItemTile>
                <ItemTile house='Life' status='found' header='Water'></ItemTile>
                <ItemTile house='Life' status='found' header='Leaves'></ItemTile>
                <ItemTile house='Life' status='found' header='Depth'></ItemTile>
                <ItemTile house='Life' status='found' header='Frost'></ItemTile>
                <ItemTile house='Life' status='found' header='Waves'></ItemTile>
                <ItemTile house='Life' status='found' header='Rebirth'></ItemTile>
            </ItemTileList>
        </OverviewColumn>
    </OverviewScreen>)
}


export default Overview

// Styling
let currentTheme = themes(Cookies.get('Theme') || 'Mind'); 

const OverviewScreen = styled.div`
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    justify-content: center;
    width: 100%;
    padding: 1em;
    `
const SideColumn = styled.div`
    width: 5em;
    font-size: 200%;
    background-color: ${currentTheme.headerBG};
    border: 1px solid black;
    border-radius: 50% 0 0 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    flex-shrink: 0;
`    
const TitleGap = styled.p`
    height: 5em;
    font-size: 50%;
    padding: 0.5em 0;
    margin: 0;
    border-bottom: 1px solid black;
`

const OverviewColumn = styled.div`
    flex-grow: 1;
    background-color: ${props => themes(props.house || 'None').headerBG};
    color: ${props => themes(props.house || 'None').headerFG};
    cursor: pointer;
    border: 1px solid black;
    `
    
const OverviewItem = styled.div`
    font-size: ${props => props.header ? '200%' : '100%'};
`
const ItemTileList = styled.div`
    display: flex;
    flex-direction: row;
    justify-content: flex-end;
    background-color: ${props => themes(props.house || 'None').bodyBG};
`
