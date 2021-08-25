//
//  DepartmentGuidanceHeaderTitle.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/11.
//

import Foundation

enum DepartmentGuidanceHeaderTitle: CaseIterable {
    ///情報系学科
    case informationProcessingDepartmentRoom
    case informationBusinessLicenseDepartmentRoom
    case informationSystemDevelopmentDepartmentRoom
    case advancedInformationProcessingDepartmentRoom
    
    ///ゲーム系学科
    case gameProductionResearchDepartmentRoom
    case gamePlanningDepartmentRoom
    case gameProductionDepartmentRoom
    
    ///アニメーション学科
    case animationDepartmentRoom
    case animationResearchDepartmentRoom
   
    ///デザイン系学科
    case graphicDesignDepartmentRoom
    case webDesignDepartmentRoom
    
    ///ケータイ・アプリケーション科
    case mobileApplicationDepartmentRoom
    
    ///CG学科
    case computerGraphicResearchDepartmentRoom
    case computerGraphicDepartmentRoom
    case cgVideosProductionDepartmentRoom
    
    ///AI学科
    case aiSystemDepartmentRoom
    
    ///ネットワークセキュリティ
    case networkSecurityDepartmentRoom
    
    ///電子系学科
    case advancedElectricalEngineeringDepartmentRoom
    case electricalEngineeringDepartmentRoom
    case electricalWorkTechnologyDepartmentRoom
    case electronicAppliedEngineeringDepartmentRoom
    
    /// ヘッダーのタイトル
    var title: String {
        switch self {
        case .informationProcessingDepartmentRoom:
            return "情報処理科"
        case .informationBusinessLicenseDepartmentRoom:
            return "情報ビジネスライセンス科"
        case .informationSystemDevelopmentDepartmentRoom:
            return "情報システム開発科"
        case .advancedInformationProcessingDepartmentRoom:
            return "高度情報処理科"
        case .gameProductionResearchDepartmentRoom:
            return "ゲーム制作研究科"
        case .gamePlanningDepartmentRoom:
            return "ゲーム企画科"
        case .gameProductionDepartmentRoom:
            return "ゲーム制作科"
        case .animationDepartmentRoom:
            return "アニメーション科"
        case .animationResearchDepartmentRoom:
            return "アニメーション研究科"
        case .graphicDesignDepartmentRoom:
            return "グラフィックデザイン科"
        case .webDesignDepartmentRoom:
            return "webデザイン科"
        case .mobileApplicationDepartmentRoom:
            return "ケータイ・アプリケーション科"
        case .computerGraphicResearchDepartmentRoom:
            return "コンピューターグラフィック研究科"
        case .computerGraphicDepartmentRoom:
            return "コンピューターグラフィック科"
        case .cgVideosProductionDepartmentRoom:
            return "CG映像制作科"
        case .aiSystemDepartmentRoom:
            return "AIシステム科"
        case .networkSecurityDepartmentRoom:
            return "ネットワークセキュリティー科"
        case .advancedElectricalEngineeringDepartmentRoom:
            return "高度電気工学科"
        case .electricalEngineeringDepartmentRoom:
            return "電気工学科"
        case .electricalWorkTechnologyDepartmentRoom:
            return "電気工事技術科"
        case .electronicAppliedEngineeringDepartmentRoom:
            return "電子応用工学科"
        }
    }
}
