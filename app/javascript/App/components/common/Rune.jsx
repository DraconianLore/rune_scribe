import React from "react";
import styled from "styled-components";
import { useUserContextState } from "../../helpers/UserContext";

const tags = (tags) => {
    
    let tagList = [];
    for (let i = 0; i < tags.length; i++) {
        tagList.push(<Tag fgColour={tags[i].colour} bgColour={tags[i].background} key={i}>{tags[i].name}</Tag>)
    }
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

function Rune(props) {
    const user = useUserContextState() || ''
    
    const tagList = tags(props.rune.tags)

    // non house runes have halved duration when used as a bonus action
    const duration =  props.bonusAction ? user.house == props.rune.house ? props.rune.trace : findDuration(props.rune.trace) : props.rune.trace;

    return (
        <RuneItem className={props.rune.house} data-description={props.rune.description}>
            <h2>{props.rune.name}</h2>
            <hr />
            <Tags>
                {tagList}
            </Tags>
            <small>{duration}</small>
        </RuneItem>
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
        background-color: #112;
        color: #9be;
        // p {
        //     background-color: #334;
        //     color: #acf;
        // }
    }
    &.Power {
        background-color: #310;
        color: #c84;
        // p {
        //     background-color: #530;
        //     color: #d95;
        // }
    }
    &.Death {
        background-color: #213;
        color: #bad;
        // p {
        //     background-color: #324;
        //     color: #a9c;
        // }
    }
    &.Life {
        background-color: #121;
        color: #beb;
        // p {
        //     background-color: #343;
        //     color: #cfc;
        // }
    }
    &.None {
        
    }
    &.strained {
        filter: drop-shadow(0px 0px 5px #f33);
    }
`
