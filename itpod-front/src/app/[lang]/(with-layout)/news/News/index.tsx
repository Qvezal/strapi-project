"use client"
import Container from "@/components/std/Container";
import find_with_count from "@/utils/find_with_count";
import { useEffect, useState } from "react";
import styles from './news.module.css'
import Tag from "../Tag";
import Button from "@/components/std/Button";
import Card from "@/components/std/Card";
import get_page from "@/controllers/get_page";
import { Seo } from "@/types/seo";
import get_seo from "@/utils/get_seo";
import { ResolvingMetadata, Metadata } from "next";

type props = {
  params: {
    lang: string,
  }
}

export type news_tag = {
  attributes: {
    name: string
  }
}

export type News = {
  attributes: {
    title: string,
    content: string,
    news_tags: {
      data: news_tag[]
    },
    slug: string
  }
}

export default function Newsletters(props: props) {

  const [news, set_news] = useState<Array<any>>([]);
  const [news_tags, set_news_tags] = useState<Array<string>>([]);
  const [filter, set_filter] = useState("");
  const [post_count, set_post_count] = useState({show: 0, total: 0});

  useEffect(() => {
    find_with_count('newsletters', props.params.lang, true, filter)
    .then((all_news : any) => {
      all_news.data.map((newsletter: News) => {
        const tags = newsletter.attributes.news_tags.data.map((tag: news_tag) => tag.attributes.name);
        //@ts-ignore
        set_news_tags(prev => [...new Set([...tags, ...prev])]);
      })
      set_news(all_news.data);
      set_post_count(prev => {return {show: all_news.data.length, total: all_news.meta.pagination.total}})
    })
  }, [filter])

  const load_more = () => {
    find_with_count('newsletters', props.params.lang, false, filter, post_count.show)
    .then((all_news) => {
      all_news.data.map((newsletter: News) => {
        const tags = newsletter.attributes.news_tags.data.map((tag: news_tag) => tag.attributes.name);
        //@ts-ignore
        set_news_tags(prev => [...new Set([...tags, ...prev])]);
      })
      set_news(prev => [...prev, ...all_news.data]);
      set_post_count(prev => {return {show: prev.show + all_news.data.length, total: all_news.meta.pagination.total}});
    })
  }

  const news_cards = news.map((newsletter: News, key: number) => {

    const tags = newsletter.attributes.news_tags.data.map((tag: news_tag) => <Tag key={"card_tag" + tag} name={tag.attributes.name} card/>);

    return (
    <Card key={'news' + key} style={"gray"} className={styles.card}>
      <div className={styles.card_tags}>
        {tags}
      </div>
      <h4 className={styles.news_name}>{newsletter.attributes.title}</h4>
      <a href={`/news/${newsletter.attributes.slug}`} className={styles.card_link}><Button style={"transparent"}><p>Читать</p></Button></a>
    </Card>
    )
  })

  return (
    <Container className={styles.container}>
      <h1 className={styles.header}>Новости</h1>
    
      <div className={styles.tags}>
        {news_tags.map(tag => (
          <Button key={'tag__' + tag} style={"transparent"} className={styles.header_tag + ' ' + (tag == filter ? styles.active : '')} onClick={() => set_filter(prev => prev == tag ? '' : tag)}>
            <Tag name={tag}/>
          </Button>
        ))}
      </div>

      <div className={styles.news_wrapper}>
          {news_cards.length > 0 ? news_cards : <h2 className={styles.empty}>Новостей пока нет, следите за обновлениями!</h2>}
      </div>

      {
        post_count.show < post_count.total &&
        <Button className={styles.load_more} style={"secondary"} onClick={load_more}>Загрузить еще</Button>
      }
    </Container>
  )
}