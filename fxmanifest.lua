-- kadeciok#1234
-- nie usuwaj tego!

fx_version 'adamant'
game 'gta5'
server_script {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/server.lua'
}
client_script {
	'config.lua',
    'client/*.lua'
}
