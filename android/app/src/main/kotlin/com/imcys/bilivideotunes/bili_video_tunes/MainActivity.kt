package com.imcys.bilivideotunes.bili_video_tunes

import com.imcys.bilivideotunes.bili_video_tunes.openApp.OpenAppPlugins
import com.imcys.bilivideotunes.bili_video_tunes.openApp.SaveFilePlugins
import com.ryanheise.audioservice.AudioServiceActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: AudioServiceActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        flutterEngine.plugins.add(OpenAppPlugins())
        flutterEngine.plugins.add(SaveFilePlugins())

    }

}
