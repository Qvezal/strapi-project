import { Seo } from "@/types/seo";
import { Metadata } from "next";

export default function get_seo(seo: Seo): Metadata {
  const images = seo?.metaImage.data?.attributes.formats;
  // optionally access and extend (rather than replace) parent metadata
  // const previousImages = (await parent).openGraph?.images || []

  return {
    title: seo?.metaTitle,
    description: seo?.metaDescription,
    openGraph: {
      title: seo?.metaTitle,
      description: seo?.metaDescription,
      url: 'https://itpod.com',
      siteName: 'ITPOD',
      images: images ? [
        {
          url: process.env.NEXT_PUBLIC_API_URL + images.small.url,
          width: images.small.width,
          height: images.small.height
        },
        {
          url: process.env.NEXT_PUBLIC_API_URL + images.medium.url,
          width: images.medium.width,
          height: images.medium.height
        },
        {
          url: process.env.NEXT_PUBLIC_API_URL + images.thumbnail.url,
          width: images.thumbnail.width,
          height: images.thumbnail.height
        }
      ] : []
    }
  }
}