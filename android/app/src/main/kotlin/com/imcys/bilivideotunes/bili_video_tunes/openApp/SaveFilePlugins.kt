package com.imcys.bilivideotunes.bili_video_tunes.openApp

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Environment
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileNotFoundException
import java.io.FileOutputStream
import java.io.IOException

class SaveFilePlugins : MethodChannel.MethodCallHandler, FlutterPlugin {

    private lateinit var binding: FlutterPlugin.FlutterPluginBinding

    private lateinit var channel: MethodChannel

    private lateinit var context: Context


    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "saveImageToGallery" -> {
                val image = call.argument<ByteArray?>("imageBytes")
                val name = call.argument<String?>("name") ?: "image"
                val quality = call.argument<Int?>("quality") ?: 100
                val child = call.argument<String?>("child")
                val overwrite = call.argument<Boolean?>("overwrite") ?: false


                val photoDir = if (child != null) {
                    File(
                        Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES).absolutePath,
                        child
                    )
                } else {
                    File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES).absolutePath)
                }
                if (!photoDir.exists()) {
                    photoDir.mkdirs()
                }

                var photo = File(photoDir, "${name}.jpg")
                if (photo.exists()) {
                    if (overwrite == false) {
                        photo = File(photoDir, "${name}_副本.jpg")
                    }
                }

                try {
                    val fos = FileOutputStream(photo)
                    image?.let {
                        byteArrayToBitmap(it).compress(
                            Bitmap.CompressFormat.JPEG,
                            quality,
                            fos
                        )
                    }
                    fos.flush()
                    fos.close()
                } catch (e: FileNotFoundException) {
                    e.printStackTrace()
                } catch (e: IOException) {
                    e.printStackTrace()
                }
                result.success(true)


            }

            else -> result.notImplemented()

        }
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel =
            MethodChannel(flutterPluginBinding.binaryMessenger, "SaveFileChannel")
        channel.setMethodCallHandler(this)
        this.binding = flutterPluginBinding
    }

    override fun onDetachedFromEngine(p0: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)

    }


    private fun byteArrayToBitmap(byteArray: ByteArray): Bitmap {
        return BitmapFactory.decodeByteArray(byteArray, 0, byteArray.size)
    }
}