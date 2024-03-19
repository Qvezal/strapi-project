import ContentBlock from "@/components/PageComponents/ContentBlock"
import Container from "@/components/std/Container"
import find_many from "@/utils/find_many"
import styles from './privacy.module.css'

type props = {
  params: {
    lang: string,
  }
}

export default async function PrivacyPolicy(props: props) {

  const privacy = await find_many('privacy-policy', props.params.lang);

  return (
    <Container>
      <h1>
        Политика в отношении обработки персональных данных
      </h1>
      <div className={styles.privacy}>
        <ContentBlock options={{
          content: privacy.attributes.privacy,
          custom_mobile_content: false,
        }}/>
      </div>
    </Container>
  )
}