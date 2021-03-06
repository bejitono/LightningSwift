//
//  BTCAddress.swift
//  LightningSwift
//
//  Created by De MicheliStefano on 14.12.19.
//  Copyright © 2019 De MicheliStefano. All rights reserved.
//

public struct BTCAddress {
    
    public let address: String
    // let type: BTCAddressType

    public init(address: String) {
        self.address = address
    }
}

public enum BTCAddressType {
    case P2PKH
    case P2SH
    case Bech32
}

public enum LNSAddressType {
    case p2wkh // witnessPubkeyHash
    case np2wkh // nestedPubkeyHash
}
