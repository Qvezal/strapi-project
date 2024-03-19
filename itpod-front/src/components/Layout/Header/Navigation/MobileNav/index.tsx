'use client'
import burger from './Frame 30316.svg'
import close from './icon_16x16_M_Close.svg'
import styles from './mobile_nav.module.css'

import Button from "@/components/std/Button"
import Image from "next/image"

import { contacts } from "@/types/contact"
import { navItem } from "@/types/navItem"
import { useState } from "react"
import { form } from '@/types/form'
import Overlay from '@/components/std/Overlay'
import Card from '@/components/std/Card'
import MobileMenu from './MobileMenu'

type props = {
  nav: navItem[],
  contacts: contacts,
  show_popup: () => void
}

export default function MobileNav(props: props) {

  const [show_step, set_show_step] = useState(false);

  const toggleScroll = () => {
    document.body.style.overflow = document.body.style.overflow == 'hidden' ? 'auto' : 'hidden';
  }

  return (
    <>
    {
      show_step == false 
      ?
      <Button onClick={() => {set_show_step(prev => true); toggleScroll()}} style='secondary' className={styles.burger}>
        <Image src={burger} width={20} height={20} alt='burger'/>
      </Button>
      :
      <>
      <Button onClick={() => {set_show_step(prev => false);  toggleScroll()}} style='secondary' className={styles.burger + ' ' + styles.burger_close}>
        <Image src={close} width={20} height={20} alt='close'/>
      </Button>
      <Overlay wrapper={styles.menu_overlay} close={() => {set_show_step(prev => false);  toggleScroll()}}>
        <MobileMenu nav={props.nav} contacts={props.contacts} show_popup={props.show_popup} close={() => {set_show_step(prev => false)}}/>
      </Overlay>
      </>
    }
    </>
  )
}