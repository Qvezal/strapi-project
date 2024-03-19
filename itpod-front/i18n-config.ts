export const i18n = {
  defaultLocale: 'ru-RU',
  locales: ['en-US', 'ru-RU'],
} as const;

export type Locale = typeof i18n['locales'][number];