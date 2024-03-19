"use client"

import { contacts } from "@/types/contact"
import { navItem } from "@/types/navItem"

import HeaderArrow from "./icon"

import styles from './nav.module.css'
import Button from "@/components/std/Button"
import { useState } from "react"
import Overlay from "@/components/std/Overlay"
import Card from "@/components/std/Card"
import SideAction from "./SideAction"
import { form } from "@/types/form"
import ReactHtmlParser from "react-html-parser"

type props = {
  nav: navItem[],
  contacts: contacts,
  form: form,
  curr_lang: string,
  show_popup: () => void
}

export default function FullNav(props: props) {

  const [sub_menu, set_sub_menu] = useState({
    show: false,
    items: [],
    side: '',
    parent_path: '',
    hide: false,
  });

  const delete_sub_menu = () => {
    set_sub_menu(prev => {
      return {
        show: false,
        items: [],
        side: '',
        parent_path: '',
        hide: false,
      }
    });
  }

  const hide_sub_menu = () => {
    set_sub_menu(prev => {
      return {
        ...prev,
        hide: true,
      }
    });
  }

  const show_sub_menu = (items: Array<any>, side_type: 'form' | 'contacts', parent_path: string) => {

    const menu_items = items.map((item, index) => {

      let link = parent_path != '/' ? `${parent_path}/${item.path}` : `/${item.path}`;

      const card = (
      <Card className={styles.sub_menu_link} style={"white"}>
        <h5 className={styles.link_title}>{ReactHtmlParser(item.related.title)}</h5>
        <p className={styles.link_description}>{item.related.description}</p>
      </Card>
    )

      return (
        !item.related.disabled 
        ? <a href={link[0] != '/' ? '/' + link : link} key={'sub_menu_link_' + index} className={styles.sub_menu_link_active}>{card}</a>
        : card
      )
    })

    const side = <SideAction curr_lang={props.curr_lang} action={side_type} action_data={{contacts: props.contacts, form: props.form, close: () => {delete_sub_menu(); props.show_popup();}}}></SideAction>

    //@ts-ignore
    set_sub_menu(prev => {
      return {
        show: true,
        items: menu_items,
        side: side,
      }
    })
  }

  const navigation = props.nav.map((nav_item, index) => {
    return (
      <div className={styles.nav_item} key={'header_nav_item' + index}>
        {
          nav_item.childs ?
          <Button style={"transparent"} className={styles.nav_item} onClick={() => {
            show_sub_menu(
              nav_item.childs!, 
              index == 0 ? 'form' : 'contacts',
              nav_item.path,
              )
          }}>

            {nav_item.title}
            <HeaderArrow />
          </Button>
          :
          <a href={`/${nav_item.path}/`} className={styles.nav_item}>{ReactHtmlParser(nav_item.title)}</a>
        }
      </div>
    )
  });

  let card_styles = styles.sub_menu;

  if (sub_menu.hide) {
    card_styles += " " + styles.hide
  }


  return <div className={styles.nav}>
    {
      sub_menu.show && 
      <Overlay close={() => {
        delete_sub_menu();
      }} wrapper={styles.wrapper}>
        <Card className={card_styles} style={"white"}>
          <div className={styles.sub_menu_links}>
            {sub_menu.items}
          </div>
          <div className={styles.sub_menu_action}>{sub_menu.side}</div>
        </Card>
      </Overlay>
    }
    {navigation}
  </div>
}