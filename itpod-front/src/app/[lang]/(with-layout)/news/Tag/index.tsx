import Button from '@/components/std/Button'
import styles from './tag.module.css'

export default function Tag({name, card}: {name:string, card?: boolean}) {
  return (
    <div className={styles.tag + ' ' + (card ? styles.card : '')}>
      <p>{name}</p>
    </div>
  )
}