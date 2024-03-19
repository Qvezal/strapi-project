"use client";

import Button from '@/components/std/Button';
import styles from './formblock.module.css'
import Card from '@/components/std/Card'
import Form from '@/components/std/Form'
import { useState } from 'react'

import ReactHtmlParser from 'react-html-parser'
import { form } from '@/types/form';

type FormBlock = {
  className?: string,
  options: {
    form: form,
    formStyle?: 'blue' | 'white' | 'gray'
    firstBlockForm?: boolean,
  }
}

export default function FormBlock(props: FormBlock) {
  const [show_success_message, set_success_message] = useState(false);

  const onSuccessResponse = (value: boolean) => {
    set_success_message(prev => {
      return(value);
    })
  }

  let fieldsStyle: "blue" | "light" | "dark" | "gray";
  let cardStyle: "blue" | "white" | "gray";
  let buttonStyle: "white" | "primary" | "secondary";

  switch (props.options.formStyle) {
    case 'blue':
      cardStyle = "blue";
      fieldsStyle = "blue";
      buttonStyle = "white";
      break;
    case "white":
      cardStyle = "white";
      fieldsStyle = "light";
      buttonStyle = "primary";
      break;
    case "gray":
      cardStyle = "gray";
      fieldsStyle = "gray";
      buttonStyle = "primary";
      break;
    default:
      cardStyle = "blue";
      fieldsStyle = "blue";
      buttonStyle = "white";
      break;
  }


  return (
    <Card style={cardStyle}>
      <div className={styles.wrapper + (props.options.firstBlockForm ? ' ' + styles.wrapper_first_block : '')}>
        <div className={!show_success_message ? styles.left_side : styles.left_side + ' ' + styles.left_side_success}>
          <h2 className={styles.title + ' ' + styles['title-' + cardStyle]}>
            {ReactHtmlParser(!show_success_message ? props.options.form.name : props.options.form.success_message)}
          </h2>
          {!show_success_message && 
            <span className={styles.description + ' ' + styles['description-' + cardStyle]}>{props.options.form.description}</span>
          }
        </div>
        <div className={!show_success_message ? styles.right_side : styles.right_side + ' ' + styles.right_side_hidden}>
            <Form
              form_fields={props.options.form.form_fields.data}
              response_email={props.options.form.response_email}
              button_style={buttonStyle}
              fields_style={fieldsStyle}
              button_text={props.options.form.send_text}
              curr_lang={""}
              onSuccessResponse={onSuccessResponse}
            />
        </div>
        {show_success_message &&
            <Button type="button" style={buttonStyle} className={styles.again_btn}
            onClick={() => {
              set_success_message(prev => false);
            }}>
              Отправить еще
            </Button>
        }
      </div>
    </Card>
  )
}