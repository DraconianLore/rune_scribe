import React from "react";
import { useUserContextState } from "../../helpers/UserContext";
import level_helper from "../../helpers/level_helper";
import styled from "styled-components";
import Structure from "./Structure";

const Notification = (props) => {
    const user = useUserContextState() || ''

    const acknowledge = () => {
        props.closeNotification()
    }

    if(props.notificationData == 'Level Change') {
        const levelInfo = level_helper.newLevelDetails(user.level, user.house)
        let levelFeats = []


        if (levelInfo.levelFeats.length > 0) {
            levelInfo.levelFeats.forEach(feat => {
                levelFeats.push(<Feat className={feat.house}><h3>{feat.name}</h3>{feat.description}</Feat>)                
            });
        }
        return(
                <NotificationLayout>
                    <NewLevel>
                        <h1>You Levelled Up!</h1>
                        <TopBar>
                            <h2>Your are now level {user.level}</h2>
                            <p><strong>Proficiency Bonus:</strong> {levelInfo.levelDetails.prof}<br />
                            <strong>Max Complexity:</strong> {levelInfo.levelDetails.complexity}<br />
                            <strong>Rune Tracing:</strong> {levelInfo.levelDetails.tracing} Rune{levelInfo.levelDetails.tracing != 1 && 's'}</p>
                        </TopBar>
                        {levelFeats.length > 0 && <Feats>
                            <h2>You also gain:</h2>
                            {levelFeats }
                        </Feats>}

                        <OkButton onClick={acknowledge}>Acknowledge</OkButton>
                    </NewLevel>
                </NotificationLayout>
        )
    } else if(props.notificationData.type == 'other') {
        return(

            <NotificationLayout>
                <DmMessage>
                    <h1>{props.notificationData.title}</h1>
                    <pre>{props.notificationData.body}</pre>
                    <OkButton onClick={acknowledge}>Acknowledge</OkButton>
                </DmMessage>
            </NotificationLayout>
        )
    } else if(props.notificationData.type == 'structure') {
        const structure = props.notificationData.structure
        return(
            <NotificationLayout>
                <NewStructure>
                    <CloseButton  onClick={acknowledge}>X</CloseButton>
                    <h1>New Structure Unlocked</h1>
                    <StructureModal>
                        <ModalContainer className={structure.dominant, structure.strained ? 'strained' : ''} >
                            <h1>{structure.name}</h1>
                            <StructureDetails>{structure.description}</StructureDetails>
                            <span>Targets: {structure.target.join(', ')}</span>
                            {structure.strained && <em><Strained>Strained Structure</Strained></em>}
                        </ModalContainer>
                    </StructureModal>
                </NewStructure>
            </NotificationLayout>
        )
    } else {
        return(<></>)
    }

}


export default Notification;

// Styling
const NotificationLayout = styled.div`
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0,0,0,0.6);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 30;
`

const NewLevel = styled.div`
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    background-color: #334;
    width: 600px;
    min-height: 400px;
    z-index: 31;
    filter: drop-shadow(0px 0px 50px #cca);
    border: 5px solid #223;
    border-radius: 20px;
    padding: 1em;
    h1 {
        margin-top: 0;
    }
`
const NewStructure = styled.div`
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    background-color: #334;
    width: 700px;
    min-height: 400px;
    z-index: 31;
    filter: drop-shadow(0px 0px 50px #cca);
    border: 5px solid #223;
    border-radius: 20px;
    padding: 1em;
    h1 {
        margin-top: 0;
    }
`

const DmMessage = styled.div`
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    justify-content: flex-start;
    background-color: #433;
    width: 600px;
    min-height: 200px;
    z-index: 31;
    filter: drop-shadow(0px 0px 50px #300);
    border: 5px solid #322;
    border-radius: 20px;
    padding: 1em;
    h1 {
        margin: 0;
    }
    pre {
        width: 90%;
        white-space: pre-wrap;
    }
`

const TopBar = styled.div`
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    width: 90%;
`

const Feats = styled.div`
    text-align: center;
    h3, p {
        margin: 0.2em;
    }
`

const Feat = styled.div`
    margin-bottom: 1em;
    padding: 5px;
    background-color: #223;
    border-radius: 10px;
    &.Mind {
        color: #9be
    }
    &.Power {
        color: #c84
    }
    &.Death {
        color: #a9c
    }
    &.Life {
        color: #beb
    }
`

const OkButton = styled.h3`
    padding: 10px 20px;
    background-color: #262;
    margin-top: 3em;
    cursor: pointer;
    border-radius: 5px;
    &:hover {
        background-color: #2a2;
        color: #ffc;
    }
`
const ModalContainer = styled.div`
    position: fixed;
    width: 600px;
    height: 350px;
    background-color: #223;
    z-index: 20;
    filter: drop-shadow(0px 0px 5px #cca);
    text-align: center;
    border-radius: 5px;
    h1 {
        margin-top: 10px;
    }
    &.Mind {
        background-color: #112;
        color: #9be;
    }
    &.Power {
        background-color: #310;
        color: #c84;
    }
    &.Death {
        background-color: #213;
        color: #bad;
    }
    &.Life {
        background-color: #121;
        color: #beb;
    }
    &.strained {
        filter: drop-shadow(0px 0px 5px #f33);
    }
    overflow: scroll;
    ::-webkit-scrollbar {
        display: none;
      }
    -ms-overflow-style: none;  /* IE and Edge */
    scrollbar-width: none;  /* Firefox */

`


const StructureModal = styled.div`
    width: 600px;
    height: 350px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    margin-bottom: 2em;
`
    
const StructureDetails = styled.p`
    white-space: pre-line;
    margin: 1em;
    text-align: left;
`

const Strained = styled.h3`
    color: #c22;
`

const CloseButton = styled.h2`
    position: fixed;
    top: -0.5em;
    right: 0.5em;
    cursor: pointer;
    background-color: rgba(0, 0, 0,0.1);
    padding: 0.2em 0.3em;
    border-radius: 40%;
    &:hover {
        color: #ffffc5;
    }
`
