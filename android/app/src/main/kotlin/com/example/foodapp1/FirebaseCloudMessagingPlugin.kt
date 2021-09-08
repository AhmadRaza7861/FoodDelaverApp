package com.example.foodapp1

import io.flutter.plugin.common.PluginRegistry

object FirebaseCloudMessagingPlugin {
    fun registerWith(pluginRegistry: PluginRegistry)
    {
        if (alreadyRegisterWith(pluginRegistry))return
        registerWith(pluginRegistry)
    }

    private fun alreadyRegisterWith(pluhinRegistry: PluginRegistry): Boolean {
val key=FirebaseCloudMessagingPlugin::class.java.canonicalName
        if (pluhinRegistry.hasPlugin(key)) return  true
      pluhinRegistry.registrarFor(key)
        return  false
    }

}