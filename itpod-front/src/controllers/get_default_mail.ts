import { field, form } from "@/types/form";
import compareLang from "@/utils/compareLang";
import axios from "axios";


export default async function get_default_form(location: string): Promise<string> {

  const locale = 'locale=' + compareLang(location);
  
  const api = process.env.NEXT_PUBLIC_API_URL || "https://api.itpod.com";
  const request = `${api}/api/site-setting?${locale}`;

  const response = await axios.get(request, {
    headers: {
      "Authorization": "Bearer " + process.env.NEXT_PUBLIC_API_KEY
    }
  });

  const data = response.data.data.attributes.response_email;
  
  return data;
}