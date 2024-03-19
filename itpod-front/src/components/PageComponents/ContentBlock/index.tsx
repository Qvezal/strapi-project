import styles from './content.module.css'
import ReactHtmlParser from 'react-html-parser'; 

type ContentBlock = {
    options: {
        content: string,
        custom_mobile_content: boolean,
        mobile_content?: string
    }
}

export default function ContentBlock(props: ContentBlock) {

    let desktopContentStyle = (props.options.custom_mobile_content && props.options.mobile_content) ?
    styles["content"] + " " + styles["content_md"] : styles["content"];

    const wrapperStyles = styles.wrapper + (!props.options.content && !props.options.mobile_content ? ' ' + styles.no_content : '');

    return (
        <div className={wrapperStyles}>
            <div className={desktopContentStyle}>
                {ReactHtmlParser (props.options.content)}
            </div>
            {(props.options.custom_mobile_content && props.options.mobile_content) && 
                <div className={styles.mobile_content}>
                    {ReactHtmlParser (props.options.mobile_content)}
                </div>
            }
        </div>
    )
  }