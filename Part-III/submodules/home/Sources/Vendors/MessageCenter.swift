//
//  MessageCenter.swift
//  Dad
//
//  Created by BOARDY on 5/31/21.
//

/*
import Foundation
import SwiftMessages

enum MessageCenter {
    enum Style {
        case info
        case success
        case warning
        case error

        var theme: Theme {
            switch self {
            case .info:
                return .info
            case .success:
                return .success
            case .warning:
                return .warning
            case .error:
                return .error
            }
        }
    }

    static func show(style: Style, title: String, message: String, icon: String = "💐", buttonTitle: String? = nil, buttonTapHandler: (() -> Void)? = nil) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(style.theme)
        view.configureDropShadow()
        view.configureContent(title: title,
                              body: message,
                              iconImage: nil,
                              iconText: icon,
                              buttonImage: nil,
                              buttonTitle: buttonTitle,
                              buttonTapHandler: { _ in
                                  buttonTapHandler?()
                              })
        if buttonTitle == nil {
            view.button?.isHidden = true
        }

        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        (view.backgroundView as? CornerRoundingView)?.layer.cornerRadius = 10

        SwiftMessages.show(view: view)
    }
}
*/
