"use client"

import Link from "next/link"
import langs from "@/data/langs"
import styles from "./langSwitch.module.css"
import { useState } from "react"

type props = {
  curr_lang: string
}

export default function LangSwitch (props: props) {

  const [show_langs, set_show_langs] = useState(false)

  const target = langs.filter(lang => lang != props.curr_lang)[0]

  return (
    <div className={styles.lang}>
      <Link className={styles.active} href={"/"+target}>{target.toUpperCase()}</Link>
    </div>
  )
}