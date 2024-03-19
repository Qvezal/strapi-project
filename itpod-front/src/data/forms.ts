
const email_regex = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
const phone_regexp = /^\+?7(\d{10})$/gm;

export const fields_regex: any = {
    'email' : email_regex,
    'phone': phone_regexp
};



export const masks: any = {
    'phone': { 
        mask: '+7 (___) ___-__-__',
        replacement: { _: /\d/ }
    },
}
