import PageLink, { server } from '@/components/std/PageLink'
import styles from './page_blocks.module.css'

type props = {
  links: {
    image: server,
    disabled: boolean,
    product: {
      data: {
        attributes: {
          title: string,
          slug: string,
          description: string
        }
      }
    }
  }[]
}

export default function PagesBlock(props: props) {

  const links = props.links.map(link => {

    const link_data = {
      image: link.image,
      disabled: link.disabled,
      data: {
        title: link.product.data.attributes.title,
        url: '/products/' + link.product.data.attributes.slug,
        description: link.disabled ? link.product.data.attributes.description : undefined
      }
    }

    return <PageLink key={'link' + link.product.data.attributes} background='gray' link={link_data}/>
  })

  return (
    <div className={styles.wrapper}>
      {links}
    </div>
  )
}