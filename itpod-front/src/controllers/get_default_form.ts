import { field, form } from "@/types/form";
import compareLang from "@/utils/compareLang";
import axios from "axios";


export default async function get_default_form(location: string): Promise<form> {

  const locale = 'locale=' + compareLang(location);
  
  const api = process.env.NEXT_PUBLIC_API_URL || "https://api.itpod.com";
  const request = `${api}/api/site-setting?populate=deep&${locale}`;

  const response = await axios.get(request, {
    headers: {
      "Authorization": "Bearer " + process.env.NEXT_PUBLIC_API_KEY
    }
  });

  const data = response.data.data.attributes.footer_form.data.attributes;

  const fields = data.form_fields.data.map((field:field) => {

    return ({
      attributes: field.attributes
    })
  })

  const form: form = {
    name: data.name,
    description: data.description,
    send_text: data.send_text,
    success_message: data.success_message,
    response_email: data.response_email,
    form_fields: {
      data: fields
    }
  }
  
  return form;
}