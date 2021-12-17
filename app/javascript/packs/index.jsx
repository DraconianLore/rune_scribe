import React from "react";
import { render } from "react-dom";
import App from "../App";
import { setToLS } from "../App/utils/storage";


const Index = () => {
    setToLS('Theme', "Power") // todo: load data from rails
    return(
      <App />
    )
}

document.addEventListener("DOMContentLoaded", () => {
  render(<Index />, document.body.appendChild(document.createElement("div")));
});

