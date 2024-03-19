"use client"
import { useEffect, useState } from "react"
import styles from './tabs.module.css'

type tab = {
  name: string,
  content: any
}

export default function useTabs(get_data: Promise<any>, lang: string, head_styles: string, type: 'dark'|'light') {
  const [tabs, set_tabs] = useState<Array<tab>>([{
    name: '',
    content: {}
  }])
  const [current_tab, set_current_tab] = useState<tab>({
    name: '',
    content: ''
  });

  useEffect(() => {
    get_data.then(data => {
      set_tabs(data);
      set_current_tab(data[0]);
    })
  }, [lang]);

  const isDark = type === 'light';

  const tabStyle = isDark ? styles.tab : styles.tab + ' ' + styles.tab_gray; 
  const ActiveTabStyle = isDark ? styles.active : styles.active + ' ' + styles.active_gray; 

  const head = tabs.map((tab,key) => {
    if (!(Array.isArray(tab.content) && tab.content.length == 0))
      return <div className={tabStyle + ' ' + (current_tab.name == tab.name ? ActiveTabStyle : '')} key={'tab' + tab.name} onClick={() => {set_tab(key)}}>{tab.name}</div>
  })

  const tab_head = <div className={styles.head + " " + head_styles}>{head}<div className={isDark? styles.underline : styles.underline + ' ' + styles.underline_gray}></div></div>

  const set_tab = (key: number) => {
    set_current_tab((prev:tab) => {
      return tabs[key]
    })
  }

  return {current_tab, tab_head};
}