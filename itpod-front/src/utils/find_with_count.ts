import axios from "axios";
import compareLang from "./compareLang";

export default async function find_with_count(type: string,location: string, first?: boolean, filter?: string, skip?: number) {

  // const filters = 'filters[slug]=' + slug;
  const paginate = `&pagination[limit]=${first ? 9 : 6}`;
  const post_filter = filter ? `&filters[${type == 'newsletters' ? 'news_tags' : ''}][name][$eq]=${filter}` : '';
  const post_skip = `&pagination[start]=${skip ? skip : 0}`;
  const locale = '&locale=' + compareLang(location);
  // console.log('in req', type)
  const request = `${process.env.NEXT_PUBLIC_API_URL}/api/${type}?populate=deep${post_filter}${paginate}${post_skip}${locale}`;
  const response = await axios.get(request, {
    headers: {
      "Authorization": "Bearer " + process.env.NEXT_PUBLIC_API_KEY
    }
  });
  // console.log('in responce' ,  response)
  return response.data
}