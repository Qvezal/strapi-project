"use client"
import find_many from "@/utils/find_many"
import styles from './partners.module.css'
import Card from "@/components/std/Card";
import FormPopUp from "@/components/Layout/FormPopUp";
import useTabs from "@/utils/tabs";
import CardContent from "./CardContent/index";
import { Swiper, SwiperSlide } from "swiper/react";
import { Grid, Pagination, Scrollbar } from "swiper/modules";
import 'swiper/css/scrollbar';
import Button from "@/components/std/Button";
import { useState } from "react";

export default function PartnersBlock({lang, options} : {lang: string, options: any}) {

  const [show_form, set_show_form] = useState(false);

  const toggleForm = () => {
    set_show_form((prev) =>!prev)
  };

  const get_data = find_many('partners-types', lang).then(res => {
    const data = res.map((tab:any) => {
      return {
        name: tab.attributes.name,
        content: tab.attributes.partners.data
      }
    });

    return data
  });

  const tabStyle = options.base.background == ('dark' || 'custom-dark') ? 'light' : 'dark';
  const {current_tab, tab_head} = useTabs(get_data, lang, styles.head, tabStyle);

  return (
    <div className={styles.partners}>
      {tab_head}
      <div className={styles.partners_container}>
        <Swiper
            modules={[Pagination, Scrollbar, Grid]}
            scrollbar={{draggable: true}}
            direction="horizontal"
            slidesPerView={'auto'}
            spaceBetween={10}
            className={styles.swiper}
            breakpoints={{
              992: {
                slidesPerView: 2,
                spaceBetween: 16
              },
              1200: {
                slidesPerView: 3,
                spaceBetween: 20
              },
              1920: {
                slidesPerView: 4,
                spaceBetween: 20
              }
            }}
          >            
            {
              current_tab.content && current_tab.content.slice(0,3).map(
                (item: any, key: number)=> 
                <SwiperSlide className={styles.slide} key={'swiper_slide' + key}>
                  <Card style="white" key={'tab_content' + key} className={styles.card}>
                    <CardContent lang={lang} content={item.attributes} />
                  </Card>
                </SwiperSlide>
              )
            }
            
            {options.base.form.data &&
              <SwiperSlide className={styles.slide + ' ' + styles.lg} key={'swiper_slide9999'}>
                <Card style="blue" className={styles.form + ' ' + styles.card}>
                  <h4 className={styles.form_description}>{options.form_description}</h4>
                  <Button style={'white'} onClick={toggleForm}>{options.base.form.data.attributes.send_text}</Button>
                </Card>
              </SwiperSlide>
            }
          </Swiper>
          {options.base.form.data && 
            <FormPopUp 
              button={{type: "none"}}
              form={options.base.form.data.attributes}
              curr_lang={lang}
              onclick={toggleForm}
              show={show_form}
              prevent_default={true}
            />
          }
      </div>
        {options.base.form.data &&
          <Card style="blue" className={styles.form + ' ' + styles.card + ' ' + styles.md}>
            <h4 className={styles.form_description}>{options.form_description}</h4>
            <FormPopUp button={{type: "white", text: options.base.form.data.attributes.send_text}} form={options.base.form.data.attributes} curr_lang={lang}/>
          </Card>
        }
    </div>
  )
}