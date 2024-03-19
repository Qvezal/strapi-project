import get_page from "@/controllers/get_page"
import { Seo } from "@/types/seo"
import get_seo from "@/utils/get_seo"
import { ResolvingMetadata, Metadata } from "next"
import EventList from "./EventsList"

type props = {
  params: {
    lang: string,
  }
}


export type events = {
  attributes: {
    title: string,
    type: 'offline' | 'online',
    time_end: string,
    time_start: string
    content: string,
    slug: string
  }
}

export async function generateMetadata(
  { params }: props,
  parent: ResolvingMetadata
): Promise<Metadata> {
 
  const seo_data: Seo = (await get_page('page', 'events', params.lang)).data?.attributes.seo;
  const seo = get_seo(seo_data);

  return seo;
}

export default function Allevents(props: props) {

  return <EventList params={props.params}/>
}