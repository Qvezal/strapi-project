import Card from "@/components/std/Card";
import styles from './sideAction.module.css'
import FormPopUp from "@/components/Layout/FormPopUp";
import { contacts } from "@/types/contact";
import { form } from "@/types/form";
import Button from "@/components/std/Button";


type action_data = {
  contacts?: contacts,
  form?: form,
  close?: () => void,
}

export default function SideAction({action, action_data, curr_lang}:{action: 'contacts' | 'form', action_data: action_data, curr_lang: string}) {

  return (
    <Card style={"gray"} className={styles.card}>
      {
        action == 'contacts'?
        <>
          <div className={styles.contacts}>
            <a href={`tel:${action_data.contacts?.phone}`}><h5>{action_data.contacts?.phone}</h5></a>
            <a href={`mailto:${action_data.contacts?.email}`}><p>{action_data.contacts?.email}</p></a>
          </div>
          <p className={styles.address}>{action_data.contacts?.address}</p>
        </>
        :
        <>
          <h5>{action_data.form?.description}</h5>
          {action_data.form &&
            <Button style="transparent" className={styles.form} onClick={action_data.close}>{action_data.form?.send_text}</Button>
          }
        </>
      }
    </Card>
  )
}