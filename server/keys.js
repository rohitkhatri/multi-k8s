module.exports = {
    // Redis configuration
    redisHost: process.env.REDIS_HOST,
    redisPort: process.env.REDIS_PORT,

    // Postgress database configuration
    pgUser: process.env.PG_USER,
    pgHost: process.env.PG_HOST,
    pgPort: process.env.PG_PORT,
    pgDatabase: process.env.PG_DATABASE,
    pgPassword: process.env.PG_PASSWORD,
};