import React from "react";
import themes from "../common/themes";
import styled from "styled-components";
import Cookies from "js-cookie"

const changeTheme = (theme) => {
  Cookies.set('Theme', theme, { sameSite: 'Lax'})
  window.location.reload(false);

}
export default () => (
  <>
    <h2>Settings</h2>
    <SettingsPage>
      <SettingsSection>
        <h1>Change Theme</h1>
        <Themes>
          <Theme className="themes mind" onClick={() => changeTheme("Mind")}>Mind</Theme>
          <Theme className="themes power" onClick={() => changeTheme("Power")}>Power</Theme>
          <Theme className="themes death" onClick={() => changeTheme("Death")}>Death</Theme>
          <Theme className="themes life" onClick={() => changeTheme("Life")}>Life</Theme>
        </Themes>
      </SettingsSection>
    </SettingsPage>
  </>
);


// Styling

const currentTheme = themes(Cookies.get('Theme') || 'Mind'); 

const SettingsPage = styled.div`
display: flex;
flex-wrap: wrap;
justify-content: space-between;
align-items: flex-start;
height: 70vh;
`
const SettingsSection = styled.div`
  max-width: 600px;
  text-align: center;
  border-radius: 20px;
  border-style: ridge;
  border: ridge 4px ${currentTheme.bodyFG};
  margin: 1em;
  padding: 0.5em;
  background-color: ${currentTheme.headerBG};
  color: ${currentTheme.headerFG};
`

const Themes = styled.div`
  display: flex;
  max-width: 100%;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
`

const Theme = styled.div`
  width: 80px;
  font-size: 120%;
  font-weight: 700;
  padding: 2px 10px;
  margin: 0.5em;
  text-align: center;
  border-radius: 20px;
  border-style: outset;
  cursor: pointer;
`
