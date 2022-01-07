import React from "react";
import styled, { keyframes } from "styled-components";
import { Link } from "react-router-dom";
import { MenuItem, Menu as MenuInner } from "@szhsin/react-menu";
import { menuSelector, menuItemSelector } from "@szhsin/react-menu/style-utils";
import "@szhsin/react-menu/dist/core.css";
import themes from "./themes";
import Cookies from 'js-cookie'

export default (props) => (
  <MenuBar>
    <div>
      <Link to="/app"><HomeIcon><i className="fa fa-home"></i></HomeIcon></Link>
    </div>
    <PageHeading>Rune Scribe Familiar</PageHeading>
    <div>
      <Menu menuButton={<h1><i className="fa fa-user-circle"></i></h1>}>
        <MenuItem><Link to="/app/settings">Settings</Link></MenuItem>
        {props.user.is_dm && <MenuItem href="/admin" target='_blank'>Admin Menu</MenuItem>}
        <MenuItem href="/logout">Log Out</MenuItem>
      </Menu>
    </div>
  </MenuBar>
);


// Styling
let currentTheme = themes(Cookies.get('Theme') || 'Mind'); 

const HomeIcon = styled.h1`
  color: ${currentTheme.headerFG};
`
const MenuBar = styled.div`
display: flex;
justify-content: space-between;
align-items: center;
background-color: ${currentTheme.headerBG};
margin: 0;
padding: 0 2em;
color: ${currentTheme.headerFG};
font-family: 'Roboto Mono', monospace;
font-weight: 400;
`

const PageHeading = styled.h1`
  padding: 0 1em;
`

const menuShow = keyframes`
  from {
    opacity: 0;
  }
`;
const menuHide = keyframes`
  to {
    opacity: 0;
  }
`;

const Menu = styled(MenuInner)`
  ${menuSelector.name} {
    font-size: 0.925rem;
    user-select: none;
    box-shadow: 1px 1px 20px 1px rgba(0, 0, 0, 0.1);
    border-radius: 6px;
    padding: 6px;
    min-width: 10rem;
    background-color: #556;
  }
  ${menuSelector.stateOpening} {
    animation: ${menuShow} 0.15s ease-out;
  }

  ${menuSelector.stateClosing} {
    animation: ${menuHide} 0.2s ease-out;
  }

  ${menuItemSelector.name} {
    border-radius: 6px;
    padding: 0.375rem 0.625rem;
  }

  ${menuItemSelector.hover} {
    background-color: #334;
  }
`
