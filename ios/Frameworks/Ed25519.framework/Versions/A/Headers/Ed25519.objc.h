// Objective-C API for talking to github.com/spacemeshos/ed25519 Go package.
//   gobind -lang=objc github.com/spacemeshos/ed25519
//
// File is generated by gobind. Do not edit.

#ifndef __Ed25519_H__
#define __Ed25519_H__

@import Foundation;
#include "ref.h"
#include "Universe.objc.h"


/**
 * PrivateKeySize is the size, in bytes, of private keys as used in this package.
 */
FOUNDATION_EXPORT const int64_t Ed25519PrivateKeySize;
/**
 * PublicKeySize is the size, in bytes, of public keys as used in this package.
 */
FOUNDATION_EXPORT const int64_t Ed25519PublicKeySize;
/**
 * SeedSize is the size, in bytes, of private key seeds. These are the private key representations used by RFC 8032.
 */
FOUNDATION_EXPORT const int64_t Ed25519SeedSize;
/**
 * SignatureSize is the size, in bytes, of signatures generated and verified by this package.
 */
FOUNDATION_EXPORT const int64_t Ed25519SignatureSize;

/**
 * ExtractPublicKey extracts the signer's public key given a message and its signature.
Note that signature must be created using Sign2() and NOT using Sign().
It will panic if len(sig) is not SignatureSize.
 */
FOUNDATION_EXPORT NSData* _Nullable Ed25519ExtractPublicKey(NSData* _Nullable message, NSData* _Nullable sig);

// skipped function GenerateKey with unsupported parameter or return types


/**
 * NewDerivedKeyFromSeed calculates a private key from a 32 bytes random seed, an integer index and salt
 */
FOUNDATION_EXPORT NSData* _Nullable Ed25519NewDerivedKeyFromSeed(NSData* _Nullable seed, NSData* _Nullable index, NSData* _Nullable salt);

/**
 * NewKeyFromSeed calculates a private key from a seed. It will panic if
len(seed) is not SeedSize. This function is provided for interoperability
with RFC 8032. RFC 8032's private keys correspond to seeds in this
package.
 */
FOUNDATION_EXPORT NSData* _Nullable Ed25519NewKeyFromSeed(NSData* _Nullable seed);

// skipped function Sign with unsupported parameter or return types


/**
 * Sign2 signs the message with privateKey and returns a signature.
The signature may be verified using Verify2(), if the signer's public key is known.
The signature returned by this method can be used together with the message
to extract the public key using ExtractPublicKey()
It will panic if len(privateKey) is not PrivateKeySize.
 */
FOUNDATION_EXPORT NSData* _Nullable Ed25519Sign2(NSData* _Nullable privateKey, NSData* _Nullable message);

// skipped function Verify with unsupported parameter or return types


/**
 * Verify2 verifies a signature created with Sign2(),
assuming the verifier possesses the public key.
 */
FOUNDATION_EXPORT BOOL Ed25519Verify2(NSData* _Nullable publicKey, NSData* _Nullable message, NSData* _Nullable sig);

#endif
