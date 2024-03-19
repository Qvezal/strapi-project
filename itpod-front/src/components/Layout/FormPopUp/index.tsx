"use client"

import Button from "@/components/std/Button"
import Card from "@/components/std/Card"
import Overlay from "@/components/std/Overlay"

import {useState} from "react"
import Image from "next/image"

import ReactHtmlParser from 'react-html-parser'

import close from './icon_16x16_M_Close.svg'
import styles from './formPopUp.module.css'
import Form from "@/components/std/Form"
import { form } from "@/types/form"

type FormPopUp = {
  button?: {
    text?: string,
    type: "primary" | "secondary" | "white" | "transparent" | "none"
  },
  form: form,
  curr_lang: string,
  onclick?: () => void,
  className?: string,
  show?: boolean,
  prevent_default?: boolean
}

export default function FormPopUp(props: FormPopUp) {
  const [show_form, set_show_form] = useState(props.button ? false : true);
  const [show_success_message, set_success_message] = useState(false);

  const onSuccessResponse = (value: boolean) => {
    set_success_message(prev => {
      return(value);
    })
  }

  return (
    <>
      {
        (show_form || props.show) &&
        <Overlay close={() => {!props.prevent_default ? set_show_form(prev => false) : (props.onclick && props.onclick())}} className={styles.overlay}>
          <div className={styles.popup_container}>
            <Card style={"white"} className={styles.popup}>
              <div className={styles.header}>
                <h2>{ReactHtmlParser(!show_success_message ? props.form.name : props.form.success_message)}</h2>
                <Button style="secondary"
                  className={styles.close}
                  onClick={() => {
                    !props.prevent_default ? set_show_form(prev => false) : (props.onclick && props.onclick())
                    set_success_message(prev => false);
                    }}>
                  <Image src={close} alt="close" width={16} height={16}/>
                  </Button>
              </div>
              {
              !show_success_message && 
                <>
                  <p className={styles.description}>{ReactHtmlParser(props.form.description)}</p>
                  <Form 
                    form_fields={props.form.form_fields.data}
                    response_email={props.form.response_email}
                    button_style={"primary"}
                    fields_style={"light"}
                    button_text={props.form.send_text}
                    curr_lang={props.curr_lang}
                    onSuccessResponse={onSuccessResponse}
                  />
                </>
              }
              {
              show_success_message &&
                <Button type="button" style={"primary"} className={styles.again_btn}
                onClick={() => {
                  set_success_message(prev => false);
                }}>
                  Отправить еще
                </Button>
              }
            </Card>
          </div>  
        </Overlay>
      }
      {(props.button && props.button.type != 'none') &&
        <Button className={props.className} style={props.button.type} onClick={() => {
          props.onclick && props.onclick();
          set_show_form(prev => true);
        }}>{props.button.text}</Button>
      }
    </>
    
  )
}