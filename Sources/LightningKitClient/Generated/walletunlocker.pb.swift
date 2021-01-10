// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: walletunlocker.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Lnrpc_GenSeedRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///
  ///aezeed_passphrase is an optional user provided passphrase that will be used
  ///to encrypt the generated aezeed cipher seed. When using REST, this field
  ///must be encoded as base64.
  var aezeedPassphrase: Data = SwiftProtobuf.Internal.emptyData

  ///
  ///seed_entropy is an optional 16-bytes generated via CSPRNG. If not
  ///specified, then a fresh set of randomness will be used to create the seed.
  ///When using REST, this field must be encoded as base64.
  var seedEntropy: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Lnrpc_GenSeedResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///
  ///cipher_seed_mnemonic is a 24-word mnemonic that encodes a prior aezeed
  ///cipher seed obtained by the user. This field is optional, as if not
  ///provided, then the daemon will generate a new cipher seed for the user.
  ///Otherwise, then the daemon will attempt to recover the wallet state linked
  ///to this cipher seed.
  var cipherSeedMnemonic: [String] = []

  ///
  ///enciphered_seed are the raw aezeed cipher seed bytes. This is the raw
  ///cipher text before run through our mnemonic encoding scheme.
  var encipheredSeed: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Lnrpc_InitWalletRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///
  ///wallet_password is the passphrase that should be used to encrypt the
  ///wallet. This MUST be at least 8 chars in length. After creation, this
  ///password is required to unlock the daemon. When using REST, this field
  ///must be encoded as base64.
  var walletPassword: Data = SwiftProtobuf.Internal.emptyData

  ///
  ///cipher_seed_mnemonic is a 24-word mnemonic that encodes a prior aezeed
  ///cipher seed obtained by the user. This may have been generated by the
  ///GenSeed method, or be an existing seed.
  var cipherSeedMnemonic: [String] = []

  ///
  ///aezeed_passphrase is an optional user provided passphrase that will be used
  ///to encrypt the generated aezeed cipher seed. When using REST, this field
  ///must be encoded as base64.
  var aezeedPassphrase: Data = SwiftProtobuf.Internal.emptyData

  ///
  ///recovery_window is an optional argument specifying the address lookahead
  ///when restoring a wallet seed. The recovery window applies to each
  ///individual branch of the BIP44 derivation paths. Supplying a recovery
  ///window of zero indicates that no addresses should be recovered, such after
  ///the first initialization of the wallet.
  var recoveryWindow: Int32 = 0

  ///
  ///channel_backups is an optional argument that allows clients to recover the
  ///settled funds within a set of channels. This should be populated if the
  ///user was unable to close out all channels and sweep funds before partial or
  ///total data loss occurred. If specified, then after on-chain recovery of
  ///funds, lnd begin to carry out the data loss recovery protocol in order to
  ///recover the funds in each channel from a remote force closed transaction.
  var channelBackups: Lnrpc_ChanBackupSnapshot {
    get {return _channelBackups ?? Lnrpc_ChanBackupSnapshot()}
    set {_channelBackups = newValue}
  }
  /// Returns true if `channelBackups` has been explicitly set.
  var hasChannelBackups: Bool {return self._channelBackups != nil}
  /// Clears the value of `channelBackups`. Subsequent reads from it will return its default value.
  mutating func clearChannelBackups() {self._channelBackups = nil}

  ///
  ///stateless_init is an optional argument instructing the daemon NOT to create
  ///any *.macaroon files in its filesystem. If this parameter is set, then the
  ///admin macaroon returned in the response MUST be stored by the caller of the
  ///RPC as otherwise all access to the daemon will be lost!
  var statelessInit: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _channelBackups: Lnrpc_ChanBackupSnapshot? = nil
}

struct Lnrpc_InitWalletResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///
  ///The binary serialized admin macaroon that can be used to access the daemon
  ///after creating the wallet. If the stateless_init parameter was set to true,
  ///this is the ONLY copy of the macaroon and MUST be stored safely by the
  ///caller. Otherwise a copy of this macaroon is also persisted on disk by the
  ///daemon, together with other macaroon files.
  var adminMacaroon: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Lnrpc_UnlockWalletRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///
  ///wallet_password should be the current valid passphrase for the daemon. This
  ///will be required to decrypt on-disk material that the daemon requires to
  ///function properly. When using REST, this field must be encoded as base64.
  var walletPassword: Data = SwiftProtobuf.Internal.emptyData

  ///
  ///recovery_window is an optional argument specifying the address lookahead
  ///when restoring a wallet seed. The recovery window applies to each
  ///individual branch of the BIP44 derivation paths. Supplying a recovery
  ///window of zero indicates that no addresses should be recovered, such after
  ///the first initialization of the wallet.
  var recoveryWindow: Int32 = 0

  ///
  ///channel_backups is an optional argument that allows clients to recover the
  ///settled funds within a set of channels. This should be populated if the
  ///user was unable to close out all channels and sweep funds before partial or
  ///total data loss occurred. If specified, then after on-chain recovery of
  ///funds, lnd begin to carry out the data loss recovery protocol in order to
  ///recover the funds in each channel from a remote force closed transaction.
  var channelBackups: Lnrpc_ChanBackupSnapshot {
    get {return _channelBackups ?? Lnrpc_ChanBackupSnapshot()}
    set {_channelBackups = newValue}
  }
  /// Returns true if `channelBackups` has been explicitly set.
  var hasChannelBackups: Bool {return self._channelBackups != nil}
  /// Clears the value of `channelBackups`. Subsequent reads from it will return its default value.
  mutating func clearChannelBackups() {self._channelBackups = nil}

  ///
  ///stateless_init is an optional argument instructing the daemon NOT to create
  ///any *.macaroon files in its file system.
  var statelessInit: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _channelBackups: Lnrpc_ChanBackupSnapshot? = nil
}

struct Lnrpc_UnlockWalletResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Lnrpc_ChangePasswordRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///
  ///current_password should be the current valid passphrase used to unlock the
  ///daemon. When using REST, this field must be encoded as base64.
  var currentPassword: Data = SwiftProtobuf.Internal.emptyData

  ///
  ///new_password should be the new passphrase that will be needed to unlock the
  ///daemon. When using REST, this field must be encoded as base64.
  var newPassword: Data = SwiftProtobuf.Internal.emptyData

  ///
  ///stateless_init is an optional argument instructing the daemon NOT to create
  ///any *.macaroon files in its filesystem. If this parameter is set, then the
  ///admin macaroon returned in the response MUST be stored by the caller of the
  ///RPC as otherwise all access to the daemon will be lost!
  var statelessInit: Bool = false

  ///
  ///new_macaroon_root_key is an optional argument instructing the daemon to
  ///rotate the macaroon root key when set to true. This will invalidate all
  ///previously generated macaroons.
  var newMacaroonRootKey: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Lnrpc_ChangePasswordResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///
  ///The binary serialized admin macaroon that can be used to access the daemon
  ///after rotating the macaroon root key. If both the stateless_init and
  ///new_macaroon_root_key parameter were set to true, this is the ONLY copy of
  ///the macaroon that was created from the new root key and MUST be stored
  ///safely by the caller. Otherwise a copy of this macaroon is also persisted on
  ///disk by the daemon, together with other macaroon files.
  var adminMacaroon: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "lnrpc"

extension Lnrpc_GenSeedRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenSeedRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "aezeed_passphrase"),
    2: .standard(proto: "seed_entropy"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.aezeedPassphrase)
      case 2: try decoder.decodeSingularBytesField(value: &self.seedEntropy)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.aezeedPassphrase.isEmpty {
      try visitor.visitSingularBytesField(value: self.aezeedPassphrase, fieldNumber: 1)
    }
    if !self.seedEntropy.isEmpty {
      try visitor.visitSingularBytesField(value: self.seedEntropy, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Lnrpc_GenSeedRequest, rhs: Lnrpc_GenSeedRequest) -> Bool {
    if lhs.aezeedPassphrase != rhs.aezeedPassphrase {return false}
    if lhs.seedEntropy != rhs.seedEntropy {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Lnrpc_GenSeedResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenSeedResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "cipher_seed_mnemonic"),
    2: .standard(proto: "enciphered_seed"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedStringField(value: &self.cipherSeedMnemonic)
      case 2: try decoder.decodeSingularBytesField(value: &self.encipheredSeed)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.cipherSeedMnemonic.isEmpty {
      try visitor.visitRepeatedStringField(value: self.cipherSeedMnemonic, fieldNumber: 1)
    }
    if !self.encipheredSeed.isEmpty {
      try visitor.visitSingularBytesField(value: self.encipheredSeed, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Lnrpc_GenSeedResponse, rhs: Lnrpc_GenSeedResponse) -> Bool {
    if lhs.cipherSeedMnemonic != rhs.cipherSeedMnemonic {return false}
    if lhs.encipheredSeed != rhs.encipheredSeed {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Lnrpc_InitWalletRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".InitWalletRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "wallet_password"),
    2: .standard(proto: "cipher_seed_mnemonic"),
    3: .standard(proto: "aezeed_passphrase"),
    4: .standard(proto: "recovery_window"),
    5: .standard(proto: "channel_backups"),
    6: .standard(proto: "stateless_init"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.walletPassword)
      case 2: try decoder.decodeRepeatedStringField(value: &self.cipherSeedMnemonic)
      case 3: try decoder.decodeSingularBytesField(value: &self.aezeedPassphrase)
      case 4: try decoder.decodeSingularInt32Field(value: &self.recoveryWindow)
      case 5: try decoder.decodeSingularMessageField(value: &self._channelBackups)
      case 6: try decoder.decodeSingularBoolField(value: &self.statelessInit)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.walletPassword.isEmpty {
      try visitor.visitSingularBytesField(value: self.walletPassword, fieldNumber: 1)
    }
    if !self.cipherSeedMnemonic.isEmpty {
      try visitor.visitRepeatedStringField(value: self.cipherSeedMnemonic, fieldNumber: 2)
    }
    if !self.aezeedPassphrase.isEmpty {
      try visitor.visitSingularBytesField(value: self.aezeedPassphrase, fieldNumber: 3)
    }
    if self.recoveryWindow != 0 {
      try visitor.visitSingularInt32Field(value: self.recoveryWindow, fieldNumber: 4)
    }
    if let v = self._channelBackups {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    if self.statelessInit != false {
      try visitor.visitSingularBoolField(value: self.statelessInit, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Lnrpc_InitWalletRequest, rhs: Lnrpc_InitWalletRequest) -> Bool {
    if lhs.walletPassword != rhs.walletPassword {return false}
    if lhs.cipherSeedMnemonic != rhs.cipherSeedMnemonic {return false}
    if lhs.aezeedPassphrase != rhs.aezeedPassphrase {return false}
    if lhs.recoveryWindow != rhs.recoveryWindow {return false}
    if lhs._channelBackups != rhs._channelBackups {return false}
    if lhs.statelessInit != rhs.statelessInit {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Lnrpc_InitWalletResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".InitWalletResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "admin_macaroon"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.adminMacaroon)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.adminMacaroon.isEmpty {
      try visitor.visitSingularBytesField(value: self.adminMacaroon, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Lnrpc_InitWalletResponse, rhs: Lnrpc_InitWalletResponse) -> Bool {
    if lhs.adminMacaroon != rhs.adminMacaroon {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Lnrpc_UnlockWalletRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UnlockWalletRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "wallet_password"),
    2: .standard(proto: "recovery_window"),
    3: .standard(proto: "channel_backups"),
    4: .standard(proto: "stateless_init"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.walletPassword)
      case 2: try decoder.decodeSingularInt32Field(value: &self.recoveryWindow)
      case 3: try decoder.decodeSingularMessageField(value: &self._channelBackups)
      case 4: try decoder.decodeSingularBoolField(value: &self.statelessInit)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.walletPassword.isEmpty {
      try visitor.visitSingularBytesField(value: self.walletPassword, fieldNumber: 1)
    }
    if self.recoveryWindow != 0 {
      try visitor.visitSingularInt32Field(value: self.recoveryWindow, fieldNumber: 2)
    }
    if let v = self._channelBackups {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if self.statelessInit != false {
      try visitor.visitSingularBoolField(value: self.statelessInit, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Lnrpc_UnlockWalletRequest, rhs: Lnrpc_UnlockWalletRequest) -> Bool {
    if lhs.walletPassword != rhs.walletPassword {return false}
    if lhs.recoveryWindow != rhs.recoveryWindow {return false}
    if lhs._channelBackups != rhs._channelBackups {return false}
    if lhs.statelessInit != rhs.statelessInit {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Lnrpc_UnlockWalletResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UnlockWalletResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Lnrpc_UnlockWalletResponse, rhs: Lnrpc_UnlockWalletResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Lnrpc_ChangePasswordRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ChangePasswordRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "current_password"),
    2: .standard(proto: "new_password"),
    3: .standard(proto: "stateless_init"),
    4: .standard(proto: "new_macaroon_root_key"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.currentPassword)
      case 2: try decoder.decodeSingularBytesField(value: &self.newPassword)
      case 3: try decoder.decodeSingularBoolField(value: &self.statelessInit)
      case 4: try decoder.decodeSingularBoolField(value: &self.newMacaroonRootKey)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.currentPassword.isEmpty {
      try visitor.visitSingularBytesField(value: self.currentPassword, fieldNumber: 1)
    }
    if !self.newPassword.isEmpty {
      try visitor.visitSingularBytesField(value: self.newPassword, fieldNumber: 2)
    }
    if self.statelessInit != false {
      try visitor.visitSingularBoolField(value: self.statelessInit, fieldNumber: 3)
    }
    if self.newMacaroonRootKey != false {
      try visitor.visitSingularBoolField(value: self.newMacaroonRootKey, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Lnrpc_ChangePasswordRequest, rhs: Lnrpc_ChangePasswordRequest) -> Bool {
    if lhs.currentPassword != rhs.currentPassword {return false}
    if lhs.newPassword != rhs.newPassword {return false}
    if lhs.statelessInit != rhs.statelessInit {return false}
    if lhs.newMacaroonRootKey != rhs.newMacaroonRootKey {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Lnrpc_ChangePasswordResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ChangePasswordResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "admin_macaroon"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.adminMacaroon)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.adminMacaroon.isEmpty {
      try visitor.visitSingularBytesField(value: self.adminMacaroon, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Lnrpc_ChangePasswordResponse, rhs: Lnrpc_ChangePasswordResponse) -> Bool {
    if lhs.adminMacaroon != rhs.adminMacaroon {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
