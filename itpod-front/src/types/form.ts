export type form = {
  name: string,
  description: string,
  send_text: string,
  success_message: string,
  form_fields: {
    data: field[]
  },
  response_email?: string
}

export type field = {
  attributes: {
    name: string,
    type: string,
    placeholder: string,
    required: boolean,
    range_from?: number,
    range_to?: number
    step?: number,
    value?: string
  }
}