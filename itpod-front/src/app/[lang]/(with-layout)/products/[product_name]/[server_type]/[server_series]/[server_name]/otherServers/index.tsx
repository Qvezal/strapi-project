'use client'
import { Swiper, SwiperSlide } from "swiper/react";
import { Grid, Pagination, Scrollbar } from "swiper/modules";
import 'swiper/css/scrollbar';
import 'swiper/css';
import styles from './otherservers.module.css';


export default function OtherServers({servers}: {servers: Array<any>}) {
    return (
      <>
        <Swiper
            modules={[Pagination, Scrollbar, Grid]}
            scrollbar={{draggable: true}}
            direction="horizontal"
            slidesPerView={'auto'}
            spaceBetween={10}
            className={styles.swiper}
            breakpoints={{
              992: {
                slidesPerView:2.65,
                spaceBetween: 16
              },
              1200: {
                slidesPerView:2.9,
                spaceBetween: 20
              },
              1920: {
                slidesPerView: 4,
                spaceBetween: 20
              }
            }}
        >
            {servers.map((server: any, key: number) => <SwiperSlide key={'swiper_slide' + key}>{server}</SwiperSlide>)}
        </Swiper>
      </>
    );
}