"use client"
import Card from "@/components/std/Card"
import styles from './relation.module.css';
import ReactHtmlParser from 'react-html-parser';
import PageLink, { link } from "@/components/std/PageLink";
import find_many from "@/utils/find_many";
import useTabs from "@/utils/tabs";
import { Swiper, SwiperSlide } from "swiper/react";
import { Grid, Pagination, Scrollbar } from "swiper/modules";
import 'swiper/css/scrollbar';

type props = {
  page: any,
  type: string,
  curr_page: string,
  locale: string,
  units?: boolean
}

export default function RelationBlock(props: props) {
  
  let block;

  if (props.type === 'type') {
    block = props.page.server_types.data.map((type:any) => {

      const data = type.attributes;
      const links = data.server_series?.data.map((series:any) => {
  
        const series_data = series.attributes;
  
        const link = {
          image: series_data.card_img,
          disabled: false,
          data: {
            title: series_data.title,
            description: series_data.description,
            url: '/products/' + props.page.slug + '/' + data.slug + '/' + series_data.slug,
          }
        }
  
        return <PageLink background={"white"} key={"link"+data.title+series.title} link={link}/>
      })
  
      return (
        <Card style={"gray"} key={'type'+data.title} className={styles.relation}>
          <h3 className={styles.title}>Серия {data.title}</h3>
          {ReactHtmlParser(data.description)}
          <div className={styles.links + " " + styles.type}>
            {links}
          </div>
        </Card>
      )
    })
  }

  if (props.type === 'server') {
    let processors: Array<any> = [];

    props.page.servers.data.map((server:any) => {
      const server_data = server.attributes;
      const processor = server_data.server_processor.data.attributes;
      const find_processor = processors.find((exist:any) => exist.name === processor.name);

      const link: link = {
        image: server_data.card_img || "g2",
        disabled: false,
        data: {
          title: server_data.title,
          description: server_data.description,
          type: server_data.server_type.data.attributes.title,
          url: props.curr_page + '/' + server_data.slug
        }
      }

      const server_component = <PageLink slider background={"white"} key={"link"+processor.name+server_data.title} link={link}/>

      if (!find_processor) {
        if (!props.units) {
          processors.push({
            name: processor.name,
            servers: [server_component]
          });
        } else {
          const size = server_data.server_size.data.attributes.name

          processors.push({
            name: processor.name,
            servers: [server_component],
            units: {
              [size] : [server_component]
            }
          });
        }
      } else {
        if (!props.units) {
          find_processor.servers.push(server_component)
        } else {
          const size = server_data.server_size.data.attributes.name

          if (find_processor.units[size]) {
            find_processor.units[size].push(server_component)
          } else {
            find_processor.units = {
              ...find_processor.units,
              [size] : [server_component]
            }
          }
        }
      }

    })

    block = processors.map(processor => {
      
      let links;
      let tabs;

      const get_data = new Promise((resolve, reject) => {
        let tabs: Array<any> = []

        Object.keys(processor.units).forEach((key, value) => tabs.push({name: key, content: processor.units[key]}));
        resolve(tabs);
      })

      if(props.units) {
        // eslint-disable-next-line react-hooks/rules-of-hooks
        tabs = useTabs(get_data, props.locale, styles.head, 'dark');
        links = Array(...tabs.current_tab.content)
      } else {
        links = processor.servers
      }

      return (
        <Card style={"gray"} key={'type'+processor.name} className={styles.relation}>
          <h2 className={styles.title}>Серверы на процессорах {processor.name}</h2>
          {props.units &&
            <div className={styles.head_slider}>
              {tabs?.tab_head}
            </div>
          }
          <Swiper
            modules={[Pagination, Scrollbar, Grid]}
            scrollbar={{draggable: true}}
            direction="horizontal"
            slidesPerView={1}
            spaceBetween={10}
            className={styles.swiper}
            breakpoints={{
              992: {
                slidesPerView:2.7,
                spaceBetween: 16
              },
              1200: {
                slidesPerView:2.9,
                spaceBetween: 20
              },
              1530: {
                
              }
            }}
          >
            {links.map((link: any, key: number) => <SwiperSlide key={'swiper_slide' + key}>{link}</SwiperSlide>)}
          </Swiper>
          <div className={styles.links + ' ' + styles.desctop_servers}>
            {links}
          </div>
        </Card>
      )      
    })
  }

  return (
    <div className={styles.relation_wrapper}>
      {block}
    </div>
  )
}