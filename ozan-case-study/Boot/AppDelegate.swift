//
//  AppDelegate.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let homeViewModel = HomeViewModel(
            coinListProviding: MockCoinListProvider(),
            pickerDataSource: CoinSortSelectionDataSource()
        )
        let homeViewController = UIStoryboard(name: "HomeStoryboard", bundle: .main).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeViewController.viewModel = homeViewModel
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeViewController
        window?.makeKeyAndVisible()
        return true
    }
}

class MockCoinListProvider: CoinListProviding {
    
    func fetchCoinList(_ completionHandler: CoinListFetchedHandler?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completionHandler?(.success(.successfulResponse))
        }
    }
}
