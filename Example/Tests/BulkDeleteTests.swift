//
//  BulkDeleteTests.swift
//  RangerApiClientV1_Tests
//
//  Created by Nicholas Cromwell  on 12/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Ranger_Swift_ApiClientV1

class BulkDeleteTests: QuickSpec {
    override func spec() {
        describe("BulkDelete init") {
            it("throws when externalIds is empty") {
                expect{try BulkDelete(externalIds: [])}.to(throwError(BulkDeleteErrors.externalIdsRequired))
            }
            it("does NOT throw when externalIds is not empty") {
                expect{try BulkDelete(externalIds: ["1"])}.notTo(throwError())
            }
        }
    }
}
