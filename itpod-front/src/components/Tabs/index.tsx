"use client"


type content = {
  name: string,
  title: string,
  description: string,
  links?: {
    links_title: string,
    links_arr: string[]
  }
}

type props = {
  content : content[]
}

export default function Tabs(props: props) {

 return (<></>)
}