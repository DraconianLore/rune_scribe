import React from "react";
import Header from "../common/Header";
import styled from "styled-components";
import themes from "../common/themes";
import { getFromLS } from "../../utils/storage";


export default (props) => {
  let Page = props.page
  return (
  <>
    <Header />
    <MainPageLayout>
      <Page />
    </MainPageLayout>
    <div style={{ textAlign: "center" }}>Steven Wing ©2021.</div>
  </>
);}

const checkThemes = () => {
  return themes(getFromLS('Theme'))
}

// Styling

let currentTheme = checkThemes(); 


const MainPageLayout = styled.div`
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
background-color: ${currentTheme.bodyBG};
color: ${currentTheme.bodyFG};
min-height: 80vh;
`
