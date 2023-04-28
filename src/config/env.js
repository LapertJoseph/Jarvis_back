/**
 * Global configuration
 */
const Config = {
    JWT_SECRET:
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6eyJlbWFpbCI6InRlc3RAZ21haWwuY29tIn0sImFkbWluIjp0cnVlLCJpYXQiOjE2NjczOTk4NTl9.mUATJMnzeE9alAPyQWH_VliPV9zLz1k0EqZL50SC5hE",
    database: {
      connectionLimit: 10,
      host: "172.16.238.2",
      user: "root",
      password: "password",
      database: "prod",
      port: 3306,
    },
  };
  
  module.exports = Object.freeze(Config);