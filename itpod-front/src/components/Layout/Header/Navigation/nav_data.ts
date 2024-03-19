import get_default_form from "@/controllers/get_default_form";
import get_navigation from "@/controllers/get_navigation";
import get_contacts from "@/controllers/get_contacts";
import {form} from '@/types/form';
import {contacts} from '@/types/contact';
import { navItem } from '@/types/navItem';
import { useEffect, useState } from "react";


export default function useNav(curr_lang: string) {
  const [navigation, setNavigation] = useState<Array<navItem>>([]);
  const [contacts, setContacts] = useState<contacts>({
    phone: "",
    email: "",
    address: "",
    time: ""
  });
  const [form, setForm] = useState<form>({
    name: "",
    description: "",
    send_text: "",
    success_message: "",
    form_fields: {
      data: []
    }
  });

  useEffect(() => {
    get_navigation(curr_lang).then(res => setNavigation(prev => res));
    get_contacts(curr_lang).then(res => setContacts(prev => res));
    get_default_form(curr_lang).then(res => setForm(prev => res));
  }, [curr_lang]);

  return {
    navigation,
    contacts,
    form,
  }
}
