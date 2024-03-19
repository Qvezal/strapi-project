import axios from 'axios';
import { NextResponse } from 'next/server'

export async function POST(request: Request) {
  const req = await request.json();

  let response = true;

  const api_request = `${process.env.NEXT_PUBLIC_API_URL}/api/email`;
  const form_lead_request = `${process.env.NEXT_PUBLIC_API_URL}/api/form-leads`;

  let fields = '';

  for (const [key, value] of Object.entries(req.content)) {
    fields += `<p>${key} - ${value}</p>`
  }

  let html = `<p>Cтраница - /${req.current_page}</p><p>Язык - ${req.lang}</p><br>Поля Формы:`

  html += fields;

  req.response_email.forEach(async (email:string | undefined) => {
    if (email) {
      const form_data = {
        to: email,
        subject: 'Заявка с сайта itpod.ru',
        html: html
      }
    
      const api_response = await axios.post(api_request, form_data, {
        headers: {
          "Authorization": "Bearer " + process.env.NEXT_PUBLIC_API_KEY
        }
      });
  
      if (!api_response) {
        response = false
      }
    }
  })

  const lead_data = {
    data : {
      page: '/'+req.current_page,
      lang: req.lang,
      content: fields
    }
  }

  const lead = await axios.post(form_lead_request, lead_data, {
    headers: {
      "Authorization": "Bearer " + process.env.NEXT_PUBLIC_API_KEY
    }
  });

  if (!response || !lead) {
    return NextResponse.json("Error", {status: 400});
  }

  return NextResponse.json("OK", {status: 200});
}