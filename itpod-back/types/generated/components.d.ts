import type { Schema, Attribute } from '@strapi/strapi';

export interface PageComponentsAddresses extends Schema.Component {
  collectionName: 'components_page_components_addresses';
  info: {
    displayName: 'addresses';
    icon: 'gate';
  };
  attributes: {
    base: Attribute.Component<'utils-components.block-settings'>;
    color: Attribute.Enumeration<['light', 'dark']> &
      Attribute.Required &
      Attribute.DefaultTo<'light'>;
  };
}

export interface PageComponentsBanner extends Schema.Component {
  collectionName: 'components_page_components_banners';
  info: {
    displayName: 'Banner';
    icon: 'dashboard';
    description: '';
  };
  attributes: {
    theme: Attribute.Enumeration<['default', 'big-with-img', 'with-video']> &
      Attribute.Required &
      Attribute.DefaultTo<'default'>;
    base: Attribute.Component<'utils-components.block-settings'>;
    description: Attribute.String;
    List: Attribute.Component<'utils-components.list'>;
  };
}

export interface PageComponentsCardCta extends Schema.Component {
  collectionName: 'components_page_components_card_ctas';
  info: {
    displayName: 'cards_cta';
    icon: 'apps';
    description: '';
  };
  attributes: {
    base: Attribute.Component<'utils-components.block-settings'>;
    nums_in_row: Attribute.Integer &
      Attribute.Required &
      Attribute.SetMinMax<{
        max: 3;
      }> &
      Attribute.DefaultTo<3>;
    cards: Attribute.Component<'utils-components.card', true>;
    form: Attribute.Relation<
      'page-components.card-cta',
      'oneToOne',
      'api::form.form'
    >;
    cards_overflow: Attribute.Boolean &
      Attribute.Required &
      Attribute.DefaultTo<true>;
    less_min_height: Attribute.Boolean &
      Attribute.Required &
      Attribute.DefaultTo<false>;
    cta_card_color: Attribute.Enumeration<['blue', 'gray']> &
      Attribute.Required &
      Attribute.DefaultTo<'blue'>;
  };
}

export interface PageComponentsCards extends Schema.Component {
  collectionName: 'components_page_components_cards';
  info: {
    displayName: 'Cards';
    icon: 'apps';
  };
  attributes: {
    base: Attribute.Component<'utils-components.block-settings'>;
    nums_in_row: Attribute.Integer &
      Attribute.Required &
      Attribute.SetMinMax<{
        max: 3;
      }> &
      Attribute.DefaultTo<3>;
    cards: Attribute.Component<'utils-components.card', true>;
    cards_block_media: Attribute.Media;
  };
}

export interface PageComponentsContacts extends Schema.Component {
  collectionName: 'components_page_components_contacts';
  info: {
    displayName: 'Contacts';
    icon: 'apps';
  };
  attributes: {
    base: Attribute.Component<'utils-components.block-settings'>;
  };
}

export interface PageComponentsContentBlock extends Schema.Component {
  collectionName: 'components_page_components_content_blocks';
  info: {
    displayName: 'content_block';
    icon: 'file';
  };
  attributes: {
    base: Attribute.Component<'utils-components.block-settings'>;
    content: Attribute.RichText &
      Attribute.CustomField<
        'plugin::ckeditor.CKEditor',
        {
          output: 'HTML';
          preset: 'rich';
        }
      >;
    custom_mobile_content: Attribute.Boolean &
      Attribute.Required &
      Attribute.DefaultTo<false>;
    mobile_content: Attribute.RichText &
      Attribute.CustomField<
        'plugin::ckeditor.CKEditor',
        {
          output: 'HTML';
          preset: 'rich';
        }
      >;
  };
}

export interface PageComponentsFaq extends Schema.Component {
  collectionName: 'components_page_components_faqs';
  info: {
    displayName: 'FAQ';
    icon: 'question';
  };
  attributes: {
    base: Attribute.Component<'utils-components.block-settings'>;
    questions: Attribute.Component<'utils-components.faq_item', true>;
  };
}

export interface PageComponentsFirstBlock extends Schema.Component {
  collectionName: 'components_page_components_main_blocks';
  info: {
    displayName: 'First_block';
    icon: 'crown';
    description: '';
  };
  attributes: {
    with_expand_form: Attribute.Boolean &
      Attribute.Required &
      Attribute.DefaultTo<false>;
    base: Attribute.Component<'utils-components.block-settings'>;
    media: Attribute.Media;
    title: Attribute.String;
  };
}

export interface PageComponentsNews extends Schema.Component {
  collectionName: 'components_page_components_news';
  info: {
    displayName: 'News';
    icon: 'book';
  };
  attributes: {
    base: Attribute.Component<'utils-components.block-settings'>;
  };
}

export interface PageComponentsPages extends Schema.Component {
  collectionName: 'components_page_components_pages';
  info: {
    displayName: 'pages';
    icon: 'file';
  };
  attributes: {
    base: Attribute.Component<'utils-components.block-settings'>;
    pageLink: Attribute.Component<'utils-components.page-link', true>;
  };
}

export interface PageComponentsPartners extends Schema.Component {
  collectionName: 'components_page_components_partners';
  info: {
    displayName: 'partners';
    icon: 'alien';
    description: '';
  };
  attributes: {
    base: Attribute.Component<'utils-components.block-settings'>;
    form_description: Attribute.String;
  };
}

export interface PageComponentsRelation extends Schema.Component {
  collectionName: 'components_page_components_relations';
  info: {
    displayName: 'relation';
    icon: 'arrowDown';
  };
  attributes: {
    type: Attribute.Enumeration<['type', 'server']>;
    server_units: Attribute.Boolean &
      Attribute.Required &
      Attribute.DefaultTo<false>;
    base: Attribute.Component<'utils-components.block-settings'>;
  };
}

export interface PageComponentsServersSlider extends Schema.Component {
  collectionName: 'components_page_components_servers_sliders';
  info: {
    displayName: 'servers_slider';
    icon: 'arrowRight';
  };
  attributes: {
    base: Attribute.Component<'utils-components.block-settings'>;
    servers: Attribute.Relation<
      'page-components.servers-slider',
      'oneToMany',
      'api::server.server'
    >;
  };
}

export interface SharedMetaSocial extends Schema.Component {
  collectionName: 'components_shared_meta_socials';
  info: {
    displayName: 'metaSocial';
    icon: 'project-diagram';
  };
  attributes: {
    socialNetwork: Attribute.Enumeration<['Facebook', 'Twitter']> &
      Attribute.Required;
    title: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        maxLength: 60;
      }>;
    description: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        maxLength: 65;
      }>;
    image: Attribute.Media;
  };
}

export interface SharedSeo extends Schema.Component {
  collectionName: 'components_shared_seos';
  info: {
    displayName: 'seo';
    icon: 'search';
  };
  attributes: {
    metaTitle: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        maxLength: 60;
      }>;
    metaDescription: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        minLength: 50;
        maxLength: 160;
      }>;
    metaImage: Attribute.Media;
    metaSocial: Attribute.Component<'shared.meta-social', true>;
    keywords: Attribute.Text;
    metaRobots: Attribute.String;
    structuredData: Attribute.JSON;
    metaViewport: Attribute.String;
    canonicalURL: Attribute.String;
  };
}

export interface UtilsComponentsBlockSettings extends Schema.Component {
  collectionName: 'components_utils_components_block_settings';
  info: {
    displayName: 'block';
    icon: 'stack';
    description: '';
  };
  attributes: {
    background: Attribute.Enumeration<
      ['light', 'dark', 'gray', 'custom-light', 'custom-dark']
    > &
      Attribute.Required &
      Attribute.DefaultTo<'light'>;
    custom_background: Attribute.Media;
    layout: Attribute.Enumeration<['horizontal', 'vertical']> &
      Attribute.Required &
      Attribute.DefaultTo<'vertical'>;
    form: Attribute.Relation<
      'utils-components.block-settings',
      'oneToOne',
      'api::form.form'
    >;
    link: Attribute.Component<'utils-components.link'>;
    padding: Attribute.Enumeration<
      ['none', 'top', 'bottom', 'both', 'both_xl']
    > &
      Attribute.Required &
      Attribute.DefaultTo<'both'>;
    description: Attribute.RichText &
      Attribute.CustomField<
        'plugin::ckeditor.CKEditor',
        {
          output: 'HTML';
          preset: 'standard';
        }
      >;
    title: Attribute.RichText &
      Attribute.CustomField<
        'plugin::ckeditor.CKEditor',
        {
          output: 'HTML';
          preset: 'light';
        }
      >;
  };
}

export interface UtilsComponentsCard extends Schema.Component {
  collectionName: 'components_utils_components_cards';
  info: {
    displayName: 'card';
    icon: 'apps';
  };
  attributes: {
    title: Attribute.RichText &
      Attribute.CustomField<
        'plugin::ckeditor.CKEditor',
        {
          output: 'HTML';
          preset: 'light';
        }
      >;
    bigger_title: Attribute.Boolean &
      Attribute.Required &
      Attribute.DefaultTo<false>;
    description: Attribute.String;
    img: Attribute.Media;
    list: Attribute.Component<'utils-components.list', true>;
  };
}

export interface UtilsComponentsDocument extends Schema.Component {
  collectionName: 'components_utils_components_documents';
  info: {
    displayName: 'document';
    icon: 'envelop';
    description: '';
  };
  attributes: {
    name: Attribute.String & Attribute.Required;
    file: Attribute.Media & Attribute.Required;
  };
}

export interface UtilsComponentsFaqItem extends Schema.Component {
  collectionName: 'components_utils_components_faq_items';
  info: {
    displayName: 'FAQ_item';
    icon: 'bulletList';
    description: '';
  };
  attributes: {
    question: Attribute.String;
    answer: Attribute.String;
  };
}

export interface UtilsComponentsItem extends Schema.Component {
  collectionName: 'components_utils_components_items';
  info: {
    displayName: 'Item';
    icon: 'bulletList';
    description: '';
  };
  attributes: {
    item: Attribute.String;
    bigger_text: Attribute.Boolean & Attribute.DefaultTo<false>;
  };
}

export interface UtilsComponentsLink extends Schema.Component {
  collectionName: 'components_utils_components_links';
  info: {
    displayName: 'link';
    icon: 'cursor';
  };
  attributes: {
    link_text: Attribute.String;
    url: Attribute.String;
  };
}

export interface UtilsComponentsList extends Schema.Component {
  collectionName: 'components_utils_components_lists';
  info: {
    displayName: 'List';
    icon: 'bulletList';
    description: '';
  };
  attributes: {
    list_title: Attribute.String;
    items: Attribute.Component<'utils-components.item', true>;
    list_description: Attribute.String;
  };
}

export interface UtilsComponentsPageLink extends Schema.Component {
  collectionName: 'components_utils_components_page_links';
  info: {
    displayName: 'productLink';
    icon: 'attachment';
    description: '';
  };
  attributes: {
    product: Attribute.Relation<
      'utils-components.page-link',
      'oneToOne',
      'api::product.product'
    >;
    image: Attribute.Enumeration<
      ['g1', 'g2', 'g2_s', 'g3', 'g4', 'gp1', 'gp2', 's1', 'ds1', 'n1']
    > &
      Attribute.Required &
      Attribute.DefaultTo<'g2'>;
    disabled: Attribute.Boolean &
      Attribute.Required &
      Attribute.DefaultTo<false>;
  };
}

declare module '@strapi/types' {
  export module Shared {
    export interface Components {
      'page-components.addresses': PageComponentsAddresses;
      'page-components.banner': PageComponentsBanner;
      'page-components.card-cta': PageComponentsCardCta;
      'page-components.cards': PageComponentsCards;
      'page-components.contacts': PageComponentsContacts;
      'page-components.content-block': PageComponentsContentBlock;
      'page-components.faq': PageComponentsFaq;
      'page-components.first-block': PageComponentsFirstBlock;
      'page-components.news': PageComponentsNews;
      'page-components.pages': PageComponentsPages;
      'page-components.partners': PageComponentsPartners;
      'page-components.relation': PageComponentsRelation;
      'page-components.servers-slider': PageComponentsServersSlider;
      'shared.meta-social': SharedMetaSocial;
      'shared.seo': SharedSeo;
      'utils-components.block-settings': UtilsComponentsBlockSettings;
      'utils-components.card': UtilsComponentsCard;
      'utils-components.document': UtilsComponentsDocument;
      'utils-components.faq_item': UtilsComponentsFaqItem;
      'utils-components.item': UtilsComponentsItem;
      'utils-components.link': UtilsComponentsLink;
      'utils-components.list': UtilsComponentsList;
      'utils-components.page-link': UtilsComponentsPageLink;
    }
  }
}
