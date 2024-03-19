import commerce from "@/assets/svg/E-commerce and Retail.svg"
import energy from "@/assets/svg/Energy and Utilities.svg"
import financy from "@/assets/svg/Finance and Banking.svg"
import health from "@/assets/svg/Healthcare and Pharmaceutical Industry.svg"
import insurance from "@/assets/svg/Insurance.svg"
import intellectual from "@/assets/svg/Intellectual Property and Copyright Protection.svg"
import estate from "@/assets/svg/Real Estate.svg"
import chain from "@/assets/svg/Supply Chain and Logistics.svg"

import page_labels from "./labels.json"
import get_labels from "@/functions/get_labels"

export default function page_data(current_lang: string) {
  const labels = get_labels(page_labels, current_lang)

  const expertise = [
    {
      number: 5,
      post_title: "+",
      description: labels.blockchain_dev
    },
    {
      number: 50,
      post_title: "+",
      description: labels.customers
    },
    {
      number: 25,
      post_title: "+",
      description: labels.developers
    },
    {
      number: 20,
      post_title: "+",
      description: labels.delivered
    }
  ]

  const technology = [
    {
      number: 100000,
      post_title: " +",
      description: labels.transaction
    },
    {
      number: 0.0002,
      prev_title: "<$",
      description: labels.avg_fee
    },
    {
      number: 1,
      prev_title: "<",
      post_title: labels.sec,
      description: labels.avg_time
    },
    {
      prev_title: labels.sharding,
      description: labels.sharding_desc
    }
  ]

  const cases = [
    {
      image: financy,
      title: labels.financy,
      description: labels.financy_desc
    },
    {
      image: chain,
      title: labels.chain,
      description: labels.chain_desc
    },
    {
      image: health,
      title: labels.health,
      description: labels.health_desc
    },
    {
      image: estate,
      title: labels.estate,
      description: labels.estate_desc
    },
    {
      image: intellectual,
      title: labels.intellectual,
      description: labels.intellectual_desc
    },
    {
      image: energy,
      title: labels.energy,
      description: labels.energy_desc
    },
    {
      image: commerce,
      title: labels.commerce,
      description: labels.commerce_desc
    },
    {
      image: insurance,
      title: labels.insurance,
      description: labels.insurance_desc
    }
  ]

  const tabs = [
    {
      name: labels.tab1_name,
      title: labels.tab1_title,
      description: labels.tab1_desc,
      links: {
        links_title: labels.example,
        links_arr: ["everscale.network", "venom.network"]
      }
    },

    {
      name: labels.tab2_name,
      title: labels.tab2_title,
      description: labels.tab2_desc,
    },

    {
      name: labels.tab3_name,
      title: labels.tab3_title,
      description: labels.tab3_desc,
      links: {
        links_title: labels.example,
        links_arr: ["everspace.app"]
      }
    },

    {
      name: labels.tab4_name,
      title: labels.tab4_title,
      description: labels.tab4_desc,
      links: {
        links_title: labels.example,
        links_arr: ["ever.live", "everscan.io"]
      }
    },

    {
      name: labels.tab5_name,
      title: labels.tab5_title,
      description: labels.tab5_desc,
      links: {
        links_title: labels.example,
        links_arr: ["grandbazar.io"]
      }
    },

    {
      name: labels.tab6_name,
      title: labels.tab6_title,
      description: labels.tab6_desc,
    },

    {
      name: labels.tab7_name,
      title: labels.tab7_title,
      description: labels.tab7_desc,
      links: {
        links_title: labels.example,
        links_arr: ["itpay.ru"]
      }
    },

    {
      name: labels.tab8_name,
      title: labels.tab8_title,
      description: labels.tab8_desc,
    },

    {
      name: labels.tab9_name,
      title: labels.tab9_title,
      description: labels.tab9_desc,
      links: {
        links_title: labels.example,
        links_arr: ["id.itgold.io"]
      }
    },

    {
      name: labels.tab10_name,
      title: labels.tab10_title,
      description: labels.tab10_desc,
    },
  ]
  return {expertise, technology, cases, tabs}
}