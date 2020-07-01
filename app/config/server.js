module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  url: env('URL', `http://${strapi.config.server.host}:${strapi.config.server.port}`)
});