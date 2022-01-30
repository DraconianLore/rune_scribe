import React, { useState, useEffect } from "react";
import styled from "styled-components";
import { useStructureContext } from "../../helpers/StructureContext";
import { useUserContextState } from "../../helpers/UserContext";
import ItemTagModal from "./ItemTags";
import themes from "./themes";

const tags = (tags) => {
    
    const tagList = tags.map((tag, i) => {
        return(<Tag fgColour={tag.colour} bgColour={tag.background} key={i}>{tag.name}</Tag>)
    })
    return tagList
}

const findDuration = (trace) => {
    // For halving the duration for bonus actions
    let duration = trace
    const words = trace.replace(/[0-9]/g, '');
    const numbers = trace.match(/\d/g);
    if (trace != 'Instant') {
        switch (words) {
            case ' Rounds':
            case ' Seconds':
            case ' Minutes':
            case ' Hours':
                const halved = Math.ceil(numbers / 2)
                const proper_word = halved == 1 ? words.slice(0, -1) : words;
                duration = halved + proper_word
                break;
            case ' Round':
            case ' Second':
                duration = trace
                break
            case ' Minute':
                duration = '30 Seconds'
                break
            case ' Hour':
                duration = '30 Minutes'
                break
            default:
                duration = 'Half of ' + trace
                break;
        }
    }
    return duration
}

function ModalContent(props) {
    return (
        <RuneModal>
            <div>
                <h1>{props.rune.name}</h1>
                <RuneDetails>{props.rune.description}</RuneDetails>
                <span>Targets: {props.rune.target.join(', ')}</span>
            </div>
            <small>Click to edit tags</small>
        </RuneModal>
    )
}

const HoverModal = (props) => {
    const width = window.innerWidth
    const height = window.innerHeight
    const [mousePos, setMousePos] = useState({x: height/2, y: width/2})
    const [modalOffset, setModalOffset] = useState('')
    const [modalOffsetY, setModalOffsetY] = useState(false)
    const [visible, setVisible] = useState(false)
    
    useEffect(() => {
        // get mouse position for modal placement
        const setFromEvent = (e) => setMousePos({ x: e.clientX, y: e.clientY });
        window.addEventListener("mousemove", setFromEvent);
        setVisible(true)
    
        return () => {
          window.removeEventListener("mousemove", setFromEvent);
        };
      }, []);

    useEffect(() => {
        // check if modal is out of view and set borders
        const right = width - 350;
        const left = 350;
        const bottom = height - 400;
        if (mousePos.x < left) {
            setModalOffset('left')
        } else if (mousePos.x > right) {
            setModalOffset('right')
        } else {
            setModalOffset('')
        }
        if (mousePos.y > bottom) {
            setModalOffsetY(true)
        } else {
            setModalOffsetY(false)
        }
    
    }, [mousePos, width, height]);

    return(
        <>
        {visible && <ModalContainer className={props.rune.house} style={{top: modalOffsetY ? mousePos.y - 400 : mousePos.y + 50, left: modalOffset == 'left' ? '50px' : modalOffset == 'right' ? 'calc(100vw - 650px)' : mousePos.x - 300}}>
                <ModalContent rune={props.rune} />
            </ModalContainer>}
        </>
    )
}


function Rune(props) {
    const user = useUserContextState() || ''
    const [showModal, setShowModal] = useState(false)
    const [showTagModal, setShowTagModal] = useState(false)
    const [fav, setFav] = useState(props.rune.fav_by.includes(user.id.toString()))
    const tagList = tags(props.rune.tags)
    const {updateData} = useStructureContext()


    const toggleFavourite = (e) => {
        e.stopPropagation();
        fetch("/fav/r/" + props.rune.id, {
            method: 'PUT',
            headers:  {
                "Content-Type": "application/json",
                "Accept": "application/json"
              },
              body: JSON.stringify({newUser: user.id})
        })
        .then(res => res.json())
        .then(result => {
            if (result.change === 'add') {
                setFav(true)
            } else {
                setFav(false)
            }
            updateData({tpye: 'favourite'})
        })
    }

    const clickRune = () => {
        setShowModal(false)
        setShowTagModal(true)
    }
    const closeTagModal = () => {
        setShowTagModal(false)
    }
    const openModal = () => {
        setShowModal(true)
    }
    const closeModal = () => {
        setShowModal(false)
    }
    // non house runes have halved duration when used as a bonus action
    const duration =  props.bonusAction ? user.house == props.rune.house ? props.rune.trace : findDuration(props.rune.trace) : props.rune.trace;

    return (
        <>
            <RuneItem className={props.rune.house} data-description={props.rune.description} onClick={clickRune}  onMouseLeave={closeModal} onMouseEnter={openModal} >
                <TopBar>
                    <h3 />
                    <h2>{props.rune.name}</h2>
                    <Favourite className={fav ? 'fav' : 'not-fav'} onClick={toggleFavourite}><i className="fas fa-heart" /></Favourite>
                </TopBar>
                <hr />
                <Tags>
                    {tagList}
                </Tags>
                <small>{duration}</small>
            </RuneItem>
            {showModal && <HoverModal rune={props.rune} />}
            {showTagModal && <ItemTagModal item={props.rune} close={closeTagModal} type='rune' reload={props.reload || null} />}
        </>
    )
}

export default Rune;

// styling
const Tags = styled.div`
    display: flex;
    flex-wrap: wrap;
    padding: 0 0.5em;
    height: 95px;
`
const Tag = styled.p`
    background-color: ${props => props.bgColour};
    color: ${props => props.fgColour};
    margin: 0.1em;
    padding: 0.1em 0.4em;
    border-radius: 5px;
    height: 1.2em;
`

const RuneItem = styled.div`
    width: 300px;
    height: 175px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    background-color: #223;
    margin: 0.5em;
    cursor: pointer;
    h2 {
        margin: 0.5em;
    }
    hr {
        width: 90%;
        margin-top: 0;
    }
    small {
        
    }
    &.Mind {
        background-color: ${themes('Mind').bodyBG};
        color: ${themes('Mind').bodyFG};
        h3 {
            background-color: ${themes('Mind').headerBG};
           color: ${themes('Mind').headerFG};
        }
    }
    &.Power {
        background-color: ${themes('Power').bodyBG};
        color: ${themes('Power').bodyFG};
        h3 {
            background-color: ${themes('Power').headerBG};
           color: ${themes('Power').headerFG};
        }
    }
    &.Death {
        background-color: ${themes('Death').bodyBG};
        color: ${themes('Death').bodyFG};
        h3 {
            background-color: ${themes('Death').headerBG};
           color: ${themes('Death').headerFG};
        }
    }
    &.Life {
        background-color: ${themes('Life').bodyBG};
        color: ${themes('Life').bodyFG};
        h3 {
            background-color: ${themes('Life').headerBG};
           color: ${themes('Life').headerFG};
        }
    }
    &.strained {
        filter: drop-shadow(0px 0px 5px #f33);
    }
`

const ModalContainer = styled.div`
    position: fixed;
    width: 600px;
    min-height: 350px;
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
`

const RuneModal = styled.div`
    width: 600px;
    min-height: 350px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    `
    
const RuneDetails = styled.p`
    white-space: pre-line;
    margin: 1em;
    text-align: left;
`

const TopBar = styled.div`
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    flex-direction: row;
    h3 {
        width: 16px;
    }
`

const Favourite = styled.h3`
    padding: 5px 10px;
    border-radius: 0 0 0 10px;
    margin: 0;
    &.not-fav i {
        color: rgba(0,0,0,0.6);
    }
`
