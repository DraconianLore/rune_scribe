import React, { useState } from "react"
import level_helper from '../../helpers/level_helper'

function level_details(props) {
    

    return(
        <>
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
                    {/* level 1 */}
                    <tr className={props.level === 1 ? 'current_level' : ''}>
                        <td>1st</td>
                        <td>+2</td>
                        <td>{level_helper.levelFeats(1, 'None')}</td>
                        <td>0</td>
                        <td>Single Rune</td>
                    </tr>
                    {/* level 2 */}
                    <tr className={props.level === 2 ? 'current_level' : ''}>
                        <td>2nd</td>
                        <td>+2</td>
                        <td>{level_helper.levelFeats(2, props.house)}</td>
                        <td>1</td>
                        <td>Single Rune</td>
                    </tr>
                    {/* level 3 */}
                    <tr className={props.level === 3 ? 'current_level' : ''}>
                        <td>3rd</td>
                        <td>+2</td>
                        <td>{level_helper.levelFeats(3, props.house)}</td>
                        <td>1</td>
                        <td>2 Runes</td>
                    </tr>
                    {/* level 4 */}
                    <tr className={props.level === 4 ? 'current_level' : ''}>
                        <td>4th</td>
                        <td>+2</td>
                        <td>{level_helper.levelFeats(4, props.house)}</td>
                        <td>2</td>
                        <td>2 Runes</td>
                    </tr>
                    {/* level 5 */}
                    <tr className={props.level === 5 ? 'current_level' : ''}>
                        <td>5th</td>
                        <td>+3</td>
                        <td>{level_helper.levelFeats(5, props.house)}</td>
                        <td>2</td>
                        <td>2 Runes</td>
                    </tr>
                    {/* level 6 */}
                    <tr className={props.level === 6 ? 'current_level' : ''}>
                        <td>6th</td>
                        <td>+3</td>
                        <td>{level_helper.levelFeats(6, props.house)}</td>
                        <td>2</td>
                        <td>4 Runes</td>
                    </tr>
                    {/* level 7 */}
                    <tr className={props.level === 7 ? 'current_level' : ''}>
                        <td>7th</td>
                        <td>+3</td>
                        <td>{level_helper.levelFeats(7, props.house)}</td>
                        <td>4</td>
                        <td>4 Runes</td>
                    </tr>
                    {/* level 8 */}
                    <tr className={props.level === 8 ? 'current_level' : ''}>
                        <td>8th</td>
                        <td>+3</td>
                        <td>{level_helper.levelFeats(8, props.house)}</td>
                        <td>4</td>
                        <td>4 Runes</td>
                    </tr>
                    {/* level 9 */}
                    <tr className={props.level === 9 ? 'current_level' : ''}>
                        <td>9th</td>
                        <td>+4</td>
                        <td>{level_helper.levelFeats(9, props.house)}</td>
                        <td>4</td>
                        <td>4 Runes</td>
                    </tr>
                    {/* level 10 */}
                    <tr className={props.level === 10 ? 'current_level' : ''}>
                        <td>10th</td>
                        <td>+4</td>
                        <td>{level_helper.levelFeats(10, props.house)}</td>
                        <td>4</td>
                        <td>8 Runes</td>
                    </tr>
                    {/* level 11 */}
                    <tr className={props.level === 11 ? 'current_level' : ''}>
                        <td>11th</td>
                        <td>+4</td>
                        <td>{level_helper.levelFeats(11, props.house)}</td>
                        <td>8</td>
                        <td>8 Runes</td>
                    </tr>
                    {/* level 12 */}
                    <tr className={props.level === 12 ? 'current_level' : ''}>
                        <td>12th</td>
                        <td>+4</td>
                        <td>{level_helper.levelFeats(12, props.house)}</td>
                        <td>8</td>
                        <td>8 Runes</td>
                    </tr>
                    {/* level 13 */}
                    <tr className={props.level === 13 ? 'current_level' : ''}>
                        <td>13th</td>
                        <td>+5</td>
                        <td>{level_helper.levelFeats(13, props.house)}</td>
                        <td>8</td>
                        <td>8 Runes</td>
                    </tr>
                    {/* level 14 */}
                    <tr className={props.level === 14 ? 'current_level' : ''}>
                        <td>14th</td>
                        <td>+5</td>
                        <td>{level_helper.levelFeats(14, props.house)}</td>
                        <td>8</td>
                        <td>16 Runes</td>
                    </tr>
                    {/* level 15 */}
                    <tr className={props.level === 15 ? 'current_level' : ''}>
                        <td>15th</td>
                        <td>+5</td>
                        <td>{level_helper.levelFeats(15, props.house)}</td>
                        <td>16</td>
                        <td>16 Runes</td>
                    </tr>
                    {/* level 16 */}
                    <tr className={props.level === 16 ? 'current_level' : ''}>
                        <td>16th</td>
                        <td>+5</td>
                        <td>{level_helper.levelFeats(16, props.house)}</td>
                        <td>16</td>
                        <td>16 Runes</td>
                    </tr>
                    {/* level 17 */}
                    <tr className={props.level === 17 ? 'current_level' : ''}>
                        <td>17th</td>
                        <td>+6</td>
                        <td>{level_helper.levelFeats(17, props.house)}</td>
                        <td>16</td>
                        <td>32 Runes</td>
                    </tr>
                    {/* level 18 */}
                    <tr className={props.level === 18 ? 'current_level' : ''}>
                        <td>18th</td>
                        <td>+6</td>
                        <td>{level_helper.levelFeats(18, props.house)}</td>
                        <td>32</td>
                        <td>32 Runes</td>
                    </tr>
                    {/* level 19 */}
                    <tr className={props.level === 19 ? 'current_level' : ''}>
                        <td>19th</td>
                        <td>+6</td>
                        <td>{level_helper.levelFeats(19, props.house)}</td>
                        <td>32</td>
                        <td>64 Runes</td>
                    </tr>
                    {/* level 20 */}
                    <tr className={props.level === 20 ? 'current_level' : ''}>
                        <td>20th</td>
                        <td>+6</td>
                        <td>{level_helper.levelFeats(20, props.house)}</td>
                        <td>64</td>
                        <td>128 Runes</td>
                    </tr>
                </tbody>
            </table>
        </>
    );
}



export default level_details
