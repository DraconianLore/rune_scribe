import React, { useState } from "react";
import styled from "styled-components";
import { useTagContext, useStructureContext} from "../../helpers/StructureContext"




function ItemTagModal(props) {
    const {updateData} = useStructureContext()
    const tags = useTagContext() || ''
    const item = props.item
    const tagIds = item.tags.map(i => i.id)
    const [currentTags, setCurrentTags] = useState(tagIds)
    

    const closeModal = (e) => {
        e.stopPropagation();
        if (currentTags.toString() != tagIds.toString() && confirm("Do you want to save changes?")) {
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
              body: JSON.stringify({tags: currentTags})
        })
        .then(res => res.json())
        .then(result => {
            console.log(result.message)
            updateData()
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
            <ItemModal className={item.house || item.dominant}>
                <h1>{item.name}</h1>
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
