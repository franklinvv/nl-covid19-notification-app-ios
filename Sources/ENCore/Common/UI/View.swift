/*
 * Copyright (c) 2020 De Staat der Nederlanden, Ministerie van Volksgezondheid, Welzijn en Sport.
 *  Licensed under the EUROPEAN UNION PUBLIC LICENCE v. 1.2
 *
 *  SPDX-License-Identifier: EUPL-1.2
 */

import UIKit

open class View: UIView, Themeable {

    public let theme: Theme

    // MARK: - Init

    init(theme: Theme) {
        self.theme = theme
        super.init(frame: .zero)

        configure()
    }

    @available(*, unavailable, message: "Use `init(theme:)`")
    init() {
        fatalError("Not Supported")
    }

    @available(*, unavailable, message: "Use `init(theme:)`")
    override public init(frame: CGRect) {
        fatalError("Not Supported")
    }

    @available(*, unavailable, message: "NSCoder and Interface Builder is not supported. Use Programmatic layout.")
    public required init?(coder: NSCoder) {
        fatalError("Not Supported")
    }

    // MARK: - Internal

    func configure() {

        build()
        setupConstraints()
    }

    open func build() {
        backgroundColor = theme.colors.viewControllerBackground
    }

    open func setupConstraints() {}

    // MARK: - Utility

    class func deviceHasHomeButton() -> Bool {
        var key: UIWindow? {
            if #available(iOS 13, *) {
                return UIApplication.shared.windows.first { $0.isKeyWindow }
            } else {
                return UIApplication.shared.keyWindow
            }
        }
        return key?.safeAreaInsets.bottom ?? 0 == CGFloat(0)
    }
}
