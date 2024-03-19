import find_many from "@/utils/find_many";

type contacts = {
  phone: string
  email: string,
  address: string,
  time: string
}

export default async function get_contacts(location: string): Promise<contacts> {

  const response = await find_many('site-contact', location);
  return response.attributes;
}