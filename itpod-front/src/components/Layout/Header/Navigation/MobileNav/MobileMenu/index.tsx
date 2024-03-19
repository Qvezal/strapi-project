'use client'
import Card from "@/components/std/Card"
import { contacts } from "@/types/contact"
import { navItem } from "@/types/navItem"
import styles from './menu.module.css'
import Button from "@/components/std/Button"
import Image from "next/image"
import { useEffect, useState } from "react"
import { title } from "process"
import arrow from './icon_16x16_M_Arrow-right-2.svg'

type props = {
  nav: navItem[],
  contacts: contacts,
  show_popup: () => void,
  close: () => void
}

export default function MobileMenu(props: props) {

  const [current_menu, set_current_menu] = useState<Array<React.JSX.Element>>(set_nav(props.nav));
  const [sub_menu, set_sub_menu] = useState(false);

  function set_nav(nav: navItem[], parent?:string) {
    const navigation = nav.map(item => {
  
      let style = styles.menu_item
  
      if(item.related?.disabled) {
        style += ' ' + styles.disabled
      }

      const link = (parent && parent != '/') ? `${parent}/${item.path}` : `/${item.path}`;

      return (
        item.type == 'WRAPPER'
        ?
        <div className={styles.menu_item} key={'menu_item_mobile_'+item.title} onClick={() => {change_nav(item.childs ? item.childs : [], item.path); set_sub_menu(prev => true);}}>
          <h3>{item.title}</h3>
          <Button style='secondary' className={styles.arrow}>
            <Image src={arrow} width={30} height={30} alt='close'/>
          </Button>
        </div>
        :
        item.related?.disabled ? <div className={style}><h3>{item.title}</h3></div> :
        <a href={link[0] != '/' ? '/' + link : link} className={style}><h3>{item.title}</h3></a>
      )
    })

    return navigation
  }

  function change_nav(nav: navItem[], parent?:string) {
    set_current_menu((prev) => {
      return set_nav(nav, parent);
    })
  }

  return (
  <div className={styles.menu}>
    <Card style={'white'} className={styles.nav}>
      {current_menu}
      {sub_menu && 
        <div className={styles.menu_item + ' ' + styles.back} onClick={() => {change_nav(props.nav); set_sub_menu(prev => false)}}>
          <Button style='secondary' className={styles.arrow}>
            <Image src={arrow} width={30} height={30} alt='close'/>
          </Button>
          <h3>Назад</h3> 
        </div>
      }
    </Card>
    <Card style={'white'} className={styles.contacts}>
      <h3>{props.contacts.phone}</h3>
      <p>{props.contacts.email}</p>
      <p className={styles.address}>{props.contacts.address}</p>

      <Button onClick={() => {props.show_popup(); props.close()}} style={'primary'} className={styles.btn}>Оставить заявку</Button>
    </Card>
  </div>)
}