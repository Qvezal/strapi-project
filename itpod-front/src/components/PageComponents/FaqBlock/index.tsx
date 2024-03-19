"use client"
import get_labels from "@/functions/get_labels"
import page_labels from "./labels.json"

// import questions from "./questions"
import styles from "./faqblock.module.css"
import FaqCard from "./FaqCard"
import { useState } from "react"

type FaqBlock = {
  options: {
    curr_lang: string
    questions: [
      {
        question: string,
        answer: string
      }
    ]
  }
}

export default function FaqBlock(props: FaqBlock) {

  const [show_answer, set_show_answer] = useState(99);

  const faq_questions = props.options.questions.map((question, pos)  => {

    return (
      <>
        <FaqCard question={question.question} answer={question.answer} show_answer={show_answer} set_show_answer={set_show_answer} list={pos}/>
      </>
    )
  })


  return (
    <div className={styles.faq_wrapper}>
      {faq_questions}
    </div>
  )
}