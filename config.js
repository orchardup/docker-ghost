// # Ghost Configuration
// Setup your Ghost install for various environments

var path = require('path'),
    config;

config = {
    // ### Production
    // When running Ghost in the wild, use the production environment
    // Configure your URL and mail settings here
    production: {
        url: process.env.GHOST_URL,
        mail: {},
        database: {
            client: 'sqlite3',
            connection: {
                filename: 'content/data/ghost.db'
            },
            debug: false
        },
        server: {
            // Host to be passed to node's `net.Server#listen()`
            host: '0.0.0.0',
            // Port to be passed to node's `net.Server#listen()`, for iisnode set this to `process.env.PORT`
            port: '2368'
        },
	paths: {
            contentPath: path.join('content')
        }
    }
};

// Export config
module.exports = config;
