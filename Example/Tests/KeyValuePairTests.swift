//
//  KeyValuePairTests.swift
//  RangerApiClientV1_Tests
//
//  Created by Nicholas Cromwell  on 12/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Ranger_Swift_ApiClientV1

class KeyValuePairTests: QuickSpec {
    override func spec() {
        describe("KeyValuePair init") {
            it("throws when key is empty") {
                expect{try KeyValuePair(key: "", value: "1")}.to(throwError(KeyValuePairErrors.keyRequired))
            }
            it("does NOT throw when key is not empty") {
                expect{try KeyValuePair(key: "1", value: "1")}.notTo(throwError())
            }
            it("throws when value is empty") {
                expect{try KeyValuePair(key: "1", value: "")}.to(throwError(KeyValuePairErrors.valueRequired))
            }
            it("does NOT throw when value is not empty") {
                expect{try KeyValuePair(key: "1", value: "1")}.notTo(throwError())
            }
        }
    }
}
