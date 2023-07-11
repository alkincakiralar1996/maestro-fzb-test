//
//  Store.swift
//  iOSTestFizbot
//
//  Created by Alkın Çakıralar on 14.06.2023.
//

import Foundation
import StoreKit

struct StoreKitRateManager {
    static let shared = StoreKitRateManager()

    private static let APPLICATION_OPEN_COUNT_STATUS = "APPLICATION_OPEN_COUNT_STATUS"

    func incrementAppOpenedCount() {
        let userdefaults = UserDefaults.standard

        let appOpenCountValue = userdefaults.integer(forKey: StoreKitRateManager.APPLICATION_OPEN_COUNT_STATUS)

        userdefaults.set(appOpenCountValue + 1, forKey: StoreKitRateManager.APPLICATION_OPEN_COUNT_STATUS)
        userdefaults.synchronize()
    }

    func checkAppOpenedCount() {
        let userdefault = UserDefaults.standard

        let appOpenCountValue = userdefault.integer(forKey: StoreKitRateManager.APPLICATION_OPEN_COUNT_STATUS)

        guard appOpenCountValue == 5 else { return }

        requestReview()
    }

    func requestReview() {
        #if os(macOS)
            SKStoreReviewController.requestReview()
        #else
            guard let scene = UIApplication.shared.foregroundActiveScene else { return }
            SKStoreReviewController.requestReview(in: scene)
        #endif
    }
}

extension UIApplication {
    var foregroundActiveScene: UIWindowScene? {
        connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
    }
}
