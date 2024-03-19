import Link from "next/link";
import Image from "next/image";

import Block from "../../std/Block";

import styles from "./footer.module.css"
import get_labels from "@/functions/get_labels";

import logo from "./logo.svg"

import footer_labels from "./labels.json"

import get_navigation from "@/controllers/get_navigation";
import get_contacts from "@/controllers/get_contacts";
import { ReactNode } from "react";
import { headers } from "next/headers";
import { navItem } from "@/types/navItem";

type props = {
  curr_lang: string;
}

export default async function Footer (props: props) {

  const labels = get_labels(footer_labels, props.curr_lang);

  const page_headers = headers();
  const path = page_headers.get('x-pathname')?.slice(6);

  const navigation = await get_navigation(props.curr_lang);
  const contacts = await get_contacts(props.curr_lang);

  const nav_items = (items: navItem[], prefix? : string): Array<ReactNode> => {
    const nav_block: Array<ReactNode> = items.map((item: navItem, index: number): ReactNode => {
      let url = item.path;

      if (prefix && prefix != '/') {
        url = prefix + '/' + url;
      }

      if (item.childs) {
        return <div className={styles.nav_block} key={item.title+item.id}>{nav_items(item.childs, url)}</div>;
      } else {
        return (!item.related?.disabled 
          ? <a href={`/${url}/`} key={item.title+item.id}>{item.footer_title || item.title}</a>
          : <span key={item.title+item.id} className={styles.disabled}>{item.footer_title || item.title}</span>
        )
      }
    })

    return nav_block
    
  }

  const nav = nav_items(navigation.reverse());
  nav.splice(1,3, nav[3], nav[2], nav[1]);

  return (
    <Block options={{background: "dark"}}>
      <footer className={styles.footer}>
        <div className={styles.first}>
          <div className={styles.logo}>
          {
            path != '' ?
            <a href={"/"}>
              <Image src={logo} alt="logo" className={styles.logo_img}/>
            </a>
            :
            <Image src={logo} alt="logo" className={styles.logo_img}/>
          }
          </div>

          <div className={styles.footer_nav}>
            {nav[0]}
            {nav[2]}
          </div>
        </div>
          

        <div className={styles.footer_nav}>
          {nav[1]}
          {nav[3]}
        </div>

        <div className={styles.footer_contacts}>
          <div className={styles.contact_links}>
            <a href={'mailto:'+contacts.email}>{contacts.email}</a>
            <Link href={'tel:'+contacts.phone}>{contacts.phone}</Link>
          </div>
          <p>{contacts.address}</p>
        </div>

        <p className={styles.rights}>{labels.rights}</p>
        <Link href={'/privacy-policy'}>{labels.policy}</Link>
        <p className={styles.created}>Created by <a href="https://drozd.red">DROZD.RED</a></p>
    </footer>
    </Block>
  )
}