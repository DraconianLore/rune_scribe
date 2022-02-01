import React from "react";
import styled from "styled-components";
import themes from "../common/themes";
import Cookies from 'js-cookie';
import Header from "../common/Header";
import { useUserContextState } from "../../helpers/UserContext";


export default (props) => {
  let Page = props.page
  const user = useUserContextState() || ''

  return (
  <>
    <Header user={user} />
    <MainPageLayout>
      <Page />
    </MainPageLayout>
    <div style={{ textAlign: "center", paddingTop: '5px' }}>Steven Wing ©2021.</div>
  </>
);}

// Styling

let currentTheme = themes(Cookies.get('Theme') || "Mind"); 

const MainPageLayout = styled.div`
display: flex;
justify-content: flex-start;
align-items: center;
flex-direction: column;
background-color: ${currentTheme.bodyBG};
color: ${currentTheme.bodyFG};
min-height: 85vh;
`
