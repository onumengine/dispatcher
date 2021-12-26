import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Google Maps Api
    GMSServices.provideAPIKey("AIzaSyD7L0MvTWRTNI5rMa4xLr5J4DGrfs_GWFA")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
