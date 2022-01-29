import React, { useState } from "react"
import styled from "styled-components";
import { useTagContext } from '../../../helpers/StructureContext'
import themes from "../../common/themes";
import { HexColorPicker } from "react-colorful";


function Tags() {
    const tags = useTagContext() || ''
    const [search, setSearch] = useState(null)
    const [showModal, setShowModal] = useState(false)
    const [currentTag, setCurrentTag] = useState(null)
    const [tagPreviewFG, setTagPreviewFG] = useState(null)
    const [tagPreviewBG, setTagPreviewBG] = useState(null)
    const [tagPreviewName, setTagPreviewName] = useState('')
    const [textPicker, setTextPicker] = useState(false)
    const [backgroundPicker, setBackgroundPicker] = useState(false)
    
    const deleteTag = (tag) => {
        if (window.confirm("Are you sure you want to delete this structure for all users?")) {
            fetch('/delete_tag/' + tag, {
                method: 'PUT',
                headers: {
                    "Content-Type": "application/json",
                    "Accept": "application/json"
                }
            })
            .then(res => res.json())
            .then(result => {
                console.warn(result.message)
            })
            .catch(error => {
                console.error('Error: ', error)
            });
        }
    }

    const closeModal = () => {
        setShowModal(false)
        setCurrentTag(null)
    }

    const saveChanges = () => {
        const tagData = {
            tag: {
                name: tagPreviewName,
                colour: tagPreviewFG,
                background: tagPreviewBG
            }
        }
        if (currentTag) {
            // Update Tag
            fetch('/update_tag/' + currentTag.id, {
                method: 'PUT',
                headers: {
                    "Content-Type": "application/json",
                    "Accept": "application/json"
                },
                body: JSON.stringify(tagData)
            })
            .then(res => res.json())
            .then(result => {
                console.log(result.message)
                closeModal()
            })
            .catch(error => {
                console.error('Error: ', error)
            });
        } else {
            // New Tag
            fetch('/create_tag', {
                method: 'POST',
                headers: {
                    "Content-Type": "application/json",
                    "Accept": "application/json"
                },
                body: JSON.stringify(tagData)
            })
            .then(res => res.json())
            .then(result => {
                console.log(result.message)
                closeModal()
            })
            .catch(error => {
                console.error('Error: ', error)
            });
        }

    }

    const editTag = (tag) => {
        setTagPreviewFG(tag.colour || '#CCC')
        setTagPreviewBG(tag.background || '#444')
        setTagPreviewName(tag.name || 'New Tag')
        tag.id && setCurrentTag(tag)
        setShowModal(true)
        setTextPicker(false)
        setBackgroundPicker(false)
    }
    
    const tagRow = (tag) => {
        return(
                <tr className='tag-row' key={tag.id} data-name={tag.name}>
                    <Mind><Tag fgColour={tag.colour} bgColour={tag.background}>{tag.name}</Tag></Mind>
                    <Power><Tag fgColour={tag.colour} bgColour={tag.background}>{tag.name}</Tag></Power>
                    <Death><Tag fgColour={tag.colour} bgColour={tag.background}>{tag.name}</Tag></Death>
                    <Life><Tag fgColour={tag.colour} bgColour={tag.background}>{tag.name}</Tag></Life>
                    <ButtonTD><i className="fas fa-feather-alt" onClick={() => editTag(tag)} title='Edit'></i><i className="fas fa-trash-alt" onClick={() => deleteTag(tag.id)} title='Delete'></i></ButtonTD>
                </tr>
        )
    }
    const populateRows = tags.filter((data) => {
        if(search == null) {
            return data
        }
        else if(data.name.toLowerCase().includes(search.toLowerCase())) {
            return data
        }
    }).map(data => {
        return(tagRow((data)))
    })

    
    
    return(
        <>
            <TagHeader><input type='text' id='tag-filter' placeholder='Filter' onChange={(e) => setSearch(e.target.value)}></input><h3>Tags</h3><TagRight><i className="fas fa-plus-square" onClick={editTag} title='New Tag'></i></TagRight></TagHeader>
            <PageDescription>This page shows how each tag looks in each theme.<br /><em><small>Note: tags are shared between all users.</small></em></PageDescription>
            <table id='tag-table'>
                <thead>
                    <tr>
                        <th>Mind</th>
                        <th>Power</th>
                        <th>Death</th>
                        <th>Life</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tbody>
                    {populateRows}
                </tbody>
            </table>
            {showModal && <TagModal>
                <TagModalContent>
                    <p>
                        Tag Name: <input type='text' key='tagName' value={tagPreviewName} onChange={(e) => setTagPreviewName(e.target.value)} />
                    </p>
                    <p>
                        BG Colour: <ColourButton id='bgColour' bg={tagPreviewBG} onClick={() => setBackgroundPicker(!backgroundPicker)}>{tagPreviewBG}</ColourButton>
                    </p>
                    <p>
                        Text Colour: <ColourButton id='fgColour' fg={tagPreviewFG} onClick={() => setTextPicker(!textPicker)}>{tagPreviewFG}</ColourButton>
                    </p>
                    <ActionButtons>
                        <UpdateButton onClick={saveChanges}>Save Tag</UpdateButton>
                        <CancelButton onClick={closeModal}>Cancel</CancelButton>
                    </ActionButtons>
                    <hr />
                    <small>Preview:</small>
                    <TagPreview fgColour={tagPreviewFG} bgColour={tagPreviewBG}>{tagPreviewName}</TagPreview>
                </TagModalContent>
                {backgroundPicker && <ColourPicker><span>Background</span><HexColorPicker color={tagPreviewBG || '#fff'} onChange={setTagPreviewBG}/></ColourPicker>}
                {textPicker && <ColourPicker left={true}><span>Text</span><HexColorPicker color={tagPreviewFG || '#fff'} onChange={setTagPreviewFG} /></ColourPicker>}
            </TagModal>}
        </>
    )


}

export default Tags

// Styling

const TagHeader = styled.div`
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    height: 50px;
    background-color: rgba(255, 255, 255, 0.1);
    max-width: calc(800px + 6em);
    margin-top: 0.5em;
    border-radius: 10px;
    input {
        width: 100px;
        margin-left: 10px;
    }
    i {
        margin-right: 10px;
    }

`
const TagRight = styled.h3`
    width: 100px;
    i {
        cursor: pointer;
        float: right;
        font-size: 150%;
    }
`

const PageDescription = styled.p`
    margin-bottom: 0;
`

const Tag = styled.p`
    background-color: ${props => props.bgColour};
    color: ${props => props.fgColour};
    margin: 0.1em auto;
    padding: 0.1em 0.4em;
    border-radius: 5px;
    height: 1.2em;
    width: fit-content;
`

const Mind = styled.td`
    background-color: ${themes('Mind').bodyBG}
`
const Power = styled.td`
    background-color: ${themes('Power').bodyBG}
`
const Death = styled.td`
    background-color: ${themes('Death').bodyBG}
`
const Life = styled.td`
    background-color: ${themes('Life').bodyBG}
`

const ButtonTD = styled.td`
    i {
        cursor: pointer;
        margin: 0 0.5em;
    }
`

const TagModal = styled.div`
    display: flex;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0,0,0,0.5);
    justify-content: center;
    align-items: center;
    position: fixed;
    top: 0;
    left: 0;
`
const TagModalContent = styled.div`
    width: 300px;
    height: 200px;
    background-color: #223;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    border-radius: 20px;
    margin-top: -30%;
    filter: drop-shadow(0px 0px 10px #997);
    padding: 10px;
    p {
        margin: 5px;
        text-align: left;
        input {
            width: 50px;
        }
    }
    hr {
        width: 75%;
        margin-top: 1em;
    }
`

const ColourButton = styled.button`
    color: ${props => props.fg || 'inherit'};
    background-color: ${props => props.bg || 'inherit'};
    border-color: #556;
    cursor: pointer;
`

const ActionButtons = styled.div`
    display: flex;
    justify-content: space-around;
    width: 100%;
`

const UpdateButton = styled.p`
    cursor: pointer;
    background-color: #141;
    padding: 5px 10px;
    border-radius: 5px;
    &:hover {
        background-color: #252;
        font-weight: 700;
    }
`

const CancelButton = styled.p`
    cursor: pointer;
    background-color: #411;
    padding: 5px 10px;
    border-radius: 5px;
    &:hover {
        background-color: #522;
        font-weight: 700;
    }
`

const ColourPicker = styled.div`
    position: fixed;
    top: calc(50vh - 330px);
    left: calc(50vw ${props => props.left ? '- 375px' : '+ 180px'});
    z-index: 2;
    display: flex;
    flex-direction: column;
    align-items: center;
    span {
        background-color: rgba(255,255,255,0.3);
        padding: 0 10px;
        border-radius: 5px 5px 0 0;
    }
`

const TagPreview = styled.p`
    background-color: ${props => props.bgColour};
    color: ${props => props.fgColour};
    margin: 0.1em;
    padding: 0.1em 0.4em;
    border-radius: 5px;
    height: 1.2em;
`
