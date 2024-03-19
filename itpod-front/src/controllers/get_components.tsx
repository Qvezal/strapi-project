import Block from "@/components/std/Block";
import AdvantagesBlock from "@/components/PageComponents/AdvantagesBlock";
import ContactsBlock from "@/components/PageComponents/ContactsBlock";
import ContentBlock from "@/components/PageComponents/ContentBlock";
import FirstBlock from "@/components/PageComponents/FirstBlock";
import BannerBlock from "@/components/PageComponents/BannerBlock";
import PagesBlock from "@/components/PageComponents/PagesBlock";
import RelationBlock from "@/components/PageComponents/RelationBlock";
import NewsBlock from "@/components/PageComponents/NewsBlock";
import PartnersBlock from "@/components/PageComponents/PartnersBlock";
import AddressesBlock from "@/components/PageComponents/AddressesBlock";
import ServerSlideBlock from "@/components/PageComponents/SliderBlock";
import FaqBlock from "@/components/PageComponents/FaqBlock";


type props = {
  blocs: any[],
  locale: string,
  page?: any
  curr_page?: string
}

export default function get_components(props: props) {
  return props.blocs.map(block => {
    const name = block.__component.split('.')[1];
    let component;

    const options = {
      ...block.base,
      blockType: name === 'first-block' && !block.title ? 'first' : name === 'faq' ? 'faq' : undefined
    };
        
    switch (name) {
      case 'contacts':
        component = <ContactsBlock locale={props.locale}></ContactsBlock>;
        break;
      case 'addresses':
        component = <AddressesBlock lang={props.locale} options={block}/>
        break;
      case 'cards':
      case 'card-cta':
        component = <AdvantagesBlock options={{
          params: {
            slider: name === 'card-cta',
            nums_in_row: block.nums_in_row,
            cta_card_color: block.cta_card_color,
            cards_overflow: block.cards_overflow,
            less_min_height: block.less_min_height,
            name: name
          },
          cards: block.cards,
          form: block.form,
          media: block.cards_block_media,
          baseColor: block.base.background,
          baseForm: block.base?.form.data?.attributes}}
          />; 
        break;
      case 'banner':
        let bannerOptions = {
          background : options.background,
          title : options.title,
          description : options.description,
          bottom_description : block.description,
          img : block.base.custom_background,
          theme : block.theme,
          form : options.form,
          link : options.link,
          list : block.List
        }

        options.background = options.background == 'dark' ? 'gray' : options.background;

        delete block.base.title;
        delete block.base.description;
        delete options.custom_background;
        delete options.link;
        
        component = <BannerBlock locale={props.locale} options={bannerOptions}></BannerBlock>
        
        break;
      case 'servers-slider':
        component = <ServerSlideBlock lang={props.locale} options={block}></ServerSlideBlock>
        break;  
      case 'content-block':
        component = <ContentBlock options={block}></ContentBlock>;
        break;
      case 'news':
        options.news = true;
        component = <NewsBlock options={block} locale={props.locale}></NewsBlock>;
        break;   
      case 'first-block':
        options.expandedForm = block.with_expand_form;
        
        component = <FirstBlock
          src={block.media.data?.attributes.url}
          title={block.title}
          expand_form={block.with_expand_form}
        />;
        break;
      case 'pages':
        component = <PagesBlock links={block.pageLink}/>;
        break;
      case 'relation':
        component = <RelationBlock page={props.page} type={block.type} units={block.server_units} curr_page={props.curr_page || ''} locale={props.locale}/>;
        break;
      case 'partners':
        component = <PartnersBlock lang={props.locale} options={block}/>;
        break;
      case 'faq':
        component = <FaqBlock options={block}/>;
        break;
      default: <></>
    }

    name != 'first-block' && delete options.form;

    return <Block key={block.__component} options={options} title={block.base?.title} description={block.base?.description}>{component}</Block>
  })
}