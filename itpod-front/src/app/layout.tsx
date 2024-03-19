import '@/styles/global.css';

export default function PageLayout({children, params}: {
  children: React.ReactNode,
  params: {
    lang: string
  }
}) {

  return (
    <>
    {children}
    </>
  )
}
