import page_labels from "./labels.json"
import get_labels from "@/functions/get_labels";
import { form } from "@/types/form";
import { Seo } from "@/types/seo";


// Temp import
import get_components from "@/controllers/get_components";
import get_page from "@/controllers/get_page";
import { notFound } from "next/navigation";
import { Metadata, ResolvingMetadata } from "next";
import get_seo from "@/utils/get_seo";
import find_many from "@/utils/find_many";


type props = {
  params: {
    lang: string
  }
}

type field = {
  name: string,
  type: string,
  placeholder: string,
  required: boolean,
}

type blockParams = {
  firstBlock: {
    blockType: "default" | "first",
    layout: "vertical" | "horizontal",
    background: 'light' | 'dark' | 'gray',
    padding?: 'tob'| 'bottom'| 'both'
    type?: 'first',
    title?: string,
    description?: string
    content?: string,
    form?: {
      useForm: boolean,
      form_data: form
      formText: string,
    },
    link?: {
      useLink: boolean,
      link: string,
      linkText: string,
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
  const seo_data = (await get_page('page', 'main', current_lang)).data?.attributes.seo;
  const seo = get_seo(seo_data);

  return seo;
}


export default async function Index(props: props) {
  const current_lang = props.params.lang;

  const page = (await get_page('page', 'main', current_lang)).data?.attributes;

  if (!page) {
    notFound();
  }

  const components = page.page_blocks ? get_components({blocs: page.page_blocks, locale: props.params.lang}) : []
  
  const labels = get_labels(page_labels, current_lang);
  return (
    <>
      {components}
    </>
  )
}