import Card from '@/components/std/Card'
import styles from './contacts.module.css'
import { contacts } from '@/types/contact'
import get_labels from '@/functions/get_labels';
import page_labels from "./labels.json"
import get_contacts from '@/controllers/get_contacts';

export default async function ContactsBlock({locale}: {locale: string}) {

    const labels = get_labels(page_labels, locale);

    const contacts = await get_contacts(locale);

    return (
        <div className={styles.grid}>
            <Card style={"gray"} className={styles.contact_card}>
                <span className={styles.contact_title}>{labels.title_phone}</span>
                <div className={styles.info_wrapper}>
                    <a href={"tel:+"+contacts.phone} className={styles.link}><h4 className={styles.main_info}>{contacts.phone}</h4></a>
                    <a href={"mailto:" + contacts.email} className={styles.link}><h4>{contacts.email}</h4></a>
                </div>
            </Card>
            <Card style={"gray"} className={styles.contact_card}>
                <span className={styles.contact_title}>{labels.title_address}</span>
                <div className={styles.info_wrapper}>
                    <h4 className={styles.main_info}>
                        {contacts.address}
                    </h4>
                    <h4 className={styles.time}>
                        {contacts.time}
                    </h4>
                </div>
            </Card>
        </div>
    )
  }