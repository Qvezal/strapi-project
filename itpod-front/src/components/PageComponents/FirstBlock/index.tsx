import styles from './first.module.css'

type FirstBlock = {
    src?: string,
    title?: string,
    expand_form: boolean
}

export default function FirstBlock(props: FirstBlock) {
    return (
      props.src ?
      <div className={styles.video_wrapper + (props.expand_form ? " " + styles.video_wrapper_w_form : '')}>
        <video className={styles.video} src={process.env.NEXT_PUBLIC_API_URL + props.src} autoPlay loop muted playsInline></video>
      </div>
      :
      props.title ? <h1 className={styles.title}>{props.title}</h1> : <></>
    )
  }