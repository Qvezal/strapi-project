"use client"
import Image from "next/image";
import styles from './card-content.module.css'
import arrow from './icons/arrow_blue.svg'

export default function CardContent({lang, content} : {lang: string, content: any}) {
  const img = content.logo?.data?.attributes.url ? process.env.NEXT_PUBLIC_API_URL + content.logo.data.attributes.url : '';

  return (
    <div className={styles.content}>
      <Image src={img} alt="logo" className={styles.logo + ' ' + styles.gray} width={300} height={150}/>
      <div className={styles.description}><span>{content.description}</span></div>
      <a href={"https://" + content.link} target="_blank" className={styles.link}>{content.link}<Image src={arrow} alt='arrow' /></a>
    </div>
  )
}