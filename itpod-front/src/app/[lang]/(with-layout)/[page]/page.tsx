import Block from "@/components/std/Block";
import get_page from "@/controllers/get_page"
import styles from './page.module.css'
import get_components from "@/controllers/get_components";
import { Seo } from "@/types/seo";
import { ResolvingMetadata, Metadata } from "next";
import get_seo from "@/utils/get_seo";
import NotFound from "../404";

type props = {
  params: {
    lang: string,
    page: string
  }
}

export async function generateMetadata(
  { params }: props,
  parent: ResolvingMetadata
): Promise<Metadata> {
 
  // fetch data
  if (params.page) {
    const seo_data: Seo = (await get_page('page', params.page, params.lang)).data?.attributes.seo;
    const seo = get_seo(seo_data);

    return seo;
  }

  return {}
}

export default async function Page(props: props) {

  let page

  if (props.params.page) {
    page = (await get_page('page', props.params.page, props.params.lang)).data?.attributes;
  }

  if (!page) {
    return NotFound();
  }

  const components = page.page_blocks ? get_components({blocs: page.page_blocks, locale: props.params.lang}) : []

  const firstBlockName = page.page_blocks[0].__component.split('.')[1]

  return (
    <>
      {firstBlockName != 'first-block' && 
        <Block options={{
          background: "light",
          layout: 'vertical',
        }}>
          <h1 className={styles.name}>{page.title}</h1>
        </Block>
      }
      {components}
    </>
  )
}
