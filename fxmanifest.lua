fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "sky_extinguisher"
author ""
version "1.0.0"
description ""

client_scripts {
  'client.lua',
}
  
server_scripts {
  'server.lua',
  }

shared_script {
  '@ox_lib/init.lua',
  'config.lua'
}

dependencies {
  'ox_lib',
}
