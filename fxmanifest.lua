fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "fct_extinguisher"
author "FatCatTuxedo"
version "1.0.1"
description "Original by: Taylor-McGaw-Skyline-DEV/Sky-Extinguisher"

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
