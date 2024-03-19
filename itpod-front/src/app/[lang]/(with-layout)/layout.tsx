import '@/styles/global.css';
import Head from './head';
import Header from '@/components/Layout/Header';
import Footer from '@/components/Layout/Footer';
import { cookies } from 'next/headers'
import Cookie from '@/components/Layout/Cookie';
import Block from '@/components/std/Block';
import FormBlock from '@/components/PageComponents/FormBlock';
import get_default_form from '@/controllers/get_default_form';
import { Metadata } from 'next';
import Script from 'next/script';
import { GoogleTagManager } from '@next/third-parties/google'

export const metadata: Metadata = {
  icons: {
    icon: '/favicon.ico',
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
  const form = await get_default_form(curr_lang);
  const show_cookie = cookies().get('accept-cookie') ? false : true;

  return (
    <html lang={curr_lang}>
      <Head/>
      <body>
        <Header curr_lang={curr_lang}/>
        <main>
          {children}
        </main>
        <Block options={{background: 'dark', padding: 'both'}}>
          <FormBlock options={{form: form}}/>
        </Block>
        <Footer curr_lang={curr_lang}/>
        {show_cookie && <Cookie curr_lang={curr_lang}/>}
      </body>
      <GoogleTagManager gtmId="GTM-5NBGRZSZ" />
      <Script id="metrika-counter" strategy="afterInteractive">
        {`(function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
          m[i].l=1*new Date();
          for (var j = 0; j < document.scripts.length; j++) {if (document.scripts[j].src === r) { return; }}
          k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
          (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

          ym(96368478, "init", {
                defer: true,
                clickmap:true,
                trackLinks:true,
                accurateTrackBounce:true,
                webvisor:true
          });`
        }
      </Script>
    </html>
  )
}
