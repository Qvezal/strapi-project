"use client"
import styles from './arrow.module.css'
import Arrows from "./arrows_types";

export default  function Arrow({type,direction, stroke}:
    {type?: 'arrow_d' | 'arrow_r' | 'arrow',
     direction:'left'|'right',
     stroke?: boolean
    }
    ){ 
        
    const arrowStyle = direction=='left'? styles.left : styles.right; 

    return (
        <>  
            {
            stroke ?
            <div className={styles.stroke}>
                <div className={arrowStyle}>
                    <Arrows type={type} />
                </div>
            </div>    
            : 
            <div className={arrowStyle}>
                <Arrows type={type} />
            </div>
            }
        </>
    )
}
