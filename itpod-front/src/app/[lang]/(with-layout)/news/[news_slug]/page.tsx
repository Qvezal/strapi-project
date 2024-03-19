import Container from "@/components/std/Container";
import find_by_slug from "@/utils/find_by_slug";
import NotFound from "../../404";
import styles from './news.module.css';
import Block from "@/components/std/Block";
import ContentBlock from "@/components/PageComponents/ContentBlock";
import Tag from "../Tag";
import find_with_count from "@/utils/find_with_count";
import AnotherNews from "./AnotherNews";
import get_page from "@/controllers/get_page";
import { Seo } from "@/types/seo";
import get_seo from "@/utils/get_seo";
import { ResolvingMetadata, Metadata } from "next";

type props = {
  params: {
    lang: string,
    news_slug: string,
  }
}

export async function generateMetadata(
  { params }: props,
  parent: ResolvingMetadata
): Promise<Metadata> {
 
  // fetch data
  const seo_data: Seo = (await get_page('newsletter', params.news_slug, params.lang)).data?.attributes.seo;
  const seo = get_seo(seo_data);

  return seo;
}

export default async function News(props: props) {

  const news = (await find_by_slug('newsletter', props.params.news_slug, props.params.lang)).data?.attributes;
  const another = (await find_with_count('newsletters', props.params.lang, false, news.news_tags.data[0].attributes.name)).data

  if (!news) {
    return NotFound();
  }

  return (
    <>
      <Container>
        <div className={styles.head}>
          <h1>{news.title}</h1>
          <div className={styles.info}>
            <span className={styles.date}>{(new Date(news.publishedAt)).toLocaleDateString("ru", {year: "numeric", day: 'numeric', month: 'long', timeZone:'UTC'})}</span>
            <div className={styles.tags_block}>
              {news.news_tags.data.map((tag: any) => 
                  <div className={styles.info_block} key={'tag__' + tag}>
                    <p>
                      <span>{tag.attributes.name}</span>
                    </p>
                  </div>
              )}
            </div>
          </div>
        </div>
        <div className={styles.news}>
          <ContentBlock options={{
            content: news.content,
            custom_mobile_content: false,
          }}/>
        </div>
      </Container>
      <Block options={{
        background: "gray",
        layout: 'vertical',
        padding: 'both',
      }}>
        <h2>Похожие Новости</h2>
        <AnotherNews news={another}/>
      </Block>
    </>
  )
}