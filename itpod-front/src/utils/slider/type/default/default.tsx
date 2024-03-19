"use client"

import styles from './default.module.css'

type defaultSlider = {
    data: any,
    lang: string,
    style: any,

  }

export default function Default({data, lang, style} : defaultSlider) {


    return (
        <div className={styles.slider} key={data.id}>
          <div>{data.title}</div>
          <div>{data.tags.map((elem:string) => elem)}</div>
          <div>{data.link}</div>
        </div>
    )
}