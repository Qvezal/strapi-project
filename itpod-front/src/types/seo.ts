export type Seo = {
  metaTitle: string;
  metaDescription: string;
  keywords: string;
  metaRobots: string;
  structuredData: string;
  metaImage: {
    data: {
      attributes: {
        formats: {
          small: {
            url: string,
            width: number,
            height: number
          },
          medium: {
            url: string,
            width: number,
            height: number
          },
          thumbnail: {
            url: string,
            width: number,
            height: number
          }
        }
      }
    }
  }
}