import UIKit
import ApphudSDK
import StoreKit

typealias ProductsResultBlock = (_ products: [SKProduct]?) -> Void
typealias SubscriptionSuccessBlock = (_ isPurchaseResult: Bool, _ error: String?) -> Void
typealias PaywallsResultBlock = (_ paywalls: [ApphudPaywall]?, _ error: String?) -> Void

class SubscriptionManager {
    
    static let shared = SubscriptionManager()
    
    func getPaywall(completion: @escaping PaywallsResultBlock) {
        Apphud.getPaywalls { paywalls, error in
            if let paywalls = paywalls {
                completion(paywalls, nil)
            } else {
                completion(nil, error?.localizedDescription)
            }
        }
    }
    
    func buySubscription(product: ApphudProduct, completion: @escaping SubscriptionSuccessBlock) {
        Apphud.purchase(product) { result in
            if let subscription = result.subscription, subscription.isActive() {
                completion(true, nil)
            } else {
                completion(false, result.error?.localizedDescription)
            }
        }
    }
    
    func restoreSubscription(completion: @escaping SubscriptionSuccessBlock) {
        Apphud.restorePurchases { subscriptions, purchases, error in
            completion(Apphud.hasActiveSubscription(), error?.localizedDescription)
        }
    }
    
    func subscriptionStatus(completion: @escaping (Bool) -> Void) {
        completion(Apphud.hasActiveSubscription())
    }
}
