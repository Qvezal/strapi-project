import styles from './banner.module.css'
import page_labels from "./labels.json"
import get_labels from "@/functions/get_labels";
import { field  } from '@/types/form';
import Button from '@/components/std/Button';
import FormPopUp from "@/components/Layout/FormPopUp";
import Arrow from '@/utils/icons/arrow/index';
import Image from 'next/image';
import ReactHtmlParser from 'react-html-parser'

type BannerBlock = {
    locale: string,
    options: {
        background : "light" | "dark" | "gray" | "custom-dark" | "custom-light",
        title : string,
        description : string,
        bottom_description: string,
        theme : "big-with-img" | "with-video" | 'default' | null | undefined,
        img? :  {
            data? : {
              attributes : {
                url : string,
                mime : string
              }
            }
        },
        form? : {
            data? : {
                attributes: {
                  name : string,
                  description : string,
                  send_text : string,
                  privacy : boolean,
                  success_message : string,
                  form_fields : {
                    data : field[]
                  }
                }
              }
        }
        link? : {
            url : string,
            link_text : string,
        },
        list :  {
            id : number | null,
            list_title : string | null,
            list_description : string | null,
            items : [
                {
                    id : number,
                    item : string
                }
            ]
        } 
    }
  }

const getBackroundTheme = (props : BannerBlock) => {
let background = props.options.background;
switch(background) {
    case 'light' : 
        return styles.light
    case 'gray' : 
        return styles.gray   
    default : 
        return styles.dark
}

}

export default async function BannerBlock(props : BannerBlock) {
    const blockTheme = getBackroundTheme(props);
    const title = props.options.title;
    const description = props.options.description?.replace(/<[^>]*>?/gm, '').replace(/&nbsp;/g, " ") || '';
    const bottomDescription = props.options.bottom_description;
    const bannerForm = props.options.form;
    const link = props.options.link;
    const list = props.options.list;
    const theme = props.options.theme;
    const img = props.options.img;

    const background_url = img?.data?.attributes.url ? process.env.NEXT_PUBLIC_API_URL + img.data.attributes.url : '';

    const isDefaultTheme = theme == undefined || theme == null || theme == 'default';
    const withVideoTheme = theme == 'with-video';
    const withImgTheme = theme == 'big-with-img'; 

    const labels = get_labels(page_labels, props.locale);
    
    return (
        <>
        {withVideoTheme ? 
            <div className={styles.banner_with_video}>
                <div className={styles.banner_info + ' ' + styles.dark  + ' ' + styles.banner_block}>
                    <h2>{ReactHtmlParser(title)}</h2>
                    <div className={styles.banner_info_description}>{description}</div>
                    {link && 
                        <a className={styles.link} href={link.url}>
                            <Button style="primary" className={styles.link}>{link.link_text}<Arrow direction='right' type={'arrow_d'}/></Button>
                        </a>
                    }    
                </div>  
                <div className={styles.banner_video + ' ' + styles.banner_block}>
                    <video className={styles.video} src={background_url}  autoPlay loop muted playsInline></video>
                </div>  
            </div> 
        
        : 

        <div className={styles.banner + " " + blockTheme}>
                
            {isDefaultTheme && 
                <>
                {bottomDescription ? 
                    <div className={styles.text_wrapper}>
                        <h2 className={styles.gray_text}>{title.replace(/<[^>]*>?/gm, '')}</h2>  
                        <h2>{ReactHtmlParser(description)}</h2>
                        <h4 className={styles.default_description}>{bottomDescription} <span className={styles.gray_text + ' ' + styles.h4}>{labels.others}</span></h4>
                    </div>
                :
                    <div className={styles.text_wrapper}>
                        <h4 className={styles.gray_text}>{title.replace(/<[^>]*>?/gm, '')}</h4>  
                        <h2 className={styles.default_description}>{ReactHtmlParser(description)}</h2>
                    </div>
                }
                {bannerForm && 
                    <div className={styles.buttons + ' ' + styles.cta_btn}>
                        {bannerForm?.data && 
                            <FormPopUp 
                                button={{
                                    text: bannerForm.data.attributes.send_text,
                                    type: "primary"
                                }} 
                                form={bannerForm.data.attributes} 
                                curr_lang={""}
                            />
                        }
                        {link && 
                        <a className={styles.link} href={link.url}>
                            <Button style="primary" className={styles.link}>{link.link_text}</Button>
                        </a>
                        }
                    </div>
                }
                </>
            }
            {withImgTheme &&
                <>
                    <div className={styles.text_wrapper}>
                        <h2>{ReactHtmlParser(title)}</h2>  
                        <h2 className={styles.gray_text}>{description}</h2>
                        <div className={styles.list_description + ' ' + styles.gray_text}>{list.list_title}</div>
                        <ul className={styles.banner_list}>
                            {list.items.map(elem => <li className={styles.banner_item} key={'banner_item' + elem.item}><h4>{elem.item}</h4></li>) }
                        </ul>
                    </div>
                    <Image src={background_url} alt="background_img" className={styles.banner_background_img} width={400} height={300}/>
                </>
            }
        </div>
        }
        </>
    )
}
