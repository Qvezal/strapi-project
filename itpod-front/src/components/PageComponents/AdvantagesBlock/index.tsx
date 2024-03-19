"use client"
import FormPopUp from "@/components/Layout/FormPopUp";
import AdvantagesCard from "./AdvatagesCard";
import styles from './advantages.module.css';
import cardStyles from './AdvatagesCard/card.module.css';
import {field, form} from "@/types/form";
import Card from "@/components/std/Card";
import ReactHtmlParser from 'react-html-parser';
import { Swiper, SwiperSlide } from "swiper/react";
import { Grid, Pagination, Scrollbar } from "swiper/modules";
import 'swiper/css/scrollbar';

type advantagesCard = {
  title: string,
  bigger_title: boolean
  description: string,
  img?: {
    data: {
      attributes: any,
    }
  },
  list?: []
}

type AdvantagesBlock = {
  options: {
    params: {
      slider?: boolean,
      nums_in_row: number,
      cta_card_color?: 'gray' | 'blue' | undefined,
      cards_overflow: boolean,
      less_min_height: boolean,
      name: string,
    }
    cards: advantagesCard[],
    media: {
      data: {
        attributes:{
          url: string
        }
      }
    },
    baseColor: string,
    baseForm: form,
    form?: {
      data?: {
        attributes: {
          name: string,
          description: string,
          send_text: string,
          privacy: boolean,
          success_message: string,
          form_fields: {
            data: field[]
          }
        }
      }
    },
  }
}

export default function AdvantagesBlock(props: AdvantagesBlock) {

  const ctaCardColor = props.options.params.cta_card_color || 'blue';
  const isCardsOverflow = props.options.params.cards_overflow || false;
  const lessMinHeight = props.options.params.less_min_height || true;

  const cards = props.options.cards.map((card, index) => {
    const image = card.img?.data?.attributes?.url ? process.env.NEXT_PUBLIC_API_URL + card.img?.data.attributes.url : '';

    const form = props.options.form
    if (form) {
      form.data?.attributes.form_fields.data.map(field => {
        if (field.attributes.type === 'hidden' && !field.attributes.value) {
          field.attributes.value = card.title
        }

        return field
      })
    }

    return (
      <AdvantagesCard 
        key={'advantages_card' + index}
        title={card.title}
        bigger_title={card.bigger_title}
        description={card.description}
        image={image}
        cardColor={props.options.baseColor}
        list={card.list}
        less_min_height={lessMinHeight}
        nums_in_row={props.options.params.nums_in_row}
        name={props.options.params.name}
        form={form}/>
      )
  })

  let gridStyle = styles.cards_block;
  gridStyle += ' ' + styles["cards_block-" + props.options.params.nums_in_row];

  let isCta = props.options.params.name == "card-cta";

  let nonCtaContent;
  if (props.options.media?.data) {
    nonCtaContent =
    <div className={styles.cards_media_block_wrapper}>
      <div className={styles.cards_media_block}>
        <video className={styles.card_video} src={process.env.NEXT_PUBLIC_API_URL + props.options.media.data.attributes.url} autoPlay loop muted playsInline></video>
      </div>
      <div className={gridStyle}>
        {cards}
      </div>
    </div>
  } else {
    nonCtaContent = 
    <div className={gridStyle}>
      {cards}
    </div>
  }

  let CtaContent;
  if (isCta) {
    let cardForm;
    if (props.options.baseForm) {
      let cardFormStyles;
      
      if (isCardsOverflow) {
        cardFormStyles = styles.cta_card;
      } else {
        cardFormStyles = cardStyles.card + ' ' + cardStyles.w_cta_small;
      }

      cardForm = 
        <Card style={ctaCardColor} className={cardFormStyles}>
          <h3 className={styles.cta_card_title + ' ' + styles[ctaCardColor] + (!isCardsOverflow ? ' ' + styles.cta_card_title_no_overflow : '')}>
            {ReactHtmlParser(props.options.baseForm.description)}
          </h3>
          <div className={styles.form_btn_wrapper}>
            <FormPopUp className={styles.cta_card_btn}
              button={{
                text: props.options.baseForm.send_text,
                type: ctaCardColor == 'blue' ? "white" : "primary"
              }} 
              form={props.options.baseForm}
              curr_lang={""}
            />
          </div>
        </Card>;
    }

    if (isCardsOverflow) {
      CtaContent = 
      <div className={styles.cta_wrapper}>
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
              {cards.map((card: any, key: number) => <SwiperSlide className={styles.slide} key={'swiper_slide' + key}>{card}</SwiperSlide>)}
            </Swiper>
        <div className={styles.overflow}>
          <div className={gridStyle + ' ' + styles.flex}>
            {cards}
          </div>
        </div>
        {cardForm}
      </div>;
    } else {
      CtaContent =
      <div className={gridStyle}>
        {cards}
        {cardForm}
      </div>
    }
  }

  return (
    <>
      {isCta ? CtaContent : nonCtaContent }
    </>
  )
}