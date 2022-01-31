import React, { useState } from "react";
import { useUserContextUpdater } from "../../helpers/UserContext";
import themes from "./themes";
import styled from "styled-components";


const ChooseHouse = () => {
    const [choice, setChoice] = useState({});
    const [follower, setFollower] = useState(null);
    const updateUser = useUserContextUpdater();

    const housePreview = (house) => {
      setChoice({
        name: house,
        text: themes(house).bodyFG,
        background: themes(house).bodyBG,
        border: themes(house).headerBG,
        shadow: themes(house).headerFG,
        info: themes(house).houseInfo
      })
    }
    const confirmSelection = () => {
        console.log('sending update to user')
      updateUser({type: 'house', house: choice.name, follower: follower, theme: choice.name})
    }
  
    return(<ModalCover>
      <HouseModal choice={choice}>
        <h1>House Choice</h1>
        <p>The time has come to choose your house,<br />
        and who you follow in that house.</p>
        <ItemList>
          <House house='Mind' className={choice.name == 'Mind' && 'selected'} onClick={() => housePreview('Mind')}>Mind</House>
          <House house='Power' className={choice.name == 'Power' && 'selected'} onClick={() => housePreview('Power')}>Power</House>
          <House house='Death' className={choice.name == 'Death' && 'selected'} onClick={() => housePreview('Death')}>Death</House>
          <House house='Life' className={choice.name == 'Life' && 'selected'} onClick={() => housePreview('Life')}>Life</House>
        </ItemList>
        <Info className={choice.info && 'show'}>
          <p>{choice.info || ''}</p>
        </Info>
        <ItemList>
          <Follower className={follower == 'Lady' && 'selected'} onClick={() => setFollower('Lady')}>Lady</Follower>
          <Follower className={follower == 'Lord' && 'selected'} onClick={() => setFollower('Lord')}>Lord</Follower>
        </ItemList>
        <Info className={follower && 'show'}>
          <p>{follower == 'Lady' ? 'Followers of the Lady of the house are dedicated to Physical Masteries and as such their Rune Bonus stat is chosen from Strength or Dexterity' : 'Followers of the Lord of the house are dedicated to Spiritual Masteries and as such their Rune Bonus stat is chosen from Wisdom or Intelligence' }</p>
        </Info>
        {choice.info && follower && <ConfirmButton house={choice.name} onClick={confirmSelection}>Confirm</ConfirmButton>}
      </HouseModal>
    </ModalCover>)
  }
  
export default ChooseHouse;

// Styling

const ModalCover = styled.div`
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(0,0,0,0.6);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 22;
`
const HouseModal = styled.div`
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    background-color: ${props => props.choice.background || '#334'};
    color: ${props => props.choice.text || '#cca'};
    width: 400px;
    min-height: 300px;
    z-index: 23;
    filter: drop-shadow(0px 0px 50px ${props => props.choice.shadow || '#cca'});
    border: 5px solid ${props => props.choice.border || '#223'};
    border-radius: 20px;
    padding: 1em;
    h1 {
        margin: 0;
    }
`

const ItemList = styled.div`
    display: flex;
    flex-wrap: true;
    justify-content: space-around;
`
const House = styled.p`
    padding: 0.5em 1em;
    border: 2px ridge ${props => themes(props.house).headerBG};
    color: ${props => themes(props.house).bodyFG};
    background-color: ${props => themes(props.house).bodyBG};
    margin: 0.3em;
    border-radius: 5px;
    cursor: pointer;
    &.selected {
      filter: drop-shadow(0px 0px 5px ${props => themes(props.house).headerFG});
    }
    &:hover {
      filter: brightness(120%)
      &.selected {
        filter: drop-shadow(0px 0px 5px ${props => themes(props.house).headerFG});
      }
    }
`
const Info = styled.div`
    transition: max-height 0.5s linear;
    max-height: 0px;
    overflow: hidden;
    &.show {
      max-height: 5em;
    }
`
const Follower = styled.p`
    padding: 0.5em 1em;
    border: 2px ridge #cca;
    background-color: #333;
    margin: 0.3em;
    border-radius: 5px;
    cursor: pointer;
    &.selected {
      filter: drop-shadow(0px 0px 5px #cca);
      background-color: #555;
    }
    &:hover {
      filter: brightness(120%) drop-shadow(0px 0px 5px #cca);
    }

`

const ConfirmButton = styled.p`
  padding: 0.5em 1em;
  border: 2px ridge ${props => themes(props.house).bodyFG};
  color: ${props => themes(props.house).headerFG};
  background-color: ${props => themes(props.house).headerBG};
  margin: 0.3em;
  border-radius: 5px;
  cursor: pointer;
  &:hover {
    filter: brightness(120%)
  }
`
