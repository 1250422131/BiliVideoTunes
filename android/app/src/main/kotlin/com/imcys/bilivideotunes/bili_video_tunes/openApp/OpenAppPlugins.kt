package com.imcys.bilivideotunes.bili_video_tunes.openApp

import android.content.Context
import android.content.Intent
import android.net.Uri
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class OpenAppPlugins : MethodChannel.MethodCallHandler, FlutterPlugin {

    private lateinit var binding: FlutterPlugin.FlutterPluginBinding

    private lateinit var channel: MethodChannel

    private lateinit var context: Context

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        when (call.method) {
            "openAppChannel" -> {
                val packageName = call.argument<String>("package")
                val path = call.argument<String>("path")
                if (isInstallApp(context, packageName)) {
                    Intent(Intent.ACTION_VIEW, Uri.parse(path)).also {
                        it.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        context.startActivity(it)
                    }
                    return result.success(true)
                }
                return result.success(false)
            }

            else -> result.notImplemented()
        }


    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel =
            MethodChannel(flutterPluginBinding.binaryMessenger, "openAppChannel")
        channel.setMethodCallHandler(this)
        this.binding = flutterPluginBinding
    }

    override fun onDetachedFromEngine(p0: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun isInstallApp(context: Context, appPackageName: String?): Boolean {
        return context.packageManager.getLaunchIntentForPackage(appPackageName!!) != null
    }

}
