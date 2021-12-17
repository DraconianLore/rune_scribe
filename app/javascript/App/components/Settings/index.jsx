import React from "react";
import Header from "../common/Header";
import styled from "styled-components";
import themes from "../common/themes";
import { getFromLS } from "../../utils/storage";

export default () => (
  <>
    <Header page={{name: "Settings", pageId: "settings"}}/>
    <MainPageLayout>
    <p>add user settings here editable</p>
    </MainPageLayout>
    <div style={{ textAlign: "center" }}>Steven Wing ©2021.</div>
  </>
);

// Styling
let currentTheme = themes(getFromLS('Theme')); 

const MainPageLayout = styled.div`
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
background-color: ${currentTheme.bodyBG};
color: ${currentTheme.bodyFG};
min-height: 80vh;
`
