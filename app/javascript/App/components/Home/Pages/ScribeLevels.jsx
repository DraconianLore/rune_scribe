import React, { useState } from "react"
import level_helper from '../../../helpers/level_helper'

function level_details(props) {
    
    
    const loadRows = () => {
        let levelRows = [];

        for(let i=1; i <= 20; i++) {
            levelRows.push(level_helper.levelRow(i, props.level, props.house))
        }
        return(
            <>
                {levelRows}
            </>
        )
    }

    return(
        <>
        <h3>Rune Scribe Details</h3>
            <table className='scribe-levels' id='levels'>
                <thead>
                    <tr>
                        <th>Level</th>
                        <th>Proficiency<br />Bonus</th>
                        <th>Features</th>
                        <th>Rune<br />Tracing</th>
                        <th>Max<br />Complexity</th>
                    </tr>
                </thead>
                <tbody>
                    {loadRows()}
                </tbody>
            </table>
            <div id="levelDetails">
                {level_helper.playerFeatures(props.house)}
            </div>
        </>
    );
}



export default level_details
