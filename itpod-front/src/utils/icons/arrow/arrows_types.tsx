"use client"

export default function ArrowD({type} :
    {type: 'arrow_d' | 'arrow_r' | 'arrow' | undefined}
    ) {
            
    switch (type) {
        case 'arrow_d':
            return (
                <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g id="Group 29170">
                    <path id="Vector 30" d="M3.75736 3.75735L12.2426 3.75735L12.2426 12.2426" stroke="white"/>
                    <path id="Vector 32" d="M12.2422 3.75732L3.75691 12.2426" stroke="white"/>
                    </g>
                </svg>
            )
        case 'arrow':
        default: 
            return (
                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                    <path d="M6.89741 1.02563L12.9744 7.10259L6.89741 13.1796" stroke="white" stroke-width="1.01283"/>
                    <path d="M12.9746 7.1026L0.820692 7.1026" stroke="white" stroke-width="1.01283"/>
                </svg>
            )      
    }     
    
}
