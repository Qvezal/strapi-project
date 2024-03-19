"use client"
import get_labels from '@/functions/get_labels'
import styles from './cookie.module.css'
import labels_file from './labels.json'
import { setCookie } from "cookies-next";
import Button from '@/components/std/Button';
import { useState } from 'react';

export default function Cookie({curr_lang}: {curr_lang: string}) {
  const [show_cookie, set_show_cookie] = useState(true)
  const labels = get_labels(labels_file, curr_lang);
  const accept_cookie = () => {
    setCookie('accept-cookie', true)
    set_show_cookie(false)
  }

  return (
    show_cookie &&
    <div className={styles.cookie}>
      <p className={styles.text}>{labels.cookie}</p>
      <Button className={styles.btn} style={'secondary'} onClick={accept_cookie}>{labels.button}</Button>
    </div>
  )
}