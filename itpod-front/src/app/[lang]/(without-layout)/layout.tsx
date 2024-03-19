import '@/styles/global.css';
import Head from '../(with-layout)/head';
import { Metadata } from 'next';

export const metadata: Metadata = {
  icons: {
    icon: '/favicon/favicon.ico',
    apple: '/favicon/apple-touch-icon.png',
  }
};

export default async function PageLayout({children, params}: {
  children: React.ReactNode,
  params: {
    lang: string
  }
}) {

  const curr_lang = params.lang

  return (
    <html lang={curr_lang}>
      <Head/>
      <body>
        {children}
      </body>
    </html>
  )
}
