import styles from './tag.module.css'

export default function EventTag({name, card}: {name:string, card?: boolean}) {
  return (
    <div className={styles.tag + ' ' + (card ? styles.card : '')}>
      <p>{name}</p>
    </div>
  )
}