export default function compareLang(lang: string): string {
  const new_lang = lang.split('-');
  if (new_lang[1]) {
    new_lang[1] = new_lang[1].toUpperCase();
  }
  return new_lang.join('-');
}