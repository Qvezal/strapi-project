"use client"
import Card from '@/components/std/Card'
import styles from './images.module.css'
import { useState } from 'react'
import Image from 'next/image'

export default function ServerImages({imgs} : {imgs: Array<any>}) {

  const [active, set_active] = useState(imgs[0]);

  const all = imgs.map(img => {
    return <div className={styles.img_wrapper + ' ' + (active.attributes.name == img.attributes.name ? styles.active_small : '')} key={img.attributes.name} onClick={() => {
              set_active((prev: any) => img);
            }}>
              <Image className={styles.img} src={process.env.NEXT_PUBLIC_API_URL + img.attributes.url} alt='active' width={img.attributes.width} height={img.attributes.height}/>
              </div>
      })

  return (
  <div className={styles.image}>
    <Card className={styles.active} style={'gray'}>
      <Image src={process.env.NEXT_PUBLIC_API_URL + active.attributes.url} alt='active' width={1254} height={978}/>
    </Card>
    <div className={styles.all}>{all}</div>
  </div>)
}