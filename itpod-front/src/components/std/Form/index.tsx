"use client"

import { HtmlHTMLAttributes, useEffect, useState } from "react"

import Button from "../Button"
import Input from "./Input"

import styles from "./form.module.css"

import form_labels from "./labels.json"
import get_labels from "@/functions/get_labels"

import send_message from "./send_msg"
import CloseImg from "./close"
import { field } from "@/types/form"

import ReactHtmlParser from 'react-html-parser'
import get_default_mail from "@/controllers/get_default_mail"
import { fields_regex } from "@/data/forms"

type props = {
  form_fields: field[],
  button_style: "transparent" | "primary" | "secondary" | "white",
  button_text: string,
  response_email?: string
  fields_style: "light" | "gray" | "dark" | "blue"
  curr_lang: string
  action?: () => void,
  success?: React.ReactNode,
  id?: string,
  onSuccessResponse: (value: boolean)=>void
}

export default function Form(props: props) {
  const labels = get_labels(form_labels, props.curr_lang);

  const [default_mail, set_default_mail] = useState("")

  useEffect(() => {
      get_default_mail(props.curr_lang).then(res => set_default_mail(res));
  },[props.curr_lang])

  let input_values : any = {}

  props.form_fields.map(field => {
    if (field.attributes.range_from && field.attributes.step) {
      return input_values[field.attributes.name] = field.attributes.range_from + field.attributes.step
    }

    if (field.attributes.value) {
      return input_values[field.attributes.name] = field.attributes.value
    }

    return input_values[field.attributes.name] = "";
  })

  const [form_data, set_form_data] = useState<any>(input_values)

  const handle_change = (event: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    event.preventDefault();
    if (event.target.validity.customError) {
      event.target.setCustomValidity("");
    }
    const {name, value} = event.target;

    set_form_data((prev : any) => {
      return {
        ...prev,
        [name]: value
      }
    })
  }


  const inputs = props.form_fields.map((field, index) => {
    if (field.attributes.type === 'range') {
      const change_range = (name: string, action: 'plus' | 'minus') => {

        let new_value = form_data[name];

        if (action === 'plus' && form_data[name] + field.attributes.step <= field.attributes.range_to!) {
          new_value += field.attributes.step
        }
        if (action === 'minus' && form_data[name] - field.attributes.step! >= field.attributes.range_from!) {
          new_value -= field.attributes.step!
        }

        set_form_data((prev : any) => {
          return {
            ...prev,
            [name]: new_value
          }
        })
      }

      return <Input change_range={change_range} onChange={handle_change} setting={field} key={'form_input_'+field.attributes.name+index} style={props.fields_style} value={form_data[field.attributes.name]}/>

    } else {
      return <Input onChange={handle_change} setting={field} key={'form_input_'+field.attributes.name+index} style={props.fields_style} value={form_data[field.attributes.name]}/>
    }
  })

  const [sended, set_sended] = useState(false);

  const handle_submit = (e: React.SyntheticEvent) => {
    e.preventDefault();
    set_sended(true);

    let errored: any[] = [];

    //@ts-ignore
    const target = (e.target as typeof e.target).childNodes.forEach((node: HTMLDivElement) => {
      const inputNode = node.firstChild as HTMLInputElement;
      let sending_data = structuredClone(form_data);
      sending_data['phone'] = sending_data['phone'].replace(/^(\+)|\D/g, "$1");

      if (inputNode.required && sending_data[inputNode.name] === "") {
        errored.push(inputNode);
      } else {
        switch (inputNode.name) {
          case "email":
            if (!fields_regex[inputNode.name].test(sending_data[inputNode.name])) {
              errored.push(inputNode)
            }
            break;
          case "phone":
            console.log(sending_data[inputNode.name])
            if (!fields_regex[inputNode.name].test(sending_data[inputNode.name])) {
              errored.push(inputNode)
            }
            break;
        } 
      }     
    });

    
    if (errored.length == 0) {
      set_sended(false);
      props.action && props.action();
      send_message(form_data, window.location.href, [default_mail, props.response_email])
      .then(res => {
        props.onSuccessResponse(true);
      })
      .catch(err => {
        // set_show_answer(prev => {
        //   return("error");
        // })
      })
    } else {
      errored.forEach(err => {
        // console.log(err.nextElementSibling.nextElementSibling)
        err.setCustomValidity("Invalidity placeholder");
        // err.nextSibling.nextSibling.styles = 'display: block';
      });
    }
  }

  return (
    <form className={styles.form + " " + (sended && styles.sended)} id={props.id} onSubmit={handle_submit} noValidate>
    {inputs}
    <div className={styles.footer_wrapper}>
      <Button type="submit" style={props.button_style} className={styles.form_btn}>{props.button_text}</Button>
      <span className={styles.privacy_policy + ' ' + styles['privacy_policy-' + props.fields_style]}>
        {ReactHtmlParser("Нажимая на кнопку, вы соглашаетесь на обработку <a href='/privacy-policy'>персональных данных</a>")}
      </span>
    </div>
  </form>
  )
}