import Card from "../Card"
import styles from './link.module.css'
import Image from 'next/image'
import ReactHtmlParser from 'react-html-parser'

import g1 from './imgs/raw/g1.svg'
import fg1 from './imgs/filled/g1.svg'

import g2 from './imgs/raw/g2.svg'
import fg2 from './imgs/filled/g2.svg'

import g2_2 from './imgs/raw/g2_2.svg'
import fg2_2 from './imgs/filled/g2_2.svg'

import g3 from './imgs/raw/g3.svg'
import fg3 from './imgs/filled/g3.svg'

import g4 from './imgs/raw/g4.svg'
import fg4 from './imgs/filled/g4.svg'

import gp1 from './imgs/raw/gp1.svg'
import fgp1 from './imgs/filled/gp1.svg'

import gp2 from './imgs/raw/gp2.svg'
import fgp2 from './imgs/filled/gp2.svg'

import s1 from './imgs/raw/s1.svg'
import fs1 from './imgs/filled/s1.svg'

import ds1 from './imgs/raw/ds1.svg'
import fds1 from './imgs/filled/ds1.svg'

import n1 from './imgs/raw/n1.svg'
import fn1 from './imgs/filled/n1.svg'

import arrow from './imgs/arrow-r.svg'

export type server = 'g1' | 'g2' | 'g2_s' | 'g3' | 'g4' | 's1' | 'gp1' | 'gp2' | 'n1' | 'ds1'

export type link = {
  image: server
  disabled: boolean,
  data: {
      title: string,
      description?: string,
      type?: string,
      url: string,
  }
}

type props = {
  link: link,
  background: 'white' | 'gray',
  slider?: boolean
}

export default function pageLink(props: props) {

  let raw_img;
  let filled_img;

  switch (props.link.image) {
    case 'g1':
      raw_img = <Image className={styles.raw_img} src={g1} alt='three'/>;
      filled_img = <Image className={styles.filled_img} src={fg1} alt='fthree'/>;
      break;
    case 'g2':
      raw_img = <Image className={styles.raw_img} src={g2} alt='three'/>;
      filled_img = <Image className={styles.filled_img} src={fg2} alt='fthree'/>;
      break;
    case 'g2_s':
      raw_img = <Image className={styles.raw_img} src={g2_2} alt='three_big'/>;
      filled_img = <Image className={styles.filled_img} src={fg2_2} alt='fthree-big'/>;
      break;
    case 'g3':
      raw_img = <Image className={styles.raw_img} src={g3} alt='storage'/>;
      filled_img = <Image className={styles.filled_img} src={fg3} alt='fstorage'/>;
      break;
    case 'g4':
      raw_img = <Image className={styles.raw_img} src={g4} alt='four'/>;
      filled_img = <Image className={styles.filled_img} src={fg4} alt='ffour'/>;
      break;
    case 'gp1':
      raw_img = <Image className={styles.raw_img} src={gp1} alt='six'/>;
      filled_img = <Image className={styles.filled_img} src={fgp1} alt='fsix'/>;
      break;
    case 'gp2':
      raw_img = <Image className={styles.raw_img} src={gp2} alt='six'/>;
      filled_img = <Image className={styles.filled_img} src={fgp2} alt='fsix'/>;
      break;
    case 's1':
      raw_img = <Image className={styles.raw_img} src={s1} alt='six'/>;
      filled_img = <Image className={styles.filled_img} src={fs1} alt='fsix'/>;
      break;
    case 'ds1':
      raw_img = <Image className={styles.raw_img} src={ds1} alt='six'/>;
      filled_img = <Image className={styles.filled_img} src={fds1} alt='fsix'/>;
      break;
    case 'n1':
      raw_img = <Image className={styles.raw_img} src={n1} alt='six'/>;
      filled_img = <Image className={styles.filled_img} src={fn1} alt='fsix'/>;
      break;
  }

  let class_name = styles.link;
  class_name += !props.link.disabled && ' ' + styles.active;
  class_name += props.slider ? ' ' +  styles.slider : '';

  return (
    !props.link.disabled ?
    <a href={props.link.data.url} className={styles.linked}>
      <Card style={props.background} className={class_name + ' ' + styles.page_card}>
        <h4>
        {props.link.data.type && 
          <>
            <span className={styles.server_type}>
              {props.link.data.type}-
            </span>
            <br/>
          </>
        }
        {ReactHtmlParser(props.link.data.title)}
        </h4>
        {
          props.link.data.description &&
          <p className={styles.description}>{ReactHtmlParser(props.link.data.description)}</p>
        }
        <div className={styles.arrow}>
          <Image src={arrow} width={20} height={20} alt="arrow"/>
        </div>
        {raw_img}
        {filled_img}
      </Card>
    </a>
    :
    <Card style={props.background} className={styles.link + ' ' + styles.page_card}>
      <h4>
        {props.link.data.type && 
          <>
            <span className={styles.server_type}>
              {props.link.data.type}-
            </span>
            <br/>
          </>
        }
        {ReactHtmlParser(props.link.data.title)}
      </h4>
        {
          props.link.data.description &&
          <p className={styles.description}>{ReactHtmlParser(props.link.data.description)}</p>
        }
        {raw_img}
    </Card>
  )
}