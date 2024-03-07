package com.imcys.bilivideotunes.bili_video_tunes

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.imcys.bilivideotunes.bili_video_tunes.openApp.OpenAppPlugins
import com.ryanheise.audioservice.AudioServiceActivity

class MainActivity: AudioServiceActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        flutterEngine.plugins.add(OpenAppPlugins())
    }

}
