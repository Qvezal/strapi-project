"use client"
import styles from './navigation.module.css'
import MobileNav from './MobileNav'
import FullNav from './FullNav'
import Button from '@/components/std/Button'
import useNav from './nav_data'
import FormPopUp from '../../FormPopUp'
import { useLayoutEffect, useState } from 'react'

type props = {
  curr_lang: string,
  path: string | undefined
}

export default function Navigation(props: props) {

  const {navigation, contacts, form} = useNav(props.curr_lang)
  const [windowWidth, setWindowWidth] = useState(0);
  const [show_popup, set_show_popup] = useState(false);

  useLayoutEffect(() => {
    const watchWidth = () => {
      setWindowWidth(window.innerWidth);
    }

    window.addEventListener("resize", watchWidth);
    watchWidth();
    return function () {
      window.removeEventListener("resize", watchWidth);
    };
  }, [])

  return (
    <div className={styles.nav}>
      {windowWidth < 1200 
      ?
      <MobileNav nav={navigation} contacts={contacts} show_popup={() => {set_show_popup(prev => true)}}/>
      :
      (<>
        <FullNav nav={navigation} contacts={contacts} form={form} curr_lang={props.curr_lang} show_popup={() => {set_show_popup(prev => true)}}/>
        {
          props.path != '/products/server-equipment' &&
          <a href={"/products/server-equipment"}>
            <Button className={styles.no_focus} style={"secondary"}>Открыть каталог</Button>
          </a>
        }
      </>)
      
      }

      {show_popup && <FormPopUp form={form} curr_lang={props.curr_lang} onclick={() => {set_show_popup(prev => false)}} prevent_default />}
    </div>
  )
}