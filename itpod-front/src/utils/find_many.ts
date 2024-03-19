import axios from "axios";
import compareLang from "./compareLang";
import NotFound from "@/app/[lang]/(with-layout)/404";

export default async function find_many(type: string, location: string, filterString?: string) {
  try {
    const api = process.env.NEXT_PUBLIC_API_URL || "https://api.itpod.com";
    
    let request = `${api}/api/${type}?populate=deep&locale=${compareLang(location)}`;

    if (filterString) {
      request += `&filters${filterString}`;
    }

    const response = await axios.get(request, {
      headers: {
        "Authorization": "Bearer " + process.env.NEXT_PUBLIC_API_KEY
      }
    });

    return response.data.data
  } catch (err) {
    console.log(err);
    return NotFound();
  }
}