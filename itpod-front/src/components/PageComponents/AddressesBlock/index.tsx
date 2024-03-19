"use client"
import useTabs from '@/utils/tabs';
import styles from './addresses.module.css';
import find_many from '@/utils/find_many';
import Card from '@/components/std/Card';
import ReactHtmlParser from 'react-html-parser';

export default function AddressesBlock({lang, options} : {lang: string, options: any}) {
    const get_data = find_many('addresses', lang).then(res => {
        const data = res.map((tab:any) => {
          return {
            name: tab.attributes.city,
            content: tab.attributes
          }
        });
    
        return data
      });
    
    const tabStyle = options.color;

    const {current_tab, tab_head} = useTabs(get_data, lang, styles.head, tabStyle);

    return (

        <div className={styles.wrapper}>
            <Card style="gray" className={styles.address_card}>
                <div className={styles.tab_head_wrapper}>
                    {tab_head}
                </div>
                <div className={styles.content}>
                    <div className={styles.top_content}>
                        <h4 className={styles.address}>{current_tab.content.address}</h4>
                        <h4 className={styles.hours}>{current_tab.content.hours}</h4>
                    </div>
                    <div className={styles.bottom_content}>
                        <h4 className={styles.phone}>{current_tab.content.phone}</h4>
                        <h4 className={styles.mail}>{current_tab.content.mail}</h4>
                    </div>
                </div>
            </Card>
            <div className={styles.map_card}>
                {ReactHtmlParser(current_tab.content.map)}
            </div>
        </div>

    );
}