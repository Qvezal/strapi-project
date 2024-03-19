"use client"
import 'swiper/css';
import 'swiper/css/pagination';
import 'swiper/css/navigation';
import styles from './AnotherEvents.module.css'
import { Swiper, SwiperSlide } from 'swiper/react';
import { Navigation, Pagination, Scrollbar } from 'swiper/modules';
import Arrow from '@/utils/icons/arrow';
import { useCallback, useEffect, useRef, useState } from 'react';
import Card from '@/components/std/Card';
import { events } from '@/app/[lang]/(with-layout)/events/page';
import Button from '@/components/std/Button';
import EventDate from '../../EventDate';

type Props = {
  events: events[]
}

export default function AnotherEvents(props: Props) {

  const {events} = props;
  const sliderRef = useRef<any>(null);

  const handlePrev = useCallback(() => {
      if (!sliderRef.current) return;
      sliderRef.current.swiper.slidePrev();
  }, []);

  const handleNext = useCallback(() => {
      if (!sliderRef.current) return;
      sliderRef.current.swiper.slideNext();
  }, []);

  const navigation = 
  <div className={styles.navigation}>
    <div onClick={handlePrev}>
      <Arrow direction={'left'} stroke={true}/>
    </div>
    <div onClick={handleNext}>
      <Arrow direction={'right'} stroke={true} />
    </div>  
  </div>

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
    <div className={styles.events_wrapper}>
        <Swiper
            ref={sliderRef}
            modules={[Pagination, Scrollbar]}
            scrollbar={{draggable: true}}
            direction="horizontal"
            slidesPerView={1.2}
            spaceBetween={10}
            grabCursor={true}
            className={styles.swiper + ' another-slider'}
            breakpoints={{
            992: {
                slidesPerView: 2.2,
                spaceBetween: 16
            },
            1200: {
                spaceBetween: 20,
                slidesPerView: 2
            },
            1530: {
                slidesPerView: 3,
                spaceBetween: 16
            }
            }}
        >
            {events_cards.map((slide: any, index: number) => <SwiperSlide key={"slide" + ' events' + index}>{slide}</SwiperSlide>)}
        </Swiper>
        {navigation}
    </div>
  )
}