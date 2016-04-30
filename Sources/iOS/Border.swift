//
//  Border.swift
//  Border
//
//  Created by Khoa Pham on 30/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

public extension UIView {
  public override class func initialize() {
    struct Static {
      static var token: dispatch_once_t = 0
    }

    // make sure this isn't a subclass
    if self !== UIView.self {
      return
    }

    dispatch_once(&Static.token) {
      let swizzle: (String, String) -> Void = { (original, swizzled) in
        let originalSelector = Selector(original)
        let swizzledSelector = Selector(swizzled)

        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)

        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))

        if didAddMethod {
          class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
          method_exchangeImplementations(originalMethod, swizzledMethod)
        }
      }

      let pairs = [
        "didMoveToSuperview": "border_didMoveToSuperview"
      ]

      pairs.forEach { (key, value) in
        swizzle(key, value)
      }
    }
  }

  // MARK: Method Swizzling

  func border_didMoveToSuperview() {
    layer.borderWidth = 1
    layer.borderColor = UIColor.brownColor().CGColor
    border_didMoveToSuperview()
  }
}
