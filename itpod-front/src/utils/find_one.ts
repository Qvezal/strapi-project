import axios from "axios";
import compareLang from "./compareLang";

export default async function find_one(type: string, slug: string, location: string) {

  const filters = 'filters[slug]=' + slug;
  const locale = 'locale=' + compareLang(location);
  const api = process.env.NEXT_PUBLIC_API_URL || "https://api.itpod.com";
  
  const request = `${api}/api/${type}?populate=deep&${filters}&${locale}`;

  const response = await axios.get(request, {
    headers: {
      "Authorization": "Bearer " + process.env.NEXT_PUBLIC_API_KEY
    }
  });

  return response.data
}