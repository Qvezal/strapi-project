import Container from "@/components/std/Container";
import find_with_count from "@/utils/find_with_count";
import { useEffect, useState } from "react";
import styles from './news.module.css'
import Tag from "./Tag";
import Button from "@/components/std/Button";
import Card from "@/components/std/Card";
import get_page from "@/controllers/get_page";
import { Seo } from "@/types/seo";
import get_seo from "@/utils/get_seo";
import { ResolvingMetadata, Metadata } from "next";
import Newsletters from "./News";

type props = {
  params: {
    lang: string,
  }
}

export type news_tag = {
  attributes: {
    name: string
  }
}

export type News = {
  attributes: {
    title: string,
    content: string,
    news_tags: {
      data: news_tag[]
    },
    slug: string
  }
}

export async function generateMetadata(
  { params }: props,
  parent: ResolvingMetadata
): Promise<Metadata> {
 
  const seo_data: Seo = (await get_page('page', 'news', params.lang)).data?.attributes.seo;
  const seo = get_seo(seo_data);

  return seo;
}

export default function AllNews(props: props) {
  return (<Newsletters params={props.params}/>)
}