import NotFound from "@/app/[lang]/(with-layout)/404";
import compareLang from "@/utils/compareLang";
import axios, { AxiosResponse } from "axios";

export default async function find_by_slug(type: string, page: string, location: string) {
  try {
    const locale = 'locale=' + compareLang(location);
    const api = process.env.NEXT_PUBLIC_API_URL || "https://api.itpod.com";
    
    const request = `${api}/api/slugify/slugs/${type}/${page}?populate=deep&${locale}`;

    const response = await axios.get(request, {
      headers: {
        "Authorization": "Bearer " + process.env.NEXT_PUBLIC_API_KEY
      }
    });

    return response.status === 200 ? response.data : NotFound();
  } catch (err) {
    console.log(err);
    return NotFound();
  }
}