"use client"

import 'swiper/css';
import 'swiper/css/pagination';
import 'swiper/css/navigation';
import styles from './newsBlock.module.css'
import { Swiper, SwiperSlide } from 'swiper/react';
import { Navigation, Pagination, Scrollbar } from 'swiper/modules';
import find_with_count from '@/utils/find_with_count';
import Arrow from '@/utils/icons/arrow';
import { useCallback, useEffect, useRef, useState } from 'react';
import Card from '@/components/std/Card';
import Tag from '@/app/[lang]/(with-layout)/news/Tag';
import { News, news_tag } from '@/app/[lang]/(with-layout)/news/page';
import Button from '@/components/std/Button';

type BannerBlock = {
    locale : string,
    options : any
}

export default function NewsBlock(props:BannerBlock) {

    const [news, set_news] = useState([]);

    useEffect(() => {
        find_with_count('newsletters', props.locale, false, '', 0).then((res:any) => {
            set_news(res.data)
        })
    },[])

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

    const news_cards = news.map((newsletter: News, key: number) => {

        const tags = newsletter.attributes.news_tags.data.map((tag: news_tag) => <Tag key={"card_tag" + tag} name={tag.attributes.name} card/>);

        return (
        <Card key={'news' + key} style={"gray"} className={styles.card}>
        <div className={styles.tags}>
            {tags}
        </div>
        <h4 className={styles.news_name}>{newsletter.attributes.title}</h4>
        <a href={`/news/${newsletter.attributes.slug}`} className={styles.card_link}><Button style={"transparent"}><p>Читать</p></Button></a>
        </Card>
        )
    })

    return (
        <div className={styles.news_wrapper}>
            <Swiper
                ref={sliderRef}
                modules={[Pagination, Scrollbar]}
                scrollbar={{draggable: true}}
                direction="horizontal"
                slidesPerView={1.2}
                spaceBetween={10}
                grabCursor={true}
                className={styles.swiper + ' light_swiper'}
                breakpoints={{
                992: {
                    slidesPerView: 2.2,
                    spaceBetween: 16
                },
                1200: {
                    spaceBetween: 20
                },
                1530: {
                    slidesPerView: 3,
                    spaceBetween: 16
                }
                }}
            >
                {news_cards.map((slide: any, index: number) => <SwiperSlide key={"slide" + ' news' + index}>{slide}</SwiperSlide>)}
            </Swiper>
            {navigation}
        </div>
    )
  }