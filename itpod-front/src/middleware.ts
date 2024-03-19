import type { NextRequest } from 'next/server';
import { NextResponse } from 'next/server';

import { i18n } from '../i18n-config';

import { match as matchLocale } from '@formatjs/intl-localematcher';
import Negotiator from 'negotiator';

function getLocale(request: NextRequest): string | undefined {
    // Negotiator expects plain object so we need to transform headers
    const negotiatorHeaders: Record<string, string> = {};
    request.headers.forEach((value, key) => (negotiatorHeaders[key] = value));

    // Use negotiator and intl-localematcher to get best locale
    let languages = new Negotiator({ headers: negotiatorHeaders }).languages();
    // @ts-ignore locales are readonly
    const locales: string[] = i18n.locales;
    return matchLocale(languages, locales, i18n.defaultLocale);
}

export function middleware(request: NextRequest) {
    // Check if there is any supported locale in the pathname
    const { pathname } = request.nextUrl
    const pathnameHasLocale = i18n.locales.some(
      (locale) => pathname.startsWith(`/${locale}/`) || pathname === `/${locale}`
    )
   
    if (pathnameHasLocale) return NextResponse.next({status: 200});
   
    // Redirect if there is no locale
    if (!pathnameHasLocale && pathname != '/') {
        //redirect to browser locale
        const locale = getLocale(request);
        // e.g. incoming request is /products
        // The new URL is now /en-US/products
        // return NextResponse.redirect(new URL(`/${locale}/${pathname}`, request.url));

        //redirect to default locale
        return NextResponse.redirect(new URL(`/${i18n.defaultLocale}${pathname}`, request.url));

    }

    const requestHeaders = new Headers(request.headers);
    requestHeaders.set("x-pathname", request.nextUrl.pathname);

    const response = NextResponse.next({
        request: {
            headers: requestHeaders
        }
    });

    if (pathname != '/') {
        response.cookies.set('locale', pathname.split('/')[1]); 
    }
    
    return response;

}

export const config = {
    // Matcher ignoring `/_next/` and `/api/`
    matcher: ['/((?!_next|sitemap.xml|sitemap.xsl|favicon.ico|robots.txt|manifest.webmanifest|googlebb85f786afa70fc7|$).*)'],
};
