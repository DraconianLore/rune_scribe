import React from "react";
import styled, { keyframes } from "styled-components";
import { MenuItem, Menu as MenuInner } from "@szhsin/react-menu";
import { menuSelector, menuItemSelector } from "@szhsin/react-menu/style-utils";
import "@szhsin/react-menu/dist/core.css";


export default (props) => (
  <MenuBar>
    <div>
      <Menu menuButton={<h1><i className="fa fa-bars"></i></h1>}>
        <MenuItem>Home</MenuItem>
      </Menu>
    </div>
    <h1>{props.page.name}</h1>
    <div>

      <Menu menuButton={<h1><i className="fa fa-user-circle"></i></h1>}>
        <MenuItem>Settings</MenuItem>
        <MenuItem>Log Out</MenuItem>
      </Menu>
    </div>
  </MenuBar>
);


// Styling

const MenuBar = styled.div`
display: flex;
justify-content: space-between;
align-items: center;
background-color: #333344;
margin: 0;
padding: 0 2em;
color: #aaccff;
font-family: 'Roboto Mono', monospace;
font-weight: 400;
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
    background-color: #555566;
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
