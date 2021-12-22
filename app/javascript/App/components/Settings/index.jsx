import React from "react";
import { setToLS } from "../../utils/storage";

const changeTheme = (theme) => {
  setToLS("Theme", theme)
}
export default () => (
  <>
    <h1>Change Theme</h1>
    <div className="themes">
      <div className="theme mind" onClick={() => changeTheme("Mind")}>Mind</div>
      <div className="theme power" onClick={() => changeTheme("Power")}>Power</div>
      <div className="theme death" onClick={() => changeTheme("Death")}>Death</div>
      <div className="theme life" onClick={() => changeTheme("Life")}>Life</div>
    </div>
  </>
);

// Styling

