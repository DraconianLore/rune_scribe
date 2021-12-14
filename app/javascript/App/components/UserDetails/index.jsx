import React from "react";
import Header from "../common/Header";

export default () => (
  <>
    <Header page={{name: "User Details", pageId: "user"}}/>
    <div style={{ padding: "0 50px" }}>
      <div style={mainPageLayout}>
        <h1>User Details</h1>
        <p>add user details here editable</p>
      </div>
    </div>
    <div style={{ textAlign: "center" }}>Steven Wing ©2021.</div>
  </>
);

const mainPageLayout = {
  display: "flex", 
  justifyContent: "center", 
  alignItems: "center", 
  flexDirection: 'column'
}
