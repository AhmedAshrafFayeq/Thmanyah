//
//  Font+Extension.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import SwiftUI

enum FontFamily {
    case bold
    case semiBold
    case regular
    case medium
    case thin
}

extension Font {
    static func ibmArabicBold(_ size: CGFloat) -> Font {
        .custom("IBMPlexSansArabic-Bold", size: size)
    }

    static func ibmArabicSemiBold(_ size: CGFloat) -> Font {
        .custom("IBMPlexSansArabic-SemiBold", size: size)
    }

    static func ibmArabicRegular(_ size: CGFloat) -> Font {
        .custom("IBMPlexSansArabic-Regular", size: size)
    }

    static func ibmArabicMedium(_ size: CGFloat) -> Font {
        .custom("IBMPlexSansArabic-Medium", size: size)
    }

    static func ibmArabicThin(_ size: CGFloat) -> Font {
        .custom("IBMPlexSansArabic-Thin", size: size)
    }

    static func appFont(size: CGFloat, _ family: FontFamily = .regular) -> Font {
        switch family {
        case .bold:
            return .ibmArabicBold(size)
        case .semiBold:
            return .ibmArabicSemiBold(size)
        case .regular:
            return .ibmArabicRegular(size)
        case .medium:
            return .ibmArabicMedium(size)
        case .thin:
            return .ibmArabicThin(size)
        }
    }
}
