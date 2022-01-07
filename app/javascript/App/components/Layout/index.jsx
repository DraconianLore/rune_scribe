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
      <Page updateData={props.updateData} />
    </MainPageLayout>
    <div style={{ textAlign: "center" }}>Steven Wing ©2021.</div>
  </>
);}

// Styling

let currentTheme = themes(Cookies.get('Theme') || "Mind"); 

const MainPageLayout = styled.div`
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
background-color: ${currentTheme.bodyBG};
color: ${currentTheme.bodyFG};
min-height: 80vh;
`
