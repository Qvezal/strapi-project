export default ({env}) => ({

  //email configuration
  email: {
    config: {
      provider: 'nodemailer', // For community providers pass the full package name (e.g. provider: 'strapi-provider-email-mandrill')
        providerOptions: {
          host: 'smtp.itglobal.com', //SMTP Host
          port: 587, //SMTP Port
          auth: {
            user: 'sites@itglobal.com',
            pass: 'kXdoeQ8j6ase',
          },
          secure: false,
          tls: true,
        },
      settings: {
        defaultFrom: 'sites@itglobal.com',
        defaultReplyTo: 'andrey.savilov@drozd.red',
        testAddress: 'andrey.savilov@drozd.red',
      },
    },
  },

  //find by slugs conf
  slugify: {
    enabled: true,
    config: {
      contentTypes: {
        page: {
          field: 'slug',
          references: 'title',
        },
        event: {
          field: 'slug',
          references: 'title',
        },
        newsletter: {
          field: 'slug',
          references: 'title',
        },
        product: {
          field: 'slug',
          references: 'title',
        },
        server: {
          field: 'slug',
          references: 'title',
        },
        "server-serieses": {
          field: 'slug',
          references: 'title',
        },
        "server-type": {
          field: 'slug',
          references: 'title',
        },
      },
    },
  },

  //request caching
  redis: {
    config: {
        connections: {
            default: {
                connection: {
                    host: '127.0.0.1',
                    port: 6379,
                    db: 0,
                },
                settings: {
                    debug: false,
                },
            },
        },
    },
  },

  "rest-cache": {
    config: {
        provider: {
            name: "redis",
            options: {
                max: 32767,
                connection: "default",
            },
        },
        strategy: {
          enableEtagSupport: true,
          logs: true,
          clearRelatedCache: true,
          maxAge: 3600000,
          contentTypes: [
              // list of Content-Types UID to cache
              "api::address.address",
              "api::event.event",
              "api::form.form",
              "api::page.page",
              "api::newsletter.newsletter",
              "api::partners-type.partners-type",
              "api::product.product",
              "api::server.server",
              "api::server-serieses.server-serieses",
              "api::server-type.server-type",
              "api::server-processor.server-processor",
              "api::server-size.server-size"
          ],
        },
      },
  },

  'sitemap': {
    enabled: true,
    config: {
      cron: '0 0 0 * * *',
      limit: 45000,
      xsl: true,
      autoGenerate: false,
      caching: true,
      allowedFields: ['id', 'uid', 'slug', 'server_series.slug', 'server-series.slug', 'server_type.slug', 'products.slug'],
      excludedTypes: [],
    },
  },
});
