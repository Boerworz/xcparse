//
//  ActionTestSummaryIdentifiableObject.swift
//  XCParseCore
//
//  Created by Alex Botkin on 10/4/19.
//  Copyright © 2019 ChargePoint, Inc. All rights reserved.
//

import Foundation

open class ActionTestSummaryIdentifiableObject : ActionAbstractTestSummary {
    public let identifier: String?
    
    // xcresult 3.39 and above
    public let identifierURL: String?

    enum ActionTestSummaryIdentifiableObjectCodingKeys: String, CodingKey {
        case identifier
        case identifierURL
    }

     required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ActionTestSummaryIdentifiableObjectCodingKeys.self)
        identifier = try container.decodeXCResultTypeIfPresent(forKey: .identifier)
        identifierURL = try container.decodeXCResultTypeIfPresent(forKey: .identifierURL)
        try super.init(from: decoder)
    }
}
