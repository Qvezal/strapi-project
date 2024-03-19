import Card from "@/components/std/Card"
import styles from './card.module.css'
import Image from "next/image"
import ReactHtmlParser from 'react-html-parser';
import { field } from "@/types/form"
import FormPopUp from "@/components/Layout/FormPopUp"
export type AdvantagesCardType = {
  title: string,
  bigger_title: boolean,
  description: string,
  nums_in_row: number,
  less_min_height: boolean,
  name: string,
  image?: string
  cardColor: string,
  list?: {
    list_title?: string,
    list_description?: string,
    items: {
      item: string,
      bigger_text: boolean
    }[]
  }[],
  form?: {
    data?: {
      attributes: {
        name: string,
        description: string,
        send_text: string,
        privacy: boolean,
        success_message: string,
        form_fields: {
          data: field[]
        }
      }
    }
  },
}

export default function AdvantagesCard(props: AdvantagesCardType) {

  const createCardList = () => {
    if (props.list && props.list.length > 0) {
      let listArray = [];

      for (let oneOfLists of props.list) {
        
        const listHeader = oneOfLists.list_title ? 
          <span className={styles.list_header}>{oneOfLists.list_title}</span> : '';

        const listDesc = oneOfLists.list_description ? 
          <span className={styles.list_description}>{oneOfLists.list_description}</span> : '';
        
          
        const lis = oneOfLists.items.map((item, index) => 
          <li className={item.bigger_text ? styles.list_li_big : styles.list_li} key={'advantage' + item.item + index}>
            { props.name == 'cards' ? <h4>{item.item}</h4> : 
            item.bigger_text ? <h3>{item.item}</h3> : <>{item.item}</>
            }
          </li>
        )
      
        const ul = <ul>{lis}</ul>;

        listArray.push(
          <div className={styles.list_wrapper + (oneOfLists.items.length == 1 ? ' ' + styles.list_wrapper_short : '')}>
            {listHeader && listHeader}
            {listDesc && listDesc}
            {ul}
          </div>
        );
      }
      
      let listsBlock = <div className={styles.lists_wrapper}>{listArray}</div>;

      return listsBlock;

    } else {
      return false
    }
  }

  const cardTitle = props.bigger_title ? (props.name == 'card-cta' ? <h3>{ReactHtmlParser(props.title)}</h3> : <h2>{ReactHtmlParser(props.title)}</h2>) : <h4>{ReactHtmlParser(props.title)}</h4>

  const cardListElem = createCardList();


  let cardColor: "white" | "transparent" | "gray" | "blue";
  switch (props.cardColor) {
    case 'light':
    case 'custom-light':
      cardColor = "gray";
      break;
    case 'custom-dark':
    case 'dark':
    case 'gray':
      cardColor = "white"
      break;
    default:
      cardColor = "gray";
      break;
  }

  return (
    <Card style={cardColor} 
      className={
        styles.card
        + (cardListElem ? ' ' + styles.card_w_list : '')
        + (cardListElem && props.nums_in_row == 1 ? ' ' + styles.card_one_w_list : '')
        + (props.name == 'card-cta' ? ' ' + (props.less_min_height ? styles.w_cta_small : styles.w_cta) : '')
      }
    >
      <div className={styles.card_header + (cardListElem ?  ' ' + styles.flex_column : '') + (cardListElem && props.nums_in_row == 1 ? ' ' + styles.card_header_one : '')}>
        {cardTitle}
        {props.image &&
          <Image src={props.image} className={styles.img} height={56} width={56} alt={"advantages_card"}/>
        }
        {(cardListElem) && 
          <p className={styles.description + ' ' + styles.description_head}>{props.description}</p>
        }
      </div>

      <div className={styles.content_wrapper  + (props.nums_in_row == 1 ? ' ' + styles.content_wrapper_one : '')}>
      
        {!cardListElem && <p className={styles.description}>{props.description}</p>}

        {cardListElem && 
          cardListElem
        }

        {props.form?.data &&
            <div className={styles.form_btn_wrapper}>
              {props.form?.data && 
                <FormPopUp className={styles.form_btn}
                  button={{
                    text: props.form.data.attributes.send_text,
                    type: "primary"
                  }} 
                  form={props.form.data.attributes} curr_lang={""}
                />
              }
            </div>
        }

      </div>

    </Card>
  )
}