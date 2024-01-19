import SwiftUI

@main
struct MyApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel.shared)
        }
    }
}

@objc class AppDelegate: NSObject, UIApplicationDelegate {
    
    func applicationWillTerminate(_ application: UIApplication) {
        ViewModel.shared.save()
    }
    
}
