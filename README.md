# Bcrypt.tools - Bcrypt Hash Generator and Verifier Tool

Bcrypt.tools is an online tool that efficiently generates and verifies bcrypt hashes, enhancing the security for passwords and sensitive data. This project is meticulously crafted using only HTML, CSS with Tailwind, and JavaScript, eschewing any frameworks or backend services. It exclusively relies on the `bcrypt.js` library to perform all bcrypt-related operations, ensuring a robust and focused cryptographic solution. Access the tool online at [https://bcrypt.tools/](https://bcrypt.tools/).

## Key Features

### Encrypt
- **Generate a secure bcrypt hash from any plaintext** for enhanced password protection.

#### Usage
1. **Plain Text:** Enter the text you wish to hash.
2. **Work Factor:** Select the number of rounds (e.g., 10 for default security).
3. **Generate Hash:** Click to generate the bcrypt hash of the plaintext.
4. **Reset:** Clears all input fields.

### Decrypt
- **Verify if a plaintext matches a specific bcrypt hash**, ensuring secure login validation.

#### Usage
1. **Plain Text:** Enter the text you want to verify.
2. **Hash:** Paste the bcrypt hash against which to verify the text.
3. **Verify Hash:** Click to check if the plaintext matches the hash.
4. **Reset:** Clears all input fields.

## About `bcrypt.js`
This project relies on the `bcrypt.js` library, authored by Daniel Wirtz (`dcode@dcode.io`) and released under the Apache License, Version 2.0. For more details, visit: [bcrypt.js on GitHub](https://github.com/dcodeIO/bcrypt.js).

## License
This project is licensed under the ISC License, promoting the use and redistribution of the software with minimal restrictions.

## Contributing
Contributions are highly encouraged! If you would like to contribute, please feel free to fork the repository, make your changes, and submit a pull request.

## Relevant Links
- [How To Safely Store A Password](https://codahale.com/how-to-safely-store-a-password/)
- [Bcrypt Paper (PDF)](https://www.openbsd.org/papers/bcrypt-paper.pdf)
- [Wikipedia: Bcrypt](https://en.wikipedia.org/wiki/Bcrypt)
- [Bcrypt.js Repository on GitHub](https://github.com/dcodeIO/bcrypt.js)
