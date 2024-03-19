import axios from "axios";

export default async function send_message(content: any, page: string, response_email?: Array<string | undefined>) {
  const url = page.split("/");
  const lang = url[3];
  const current_page = url.slice(4, url.length).join('/');

  const request = {
    current_page,
    lang,
    content,
    response_email
  }

  return await axios.post('/api/send_message', request)
}