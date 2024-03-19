'use client'
 
import { useEffect } from 'react'
import { usePathname, useSearchParams } from 'next/navigation'

export default function Metrika() {
  const pathname = usePathname()
  const searchParams = useSearchParams()

  useEffect(() => {
    const url = `${pathname}?${searchParams}`
    //@ts-ignore
    ym(96368478, 'hit', url);

  }, [pathname, searchParams])

  return null
}