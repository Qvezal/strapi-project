"use client"
import Button from '@/components/std/Button';
import ReactHtmlParser from 'react-html-parser';

export default function ServerSlide({data, lang, style} : {data: any, lang: string , style: any}) {

    let server = data.attributes;
    const styles = style.all;
    //the names
    const serverSeries = server.server_series.data?.attributes.title;
    const serverType = server.server_type.data ? server.server_type.data.attributes.title : '';
    const serverModel = server.title;
    const serverDescription = ReactHtmlParser(server.description || '');
    const serverName = serverType ? serverType + '-' + serverModel : serverModel;

    //the slugs
    const serverSeriesSlug = server.server_series.data?.attributes.slug;
    const serverTypeSlug = server.server_type.data ? server.server_type.data.attributes.slug : '';
    const serverSlug = server.slug;
    
    //the urls
    const serverTypeUrl = serverTypeSlug ? serverTypeSlug + '/' : ''; 
    const serverSeriesUrl = serverSeries ? serverSeriesSlug + '/' : ''; 
    const server_link =  '/products/server-equipment/' + serverTypeUrl + serverSeriesUrl + serverSlug;
  
    //the contents
    const imgData = server.slider_img.data;
    const img = imgData ? imgData.attributes.url : '' ;
    const server_img = img? process.env.NEXT_PUBLIC_API_URL + img : '';

    return (
        <div className={styles.slider} key={data.id}>
          <div className={styles.img_wrapper}>
            <img src={server_img} alt="server" className={styles.slider_img}/>
          </div>
          <div className={styles.info}>
            <h3 className="">{serverSeries}</h3>
            <h3 className={styles.gray + ' ' + styles.server_name}>{serverName}</h3>
            <p className={styles.gray + ' ' + styles.description}>{serverDescription}</p>
            <a className={styles.link} href={server_link}>
                <Button style="primary" className={styles.link}>Подробнее</Button>
            </a>
          </div>
        </div>
    )
}