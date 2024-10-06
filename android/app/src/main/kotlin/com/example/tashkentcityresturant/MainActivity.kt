package com.example.tashkentcityresturant

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import androidx.annotation.NonNull
import com.yandex.mapkit.MapKitFactory


class MainActivity: FlutterActivity(){
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("eaa07fa0-1ad5-4eb6-9f13-1faded87b2ed")
        super.configureFlutterEngine(flutterEngine)
    }
}
