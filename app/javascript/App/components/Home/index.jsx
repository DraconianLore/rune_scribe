import React from "react";
import Header from "../common/Header";
import styled from "styled-components";


export default () => (
  <>
    <Header page={{name: "Rune Scribe Familiar", pageId: "main"}}/>
    <div style={{ padding: "0 50px" }}>
      <MainPageLayout>
        <h3>Main page content to go here</h3>
      </MainPageLayout>
    </div>
    <div style={{ textAlign: "center" }}>Steven Wing ©2021.</div>
  </>
);

const MainPageLayout = styled.div`
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
color: #cce;
min-height: 80vh;
`
