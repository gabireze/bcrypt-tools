# Bcrypt.tools - Hash Generator and Verifier Tools

Bcrypt.tools is an online platform that provides tools for generating and verifying various cryptographic hashes, including bcrypt, Argon2, PBKDF2, HMAC, and more. This project is built using only HTML, CSS with Tailwind, and JavaScript, without any backend frameworks or services. All cryptographic operations are handled using specialized libraries like `bcrypt.js`, `hash-wasm`, and `crypto.subtle`. Access the tool online at [https://bcrypt.tools/](https://bcrypt.tools/).

## Key Features

### Hashing Algorithms

- **Bcrypt**
- **Argon2** (Argon2id, Argon2i, and Argon2d)
- **PBKDF2**
- **HMAC** (with SHA-256, SHA-512, and MD5)
- **CRC32**
- **MD4, MD5, SHA-1, SHA-256, SHA-512**

Each algorithm offers a secure method for generating cryptographic hashes for your data, ensuring strong password protection and data integrity.

### Encrypt

- **Generate a secure hash** for any plaintext, allowing enhanced password protection or data integrity validation.

#### Usage

1. **Plain Text:** Enter the text you wish to hash.
2. **Salt / Key (if applicable):** Enter a salt or secret key to strengthen the hash (applicable for certain algorithms like Argon2, PBKDF2, and HMAC).
3. **Parameters (if applicable):** Choose parameters such as the number of iterations, memory cost, or parallelism for algorithms like Argon2 and PBKDF2.
4. **Algorithm Selection:** Choose which hashing algorithm to use from the dropdown.
5. **Generate Hash:** Click to generate the hash of the plaintext.
6. **Reset:** Clears all input fields.

### Verify

- **Verify if a plaintext matches a specific hash**, ensuring secure login validation or data integrity checks.

#### Usage

1. **Plain Text:** Enter the text you want to verify.
2. **Salt / Key (if applicable):** Enter the salt or key used to generate the original hash.
3. **Hash:** Paste the hash you want to verify the text against.
4. **Algorithm Selection:** Choose which hashing algorithm was used to generate the hash.
5. **Verify Hash:** Click to check if the plaintext matches the hash.
6. **Reset:** Clears all input fields.

## About `bcrypt.js` and `hash-wasm`

This project leverages `bcrypt.js` for bcrypt operations and `hash-wasm` for handling cryptographic operations such as Argon2, HMAC, and CRC32. These libraries provide robust cryptographic methods that ensure data security.

- **bcrypt.js** is authored by Daniel Wirtz (`dcode@dcode.io`) and released under the Apache License, Version 2.0. For more details, visit: [bcrypt.js on GitHub](https://github.com/dcodeIO/bcrypt.js).
- **hash-wasm** is a fast hashing library for modern browsers and Node.js.

## License

This project is licensed under the ISC License, promoting the use and redistribution of the software with minimal restrictions.

## Contributing

Contributions are highly encouraged! If you would like to contribute, please feel free to fork the repository, make your changes, and submit a pull request.

## Relevant Links

- [How To Safely Store A Password](https://codahale.com/how-to-safely-store-a-password/)
- [Bcrypt Paper (PDF)](https://www.openbsd.org/papers/bcrypt-paper.pdf)
- [Wikipedia: Bcrypt](https://en.wikipedia.org/wiki/Bcrypt)
- [Wikipedia: Argon2](https://en.wikipedia.org/wiki/Argon2)
- [RFC 2104: HMAC](https://tools.ietf.org/html/rfc2104)
- [PBKDF2 Specification (RFC 2898)](https://tools.ietf.org/html/rfc2898)
- [bcrypt.js Repository on GitHub](https://github.com/dcodeIO/bcrypt.js)
- [hash-wasm Repository on GitHub](https://github.com/Daninet/hash-wasm)
