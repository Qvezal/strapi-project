import Container from "@/components/std/Container";
import find_by_slug from "@/utils/find_by_slug";
import NotFound from "../../404";
import styles from './event.module.css';
import Block from "@/components/std/Block";
import ReactHTMLParser from 'react-html-parser'
import Image from "next/image";

import online from './online.svg';
import offline from './offline.svg';
import calendar from './calendar.svg'
import ContentBlock from "@/components/PageComponents/ContentBlock";
import find_with_count from "@/utils/find_with_count";
import AnotherEvents from "./AnotherEvents";

type props = {
  params: {
    lang: string,
    event_slug: string,
  }
}

export default async function Event(props: props) {

  const event = (await find_by_slug('event', props.params.event_slug, props.params.lang)).data?.attributes;
  const another = (await find_with_count('events', props.params.lang)).data

  if (!event) {
    return NotFound();
  }

  const date_start = (new Date(event.time_start)).getDate();
  const date_end = (new Date(event.time_end)).getDate();
  const hours = (new Date(event.time_start)).getHours();
  const minutes = (new Date(event.time_end)).getMinutes();
  const years = (new Date(event.time_end)).getFullYear();
  const active = (new Date(event.time_start)) > (new Date());
  let month = (new Date(event.time_start)).toLocaleString('default', { month: 'long' }).toLocaleLowerCase();
  month = month[month.length - 1] == 'ь' ? month.substring(0, month.length-1) + "я" : month + 'а';

  return (
    <>
      <Container>
        <div className={styles.head}>
          <h1>{event.title}</h1>
          <div className={styles.info}>
            {
              active &&
              <div className={styles.info_block + ' ' + styles.register}>
                <p>
                  <span>Регистрация открыта</span>
                </p>
              </div>
            }
            <div className={styles.info_block}>
              <p>
                <Image src={calendar} alt="event_type" width={18} height={18}/>
                <span>{`${date_start}-${date_end} ${month} ${years} в ${hours}:${minutes < 10 ? '0' + minutes : minutes}`}</span>
              </p>
            </div>
            <div className={styles.info_block}>
              <p>
                <Image src={event.type == 'online' ? online : offline} alt="event_type" width={18} height={18}/>
                <span>{event.type == 'online' ? 'Онлайн' : 'Офлайн'}</span>
              </p>
            </div>
          </div>
        </div>
        <div className={styles.event}>
            <div className={styles.content}>
              <ContentBlock options={{
              content: event.content,
              custom_mobile_content: false,
            }}/>
            </div>
            <div className={styles.form}>
            </div>
        </div>
      </Container>
      <Block options={{
        background: "gray",
        layout: 'vertical',
        padding: 'both',
      }}>
        <h2>Другие мероприятия</h2>
        <AnotherEvents events={another}/>
      </Block>
    </>
  )
}