// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: apple/swift_homomorphic_encryption/pir/v1/pir.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2024 Apple Inc. and the Swift Homomorphic Encryption project authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import SwiftProtobuf

import HomomorphicEncryptionProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// How aggressively to compress the Galois keys needed for expansion.
public enum Apple_SwiftHomomorphicEncryption_Pir_V1_KeyCompressionStrategy: SwiftProtobuf.Enum, Swift.CaseIterable {
  public typealias RawValue = Int

  /// Generate keys for all permutations.
  case unspecified // = 0

  /// Only generate keys for permutations 2^j + 1 with j <= ceil(log_degree + 1 / 2)
  /// reconstruct permutations 2^j + 1 for higher j by composing permutations.
  case maximumCompression // = 1

  /// Add one more key to the maximum compression keys to roughly square root the number
  /// of keyswitches required during expansion.
  case hybridCompression // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .unspecified
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .maximumCompression
    case 2: self = .hybridCompression
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .maximumCompression: return 1
    case .hybridCompression: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static let allCases: [Apple_SwiftHomomorphicEncryption_Pir_V1_KeyCompressionStrategy] = [
    .unspecified,
    .maximumCompression,
    .hybridCompression,
  ]

}

/// Parameters for PIR.
/// These need to be agreed upon by both the server and client.
public struct Apple_SwiftHomomorphicEncryption_Pir_V1_PirParameters: @unchecked Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Encryption parameters.
  public var encryptionParameters: HomomorphicEncryptionProtobuf.Apple_SwiftHomomorphicEncryption_V1_EncryptionParameters {
    get {return _storage._encryptionParameters ?? HomomorphicEncryptionProtobuf.Apple_SwiftHomomorphicEncryption_V1_EncryptionParameters()}
    set {_uniqueStorage()._encryptionParameters = newValue}
  }
  /// Returns true if `encryptionParameters` has been explicitly set.
  public var hasEncryptionParameters: Bool {return _storage._encryptionParameters != nil}
  /// Clears the value of `encryptionParameters`. Subsequent reads from it will return its default value.
  public mutating func clearEncryptionParameters() {_uniqueStorage()._encryptionParameters = nil}

  /// Number of entries in the database.
  public var numEntries: UInt64 {
    get {return _storage._numEntries}
    set {_uniqueStorage()._numEntries = newValue}
  }

  /// Size in bytes of entries in the database.
  public var entrySize: UInt64 {
    get {return _storage._entrySize}
    set {_uniqueStorage()._entrySize = newValue}
  }

  /// Dimensions that make up the hypercube.
  public var dimensions: [UInt64] {
    get {return _storage._dimensions}
    set {_uniqueStorage()._dimensions = newValue}
  }

  /// Parameters specific to KeywordPIR.
  public var keywordPirParams: Apple_SwiftHomomorphicEncryption_Pir_V1_KeywordPirParameters {
    get {return _storage._keywordPirParams ?? Apple_SwiftHomomorphicEncryption_Pir_V1_KeywordPirParameters()}
    set {_uniqueStorage()._keywordPirParams = newValue}
  }
  /// Returns true if `keywordPirParams` has been explicitly set.
  public var hasKeywordPirParams: Bool {return _storage._keywordPirParams != nil}
  /// Clears the value of `keywordPirParams`. Subsequent reads from it will return its default value.
  public mutating func clearKeywordPirParams() {_uniqueStorage()._keywordPirParams = nil}

  /// Server-side PIR algorithm.
  public var algorithm: Apple_SwiftHomomorphicEncryption_Pir_V1_PirAlgorithm {
    get {return _storage._algorithm}
    set {_uniqueStorage()._algorithm = newValue}
  }

  /// Maximum number of queries allowed in a single request.
  public var batchSize: UInt64 {
    get {return _storage._batchSize}
    set {_uniqueStorage()._batchSize = newValue}
  }

  /// Evaluation key configuration.
  public var evaluationKeyConfig: HomomorphicEncryptionProtobuf.Apple_SwiftHomomorphicEncryption_V1_EvaluationKeyConfig {
    get {return _storage._evaluationKeyConfig ?? HomomorphicEncryptionProtobuf.Apple_SwiftHomomorphicEncryption_V1_EvaluationKeyConfig()}
    set {_uniqueStorage()._evaluationKeyConfig = newValue}
  }
  /// Returns true if `evaluationKeyConfig` has been explicitly set.
  public var hasEvaluationKeyConfig: Bool {return _storage._evaluationKeyConfig != nil}
  /// Clears the value of `evaluationKeyConfig`. Subsequent reads from it will return its default value.
  public mutating func clearEvaluationKeyConfig() {_uniqueStorage()._evaluationKeyConfig = nil}

  /// Key compression strategy.
  public var keyCompressionStrategy: Apple_SwiftHomomorphicEncryption_Pir_V1_KeyCompressionStrategy {
    get {return _storage._keyCompressionStrategy}
    set {_uniqueStorage()._keyCompressionStrategy = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Parameters for keyword PIR.
public struct Apple_SwiftHomomorphicEncryption_Pir_V1_KeywordPirParameters: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The number of hash functions used.
  public var numHashFunctions: UInt64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Encrypted PIR index.
public struct Apple_SwiftHomomorphicEncryption_Pir_V1_EncryptedIndices: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// PIR query.
  public var ciphertexts: [HomomorphicEncryptionProtobuf.Apple_SwiftHomomorphicEncryption_V1_SerializedCiphertext] = []

  /// Number of PIR calls.
  public var numPirCalls: UInt64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "apple.swift_homomorphic_encryption.pir.v1"

extension Apple_SwiftHomomorphicEncryption_Pir_V1_KeyCompressionStrategy: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "KEY_COMPRESSION_STRATEGY_UNSPECIFIED"),
    1: .same(proto: "KEY_COMPRESSION_STRATEGY_MAXIMUM_COMPRESSION"),
    2: .same(proto: "KEY_COMPRESSION_STRATEGY_HYBRID_COMPRESSION"),
  ]
}

extension Apple_SwiftHomomorphicEncryption_Pir_V1_PirParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PirParameters"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "encryption_parameters"),
    2: .standard(proto: "num_entries"),
    3: .standard(proto: "entry_size"),
    4: .same(proto: "dimensions"),
    5: .standard(proto: "keyword_pir_params"),
    6: .same(proto: "algorithm"),
    7: .standard(proto: "batch_size"),
    8: .standard(proto: "evaluation_key_config"),
    9: .standard(proto: "key_compression_strategy"),
  ]

  fileprivate class _StorageClass {
    var _encryptionParameters: HomomorphicEncryptionProtobuf.Apple_SwiftHomomorphicEncryption_V1_EncryptionParameters? = nil
    var _numEntries: UInt64 = 0
    var _entrySize: UInt64 = 0
    var _dimensions: [UInt64] = []
    var _keywordPirParams: Apple_SwiftHomomorphicEncryption_Pir_V1_KeywordPirParameters? = nil
    var _algorithm: Apple_SwiftHomomorphicEncryption_Pir_V1_PirAlgorithm = .aclsPir
    var _batchSize: UInt64 = 0
    var _evaluationKeyConfig: HomomorphicEncryptionProtobuf.Apple_SwiftHomomorphicEncryption_V1_EvaluationKeyConfig? = nil
    var _keyCompressionStrategy: Apple_SwiftHomomorphicEncryption_Pir_V1_KeyCompressionStrategy = .unspecified

    #if swift(>=5.10)
      // This property is used as the initial default value for new instances of the type.
      // The type itself is protecting the reference to its storage via CoW semantics.
      // This will force a copy to be made of this reference when the first mutation occurs;
      // hence, it is safe to mark this as `nonisolated(unsafe)`.
      static nonisolated(unsafe) let defaultInstance = _StorageClass()
    #else
      static let defaultInstance = _StorageClass()
    #endif

    private init() {}

    init(copying source: _StorageClass) {
      _encryptionParameters = source._encryptionParameters
      _numEntries = source._numEntries
      _entrySize = source._entrySize
      _dimensions = source._dimensions
      _keywordPirParams = source._keywordPirParams
      _algorithm = source._algorithm
      _batchSize = source._batchSize
      _evaluationKeyConfig = source._evaluationKeyConfig
      _keyCompressionStrategy = source._keyCompressionStrategy
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every case branch when no optimizations are
        // enabled. https://github.com/apple/swift-protobuf/issues/1034
        switch fieldNumber {
        case 1: try { try decoder.decodeSingularMessageField(value: &_storage._encryptionParameters) }()
        case 2: try { try decoder.decodeSingularUInt64Field(value: &_storage._numEntries) }()
        case 3: try { try decoder.decodeSingularUInt64Field(value: &_storage._entrySize) }()
        case 4: try { try decoder.decodeRepeatedUInt64Field(value: &_storage._dimensions) }()
        case 5: try { try decoder.decodeSingularMessageField(value: &_storage._keywordPirParams) }()
        case 6: try { try decoder.decodeSingularEnumField(value: &_storage._algorithm) }()
        case 7: try { try decoder.decodeSingularUInt64Field(value: &_storage._batchSize) }()
        case 8: try { try decoder.decodeSingularMessageField(value: &_storage._evaluationKeyConfig) }()
        case 9: try { try decoder.decodeSingularEnumField(value: &_storage._keyCompressionStrategy) }()
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every if/case branch local when no optimizations
      // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
      // https://github.com/apple/swift-protobuf/issues/1182
      try { if let v = _storage._encryptionParameters {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      } }()
      if _storage._numEntries != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._numEntries, fieldNumber: 2)
      }
      if _storage._entrySize != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._entrySize, fieldNumber: 3)
      }
      if !_storage._dimensions.isEmpty {
        try visitor.visitPackedUInt64Field(value: _storage._dimensions, fieldNumber: 4)
      }
      try { if let v = _storage._keywordPirParams {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      } }()
      if _storage._algorithm != .aclsPir {
        try visitor.visitSingularEnumField(value: _storage._algorithm, fieldNumber: 6)
      }
      if _storage._batchSize != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._batchSize, fieldNumber: 7)
      }
      try { if let v = _storage._evaluationKeyConfig {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
      } }()
      if _storage._keyCompressionStrategy != .unspecified {
        try visitor.visitSingularEnumField(value: _storage._keyCompressionStrategy, fieldNumber: 9)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Apple_SwiftHomomorphicEncryption_Pir_V1_PirParameters, rhs: Apple_SwiftHomomorphicEncryption_Pir_V1_PirParameters) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._encryptionParameters != rhs_storage._encryptionParameters {return false}
        if _storage._numEntries != rhs_storage._numEntries {return false}
        if _storage._entrySize != rhs_storage._entrySize {return false}
        if _storage._dimensions != rhs_storage._dimensions {return false}
        if _storage._keywordPirParams != rhs_storage._keywordPirParams {return false}
        if _storage._algorithm != rhs_storage._algorithm {return false}
        if _storage._batchSize != rhs_storage._batchSize {return false}
        if _storage._evaluationKeyConfig != rhs_storage._evaluationKeyConfig {return false}
        if _storage._keyCompressionStrategy != rhs_storage._keyCompressionStrategy {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Apple_SwiftHomomorphicEncryption_Pir_V1_KeywordPirParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".KeywordPirParameters"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "num_hash_functions"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.numHashFunctions) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.numHashFunctions != 0 {
      try visitor.visitSingularUInt64Field(value: self.numHashFunctions, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Apple_SwiftHomomorphicEncryption_Pir_V1_KeywordPirParameters, rhs: Apple_SwiftHomomorphicEncryption_Pir_V1_KeywordPirParameters) -> Bool {
    if lhs.numHashFunctions != rhs.numHashFunctions {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Apple_SwiftHomomorphicEncryption_Pir_V1_EncryptedIndices: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EncryptedIndices"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "ciphertexts"),
    2: .standard(proto: "num_pir_calls"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.ciphertexts) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.numPirCalls) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.ciphertexts.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.ciphertexts, fieldNumber: 1)
    }
    if self.numPirCalls != 0 {
      try visitor.visitSingularUInt64Field(value: self.numPirCalls, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Apple_SwiftHomomorphicEncryption_Pir_V1_EncryptedIndices, rhs: Apple_SwiftHomomorphicEncryption_Pir_V1_EncryptedIndices) -> Bool {
    if lhs.ciphertexts != rhs.ciphertexts {return false}
    if lhs.numPirCalls != rhs.numPirCalls {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
