"use client"
import styles from "./header.module.css"
import Image from "next/image"

import logo from "./logo.svg"

import Container from "../../std/Container"
import Navigation from "./Navigation"

import page_labels from "./Navigation/labels.json"
import get_labels from "@/functions/get_labels"
import { headers } from "next/headers";
import Link from "next/link"
import Button from "@/components/std/Button"
import { usePathname } from "next/navigation"

type props = {
  curr_lang: string
}

export default function Header (props: props) {

  const labels = get_labels(page_labels, props.curr_lang);
  const path = usePathname()?.slice(6);
  console.log(path)

  return (
    <header className={styles.header}>
      <Container>
        <div className={styles.header_container}>
          {
            path != '' ?
            <a href={"/"}>
              <Image src={logo} alt="logo" className={styles.logo}/>
            </a>
            :
            <Image src={logo} alt="logo" className={styles.logo}/>
          }
          <div className={styles.actions}>
            {/* <LangSwitch curr_lang={props.curr_lang}/> */}
            <Navigation curr_lang={props.curr_lang} path={path}/>
          </div>
        </div>
      </Container>
    </header> 
  )
}