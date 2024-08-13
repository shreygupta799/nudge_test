package com.example.nudge_test

import android.content.Context
import android.content.IntentFilter
import android.os.Bundle
import android.os.Build
import android.content.Intent
import android.content.pm.PackageManager
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.os.BatteryManager
import android.util.DisplayMetrics
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.device_info/info"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getTimezone" -> result.success(java.util.TimeZone.getDefault().id)
                    "getInternetState" -> result.success(isInternetConnected())
                    "getBrand" -> result.success(Build.BRAND)
                    "getModel" -> result.success(Build.MODEL)
                    "getDeviceLanguage" -> result.success(java.util.Locale.getDefault().language)
                    "getAppVersion" -> result.success(getAppVersion())
                    "getBatteryLevel" -> result.success(getBatteryLevel())
                    "getOS" -> result.success("Android")
                    "getOSVersion" -> result.success(Build.VERSION.RELEASE)
                    "getBuildMode" -> result.success(BuildConfig.BUILD_TYPE)
                    "getHeight" -> result.success(getScreenHeight())
                    "getWidth" -> result.success(getScreenWidth())
                    else -> result.notImplemented()
                }
            }
    }

    private fun isInternetConnected(): Boolean {
        val connectivityManager = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val network = connectivityManager.activeNetwork
            val networkCapabilities = connectivityManager.getNetworkCapabilities(network)
            networkCapabilities != null && (
                    networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) ||
                    networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) ||
                    networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET)
                    )
        } else {
            val networkInfo = connectivityManager.activeNetworkInfo
            networkInfo != null && networkInfo.isConnected
        }
    }



    private fun getAppVersion(): String {
        return try {
            packageManager.getPackageInfo(packageName, 0).versionName
        } catch (e: PackageManager.NameNotFoundException) {
            "Unknown"
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryIntent = IntentFilter(Intent.ACTION_BATTERY_CHANGED).let { ifilter ->
            registerReceiver(null, ifilter)
        }
        return batteryIntent?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1
    }

    private fun getScreenHeight(): Int {
        val displayMetrics = DisplayMetrics()
        (getSystemService(Context.WINDOW_SERVICE) as WindowManager).defaultDisplay.getMetrics(displayMetrics)
        return displayMetrics.heightPixels
    }

    private fun getScreenWidth(): Int {
        val displayMetrics = DisplayMetrics()
        (getSystemService(Context.WINDOW_SERVICE) as WindowManager).defaultDisplay.getMetrics(displayMetrics)
        return displayMetrics.widthPixels
    }
}
