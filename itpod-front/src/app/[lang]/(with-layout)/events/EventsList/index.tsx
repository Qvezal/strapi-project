"use client"
import Container from "@/components/std/Container";
import find_with_count from "@/utils/find_with_count";
import { useEffect, useState } from "react";
import styles from './events.module.css'
import EventDate from "../EventDate";
import Button from "@/components/std/Button";
import Card from "@/components/std/Card";

type props = {
  params: {
    lang: string,
  }
}


export type events = {
  attributes: {
    title: string,
    type: 'offline' | 'online',
    time_end: string,
    time_start: string
    content: string,
    slug: string
  }
}

export default function EventList(props: props) {

  const [events, set_events] = useState<Array<any>>([]);
  const [post_count, set_post_count] = useState({show: 0, total: 0});

  useEffect(() => {
    find_with_count('events', props.params.lang, true, '')
    .then((all_events : any) => {
      set_events(all_events.data);
      set_post_count(prev => {return {show: all_events.data.length, total: all_events.meta.pagination.total}})
    })
  }, [])

  const load_more = () => {
    find_with_count('events', props.params.lang, false, '', post_count.show)
    .then((all_events) => {
      set_events(prev => [...prev, ...all_events.data]);
      set_post_count(prev => {return {show: prev.show + all_events.data.length, total: all_events.meta.pagination.total}});
    })
  }

  const events_cards = events.map((event: events, key: number) => {

    const date_start = (new Date(event.attributes.time_start)).getDate();
    const date_end = (new Date(event.attributes.time_end)).getDate();
    const month = (new Date(event.attributes.time_start)).toLocaleString('default', { month: 'long' }).toLocaleLowerCase();

    const date = <EventDate name={`${date_start}-${date_end} ${month}`} card/>;
    const active = (new Date(event.attributes.time_start)) > (new Date());

    return (
    <Card key={'events' + key} style={"gray"} className={styles.card}>
      <div className={styles.tags}>
        {date}
      </div>
      <h4 className={styles.events_name}>{event.attributes.title}</h4>
      <a href={`/events/${event.attributes.slug}`} className={styles.card_link}>
      {
        active ?
        <Button style="primary">Зарегестрироваться</Button>
        :
        <Button style={"transparent"}><p>Подробнее</p></Button>
      }
      </a>
    </Card>
    )
  })

  return (
    <Container className={styles.container}>
      <h1 className={styles.header}>Мероприятия</h1>

      <div className={styles.events_wrapper}>
          {events_cards.length > 0 ? events_cards : <h2 className={styles.empty}>Мероприятий пока нет, следите за обновлениями!</h2>}
      </div>

      {
        post_count.show < post_count.total &&
        <Button className={styles.load_more} style={"secondary"} onClick={load_more}>Загрузить еще</Button>
      }
    </Container>
  )
}