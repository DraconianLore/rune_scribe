import React, { useState } from "react";
import styled from "styled-components";
import { useTagContext } from "../../helpers/StructureContext"




function ItemTagModal(props) {
    const tags = useTagContext() || ''
    const item = props.item
    const tagIds = item.tags.map(i => i.id)
    const [currentTags, setCurrentTags] = useState(tagIds)
    const [tldr, setTldr] = useState(item.tldr || '')
    

    const closeModal = (e) => {
        e.stopPropagation();
        if ((currentTags.toString() != tagIds.toString() || tldr != item.tldr) && confirm("Do you want to save changes?")) {
            saveChanges()
        }
        props.close()
    }
    const saveChanges = () => {
        fetch("/update/" + props.type + '/' + item.id, {
            method: 'PUT',
            headers:  {
                "Content-Type": "application/json",
                "Accept": "application/json"
              },
              body: JSON.stringify({tags: currentTags, tldr: tldr})
        })
        .then(res => res.json())
        .then(result => {
            console.log(result.message)
            props.reload && props.reload()
        })
        .catch(error => {
            console.error('Error: ', error)
        });
    }
    const addTag = (e) => {
        e.stopPropagation();
        setCurrentTags([...currentTags, parseInt(e.currentTarget.id)])
    }
    const removeTag = (e) => {
        e.stopPropagation();
        setCurrentTags(currentTags.filter(tag => tag != parseInt(e.currentTarget.id)))
    }
    const CurrentTagList = () => {
        const currentTagList = tags.filter((tag) => {
            if(currentTags.includes(tag.id)) {
                return tag
            }
        }).map(tag => {
            return(<Tag fgColour={tag.colour} bgColour={tag.background} key={tag.id} id={tag.id} onClick={removeTag} >{tag.name}</Tag>)
        })
        return(
            <TagList>
                {currentTagList}
            </TagList>
        )
    }
    const OtherTagList = () => {
        const addTagList = tags.filter((tag) => {
            if(!currentTags.includes(tag.id)) {
                return tag
            }
        }).map(tag => {
            return(<Tag fgColour={tag.colour} bgColour={tag.background} key={tag.id} id={tag.id} onClick={addTag} >{tag.name}</Tag>)
        })
        return(
            <TagList>
                {addTagList}
            </TagList>
        )
    }
        
    return (
        <ModalContainer  onClick={closeModal}>
            <ItemModal className={item.house || item.dominant} onClick={(e) => e.stopPropagation()}>
                <h1>{item.name}</h1>
                <p>TRLD:</p>
                <TldrEdit value={tldr} onChange={(e) => setTldr(e.target.value)} />
                <p>Current Tags:</p>
                <CurrentTagList />
                <p>Add Tags:</p>
                <OtherTagList />
                <CloseButton onClick={closeModal}><i className="fa fa-times" aria-hidden="true" /></CloseButton>
            </ItemModal>
        </ModalContainer>
    )
}

export default ItemTagModal;

// styling
const ModalContainer = styled.div`
    display: flex;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0,0,0,0.5);
    justify-content: center;
    align-items: center;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 20;
`

const ItemModal = styled.div`
    width: 600px;
    min-height: 350px;
    border-radius: 20px;
    filter: drop-shadow(0px 0px 10px #997);
    padding: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    border-radius: 20px;

    h1 {
        margin: 0;
        text-decoration: underline;
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
    &.None {
        background-color: #223;
        color: #cca;
    }
`

const TagList = styled.div`
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
    width: 90%;
    `
    
    const Tag = styled.p`
    background-color: ${props => props.bgColour};
    color: ${props => props.fgColour};
    margin: 0.1em;
    padding: 0.1em 0.4em;
    border-radius: 5px;
    height: 1.2em;
    cursor: pointer;
    &:hover {
        filter: drop-shadow(0px 0px 5px #cca);
    }
`

const CloseButton = styled.h1`
    position: fixed;
    top: 5px;
    right: 10px;
    cursor: pointer;
    &:hover {
        filter: brightness(150%);
    }
`

const TldrEdit = styled.textarea`
    width: 50%;
    background-color: #223;
    color: #cca;
`
