import React from "react";
import Header from "../common/Header";
import styled from "styled-components";

export default () => (
  <>
    <Header page={{name: "User Details", pageId: "user"}}/>
    <div style={{ padding: "0 50px" }}>
      <MainPageLayout>
        <p>add user details here editable</p>
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
