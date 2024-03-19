import Container from "@/components/std/Container"
import styles from './server.module.css'
import block_styles from '@/components/PageComponents/RelationBlock/relation.module.css'
import find_by_slug from "@/utils/find_by_slug"
import ServerImages from "./serverImages"
import OtherServers from "./otherServers"
import get_default_form from "@/controllers/get_default_form"
import FormPopUp from "@/components/Layout/FormPopUp"
import ReactHtmlParser from 'react-html-parser'
import Card from "@/components/std/Card"
import Image from "next/image"

import arrow from './icon_16x16_M_Arrow-top-2_2.svg'
import Block from "@/components/std/Block"

import get_page from "@/controllers/get_page"
import PageLink, { link } from "@/components/std/PageLink"
import { Seo } from "@/types/seo"
import get_seo from "@/utils/get_seo"
import { ResolvingMetadata, Metadata } from "next"
import NotFound from "@/app/[lang]/(with-layout)/404";

type props = {
  params: {
    lang: string,
    product_name: string,
    server_series: string,
    server_type: string,
    server_name: string,
  }
}

type document = {
  name: string,
  file: {
    data: {
      attributes: {
        url: string,
      }
    }
  }
}

export async function generateMetadata(
  { params }: props,
  parent: ResolvingMetadata
): Promise<Metadata> {
  // read route params
  const current_lang = params.lang
 
  // fetch data
  const seo_data: Seo = (await find_by_slug('server', params.server_name, params.lang)).data?.attributes.seo;
  const seo = get_seo(seo_data);

  return seo;
}

export default async function ServerType(props: props) {

  const server = (await find_by_slug('server', props.params.server_name, props.params.lang)).data?.attributes;

  if (!server) {
    return NotFound();
  }

  const type = props.params.server_type == 'vstack-r' ? 'vStack-R-' : '?';
  const form = await get_default_form(props.params.lang);

  const servers = server.related.data?.map((server:any) => {
    const server_data = server.attributes;
    const processor = server_data.server_processor.data.attributes;

    const link: link = {
      image: server_data.card_img || 'g2',
      disabled: false,
      data: {
        title: server_data.title,
        description: server_data.description,
        url: server_data.slug
      }
    }

    return <PageLink slider background={"white"} key={"link"+processor.name+server_data.title} link={link}/>
  })

  const documents = server.documents.map((doc: document) => {
    const doc_link = `${process.env.NEXT_PUBLIC_API_URL}${doc.file.data.attributes.url}`;
    return (
      <a className={styles.anchor} href={doc_link} target="_blank" key={'doc-' + doc.name}>
        <Card className={styles.link} style={'gray'}>
          <h4>{doc.name}</h4>
          <span>Посмотреть документацию <Image src={arrow} alt="arrow"/></span>
        </Card>
      </a>
    )
  })

  return (
    <>
    <Container>
      <div className={styles.server}>
        <div className={styles.image_wrapper}>
          <ServerImages imgs={server.imgs.data}/>
        </div>
        <div className={styles.info}>
            <h1 className={styles.title}><span>{type}</span><br className={styles.mobile_br}/>{server.title}</h1>
            <FormPopUp className={styles.form} button={{type:"primary", text: "Оставить заявку"}} form={form} curr_lang={props.params.lang} />
            <div className={styles.conf}>
              {ReactHtmlParser(server.specs)}
            </div>
            <div className={styles.links}>
              <Card className={styles.link} style={'gray'}>
                <h4>Техническая поддержка на клиентском портале</h4>
                <a href="/portal" target="_blank">Перейти на портал <Image src={arrow} alt="arrow"/></a>
              </Card>
              {documents}
            </div>
        </div>
      </div>
    </Container>
    {
      servers.length > 0 &&
      <Block options={{background: 'light', padding: 'both'}}>
      <Card style={"gray"} className={block_styles.relation}>
        <h2 className={block_styles.title + ' ' + styles.title}>Другие серверы из этой серии </h2>
        <div className={block_styles.links + ' ' + styles.swiper_wrapper}>
          <OtherServers servers={servers}/>
        </div>
        <div className={styles.desctop}>
          {servers}
        </div>
      </Card>
    </Block>
    }
  </>
  )
}