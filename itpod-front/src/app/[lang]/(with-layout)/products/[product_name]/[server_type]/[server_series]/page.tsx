import NotFound from "@/app/[lang]/(with-layout)/404";
import get_components from "@/controllers/get_components";
import get_page from "@/controllers/get_page";
import { Seo } from "@/types/seo";
import find_by_slug from "@/utils/find_by_slug";
import get_seo from "@/utils/get_seo";
import { ResolvingMetadata, Metadata } from "next";
import { notFound } from "next/navigation";

type props = {
  params: {
    lang: string,
    product_name: string,
    server_series: string,
    server_type: string
  }
}

export async function generateMetadata(
  { params }: props,
  parent: ResolvingMetadata
): Promise<Metadata> {
  // read route params
  const current_lang = params.lang
 
  // fetch data
  const seo_data: Seo = (await get_page('server-serieses', params.server_series, params.lang)).data?.attributes.seo;
  const seo = get_seo(seo_data);

  return seo;
}

export default async function ServerType(props: props) {
  const page = (await get_page('server-serieses', props.params.server_series, props.params.lang)).data?.attributes;

  if (!page) {
    return NotFound();
  }
  const curr_page = `/products/${props.params.product_name}/${props.params.server_type}/${props.params.server_series}`

  const find_type = (await find_by_slug('server-type', props.params.server_type, props.params.lang)).data.attributes.server_series.data;

  if (!page || page.disabled == true || !find_type.find((series:any) => series.attributes.slug == props.params.server_series)) {
    return notFound();
  }

  const components = page.page_blocks ? get_components({blocs: page.page_blocks, locale: props.params.lang, page: page, curr_page}) : [];

  return (
    <>
      {components}
    </>
  )
}