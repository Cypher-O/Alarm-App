//import android.content.Intent;
//import android.net.Uri;
//import io.flutter.embedding.engine.FlutterEngine;
//import io.flutter.plugin.common.MethodChannel;
//import io.flutter.embedding.android.FlutterActivity;
package com.example.alarm_app;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
}
//public class MainActivity extends FlutterActivity {
//    private static final String CHANNEL = "plugins.flutter.io/url_launcher_android";
//
//    @Override
//    public void configureFlutterEngine(FlutterEngine flutterEngine) {
//        super.configureFlutterEngine(flutterEngine);
//        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
//                (call, result) -> {
//                    if (call.method.equals("canLaunch")) {
//                        String url = call.argument("url");
//                        Intent intent = new Intent(Intent.ACTION_VIEW);
//                        intent.setData(Uri.parse(url));
//                        result.success(getPackageManager().resolveActivity(intent, 0) != null);
//                    } else {
//                        result.notImplemented();
//                    }
//                }
//        );
//    }
//}
