import get_components from "@/controllers/get_components";
import get_page from "@/controllers/get_page";
import { Seo } from "@/types/seo";
import get_seo from "@/utils/get_seo";
import { ResolvingMetadata, Metadata } from "next";
import NotFound from "../../404";

type props = {
  params: {
    lang: string,
    product_name: string,
  }
}

export async function generateMetadata(
  { params }: props,
  parent: ResolvingMetadata
): Promise<Metadata> {
  // read route params
  const current_lang = params.lang
 
  // fetch data
  const seo_data: Seo = (await get_page('product', params.product_name, params.lang)).data?.attributes.seo;
  const seo = get_seo(seo_data);

  return seo;
}

export default async function Product(props: props) {

  const page = (await get_page('product', props.params.product_name, props.params.lang)).data?.attributes;

  if (!page || page.disabled == true) {
    return NotFound();
  }

  const components = page.page_blocks ? get_components({blocs: page.page_blocks, locale: props.params.lang, page: page}) : [];

  return (
    <>
      {components}
    </>
  )
}