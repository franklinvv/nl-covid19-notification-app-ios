/*
 * Copyright (c) 2020 De Staat der Nederlanden, Ministerie van Volksgezondheid, Welzijn en Sport.
 *  Licensed under the EUROPEAN UNION PUBLIC LICENCE v. 1.2
 *
 *  SPDX-License-Identifier: EUPL-1.2
 */

import Foundation

struct PrePostKeysRequest: Encodable {
    let keys: [TemporaryKey]
    let bucketId: Data
}

struct PostKeysRequest: Codable {
    let keys: [TemporaryKey]
    let bucketId: Data
    let padding: String
}

struct TemporaryKey: Codable {
    let keyData: String
    let rollingStartNumber: Int
    let rollingPeriod: Int
    var regionsOfInterest: [String] = []
}
