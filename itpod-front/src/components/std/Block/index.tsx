import Container from "../Container";
import styles from "./style.module.css"
import Button from '@/components/std/Button';
import ReactHtmlParser from 'react-html-parser'; 
import FormPopUp from "@/components/Layout/FormPopUp";
import { field, form } from "@/types/form";
import { ReactElement } from "react";
import FormBlock from "@/components/PageComponents/FormBlock";

export default function Block(
  {
    children, 
    options, 
    id, 
    className, 
    title,
    description
  } : { 
    children?: React.ReactNode,
    options: {
      blockType?: string,
      background: "light" | "dark" | "gray" | "custom-dark" | "custom-light",
      custom_background?: {
        data?: {
          attributes: {
            url: string,
            mime: string
          }
        }
      }
      layout?: "horizontal" | "vertical",
      padding?: "top" | "bottom" | "both" | "both--xl",
      expandedForm?: boolean,
      news? : boolean
      form?: {
        data?: {
          attributes: form
        }
      },
      link?: {
        url: string,
        link_text: string,
      },
      merge_text?: boolean,
    },
    id?: string,
    className? : string,
    title? : string,
    description? : string
  }) {

  if ((options.background == "custom-dark") && !options.custom_background?.data) {
    options.background = "light";
  }

  options.layout = options.layout || 'vertical';

  const block_type = options.blockType || "default";

  let block_styles = styles[options.background];
  options.padding && (block_styles += " " + styles[options.padding]);
  className && (block_styles += " " + className);

  let header_styles = styles.info + (options.expandedForm ? " " + styles.info_form : '');
  let dsecription_styles = styles.description;
  if (options.blockType == "first") {
    header_styles += " " + styles.info_first + (options.layout === 'vertical' ? ' ' + styles.info_first_vertical : '');
    dsecription_styles += " " + styles.description_first;
  }

  let titleText;
  if (title) {
    if (options.blockType == "first") {
      titleText = <h1 className={styles.title + ' ' + styles.title_first}>{ReactHtmlParser(title)}</h1>;
    } else {
      titleText = <h2 className={styles.title}>{ReactHtmlParser(title)}
        </h2>;
    }
  }

  let formBlock: boolean | ReactElement = false;
  if ((options.form?.data) || (options.link)) {
    if (options.expandedForm && options.form?.data?.attributes) {
      formBlock = <FormBlock 
        className={styles.form_block} 
        options={{
          form: options.form?.data?.attributes,
          formStyle: "gray",
          firstBlockForm: true
        }}
      />
    } else {
      formBlock = 
        <div className={styles.buttons  + " " + (options.news ? styles.news : '')}>
          {options.form?.data &&
            <FormPopUp 
              button={{
                text: options.form.data.attributes.send_text,
                type: "primary"
              }} 
              form={options.form.data.attributes} curr_lang={""}
            />
          }
          {options.link && <a className={styles.link} href={options.link.url}><Button style="secondary" className={styles.link}>{options.link.link_text}</Button></a>}
        </div>
    }
  }

  const showBlockContent = title || description || (options.form?.data) || (options.link);

  const bg_url = options.custom_background?.data?.attributes.url ? process.env.NEXT_PUBLIC_API_URL + options.custom_background.data.attributes.url : '';

  return (
    <div className={block_styles + " " + styles.block} id={id} style={{backgroundImage: options.custom_background?.data?.attributes.mime !== 'video/mp4' ? 'url(' + bg_url + ')' : 'none'}}>
      {(options.background?.includes("custom") && options.custom_background?.data?.attributes.mime == 'video/mp4') &&
      <div className={styles.video_wrapper}>
        <video className={styles.video} src={bg_url} autoPlay loop muted playsInline></video>
      </div>
      }
      <Container
        className={options.expandedForm ? 'w_expand_form' : undefined}
        blockType={block_type}
        layoutForm={options.layout}
      >
        {options.expandedForm && children}
        {showBlockContent &&
          <div className={header_styles}>
            
            {title && titleText}

            {description && <div className={dsecription_styles}> { ReactHtmlParser (description) } </div>}

            {formBlock && formBlock}

          </div>
        }
        {!options.expandedForm && children}
      </Container>
    </div>
  )
}