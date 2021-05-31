# ed25519_lib

A lib for spacemesh.io ed25519 [implementation](https://github.com/spacemeshos/ed25519) using gomobile.

- ExtractPublicKey extracts the signer's public key given a message and its signature.
  Note that signature must be created using Sign2() and NOT using Sign().
  It will panic if len(sig) is not SignatureSize.

  `FOUNDATION_EXPORT NSData Ed25519ExtractPublicKey(NSData* message, NSData* sig);`

- NewDerivedKeyFromSeed calculates a private key from a 32 bytes random seed, an integer index and salt

  `FOUNDATION_EXPORT NSData Ed25519NewDerivedKeyFromSeed(NSData* seed, NSData* index, NSData\* salt);`

- NewKeyFromSeed calculates a private key from a seed. It will panic if
  len(seed) is not SeedSize. This function is provided for interoperability
  with RFC 8032. RFC 8032's private keys correspond to seeds in this
  package.

  `FOUNDATION_EXPORT NSData_ Ed25519NewKeyFromSeed(NSData\* seed);`

- Sign2 signs the message with privateKey and returns a signature.
  The signature may be verified using Verify2(), if the signer's public key is known.
  The signature returned by this method can be used together with the message
  to extract the public key using ExtractPublicKey()
  It will panic if len(privateKey) is not PrivateKeySize.

  `FOUNDATION_EXPORT NSData_ Ed25519Sign2(NSData* privateKey, NSData* message);`

- Verify2 verifies a signature created with Sign2(),
  assuming the verifier possesses the public key.

  `FOUNDATION_EXPORT BOOL Ed25519Verify2(NSData_ publicKey, NSData* message, NSData* sig);`
