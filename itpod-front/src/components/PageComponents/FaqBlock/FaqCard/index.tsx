"use client"
import Card from "@/components/std/Card"

import styles from "./faqcard.module.css"
import plus from "./btn_plus.svg"
import minus from "./btn_minus.svg"

import Image from "next/image"
import { Dispatch, SetStateAction, useState } from "react"
import Button from "@/components/std/Button"

type props = {
  question: string,
  answer: string,
  show_answer: number,
  set_show_answer: Dispatch<SetStateAction<number>>,
  list: number
}

export default function FaqCard(props: props) {

  const check_show = props.show_answer == props.list

  return (
    <Button style="transparent"
      className={styles.question_wrapper}
      onClick={() => {
        if (props.show_answer == props.list) {
          props.set_show_answer(99);
        } else {
          props.set_show_answer(props.list);
        }
      }}>
      <Card style="white" className={styles.faq_card  + " " + (check_show && styles.opened)}>
          <div className={styles.question_wrapper}>
            <div className={styles.title}>
              <h4 className={styles.question}>{props.question}</h4>
            </div>
            <Image className={styles.faq_btn} src={check_show ? minus : plus} alt="plus"/>
          </div>
          <div className={styles.answer  + " " + (check_show && styles.answer_show)}>
            <span>{props.answer}</span>
          </div>
      </Card>
    </Button>
  )
}