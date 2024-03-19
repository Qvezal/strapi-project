import axios from "axios";
import compareLang from "../utils/compareLang";
import { navItem } from "@/types/navItem";

export default async function get_navigation(location: string): Promise<Array<navItem>> {


  const locale = 'locale=' + compareLang(location);
  
  const api = process.env.NEXT_PUBLIC_API_URL || "https://api.itpod.com";
  const id = process.env.NEXT_PUBLIC_DEV ? '2' : '13';
  const request = `${api}/api/navigation/render/${id}?${locale}`;

  const response = await axios.get(request, {
    headers: {
      "Authorization": "Bearer " + process.env.NEXT_PUBLIC_API_KEY
    }
  });

  let navigation: Array<navItem> = [];
  response.data.forEach((item:any) => {
    if (!item.parent) {
      navigation.push(item);
    } else {
      const parent = navigation.find(nav_item => nav_item.id == item.parent.id);
      delete item.parent;
      
      if (parent) {
        if (!Array.isArray(parent.childs)) {
          parent.childs = [item];
        } else {
          parent.childs.push(item);
        }
      }
    }
  });

  return navigation
}