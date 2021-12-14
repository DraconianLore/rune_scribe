import React from "react";



export default (props) => (
  <div style={MenuBar}>
    <h1><i className="fa fa-bars"></i></h1>
    <h1>{props.page.name}</h1>
    <h1><i className="fa fa-user-circle"></i></h1>
  </div>
);


// Styling

const MenuBar = {
  display: "flex",
  justifyContent: "space-between",
  alignItems: "center",
  backgroundColor: "#333344",
  margin: "0",
  padding: "0 2em",
  color: "#aaccff",
  fontFamily: "'Roboto Mono', monospace",
  fontWeight: "400"
}
