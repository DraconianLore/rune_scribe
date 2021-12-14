import React from "react";
import Header from "../common/Header";


export default () => (
  <>
    <Header page={{name: "Rune Scribe Familiar", pageId: "main"}}/>
    <div style={{ padding: "0 50px" }}>
      <div style={mainPageLayout}>
        <h3>Main page content to go here</h3>
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
