"use client"
import Image from "next/image"
import styles from "./card.module.css"
import { Children, ReactNode } from "react"

type props = {
  children: ReactNode
  className?: string
  style: "white" | "transparent" | "gray" | "blue",
}

export default function Card(props: props) {

  return (
    <div className={styles.card + " " + styles[props.style] + " " + props.className}>
      {props.children}
    </div>
  )
}