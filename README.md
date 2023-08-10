# Two Simple Ciphers

This repository contains the implementation of two simple ciphers in MIPS assembly language: the Null Cipher and the Transposition Cipher. The assignment involves decrypting strings that were encrypted using these ciphers. The assignment consists of two main parts, each focusing on a different cipher.

## Table of Contents

- [Null Cipher](#null-cipher)
  - [Description](#description)
  - [Implementation](#implementation)
  - [Functions to Write](#functions-to-write)

- [Transposition Cipher](#transposition-cipher)
  - [Description](#description)
  - [Implementation](#implementation)
  - [Functions to Write](#functions-to-write)

- [Usage and Execution](#usage-and-execution)
- [Notes](#notes)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Null Cipher

### Description

The Null Cipher is a basic form of cryptography where the message is hidden in plain sight within a seemingly normal message. In this assignment, a modified version of the Null Cipher is used, where an array of integers indicates which letters in each word are used to form the message. The integers are 1-based, and a sequence of these integers is used to decrypt the message.

### Implementation

The Null Cipher decryption process involves extracting characters from the ciphertext based on the provided integer sequence. Asterisks (*) indicate skipped words. The decrypted message is reconstructed by matching the words with the corresponding integers.

### Functions to Write

- `int null_cipher_decrypt_sf(char *plaintext, char *ciphertext, int *indices, int num_indices)`
  This function decrypts a message encrypted using the Null Cipher. It takes the ciphertext, an array of indices, and the number of indices as arguments and returns the length of the decrypted plaintext.

## Transposition Cipher

### Description

The Transposition Cipher rearranges characters of the plaintext to create the ciphertext. The plaintext is arranged in a grid and read column-wise to generate the ciphertext.

### Implementation

In the Transposition Cipher decryption process, the characters are read from the ciphertext grid column-wise, and the grid structure is reconstructed. The asterisks (*) used for padding in the grid are omitted, and the original message is obtained.

### Functions to Write

- `void transposition_cipher_decrypt_sf(char *plaintext, char *ciphertext, int num_rows, int num_cols)`
  This function decrypts a message encrypted using the Transposition Cipher. It takes the ciphertext, number of rows, and number of columns as arguments and returns the decrypted plaintext.

## Usage and Execution

1. Clone this repository to your local machine.
2. Assemble the MIPS assembly file using your preferred MIPS assembler.
3. Execute the program with appropriate command-line arguments.

## Example

For a detailed example of encryption and decryption using both the Null Cipher and Transposition Cipher, refer to the "Example" section in the assignment description.

## Notes

- Follow the provided function signatures and input requirements for accurate implementation.
- Ensure that you handle null-terminators appropriately for strings.
- Additional input validation and error handling may be required based on specific operation requirements.

## Contributing

Contributions to this project are welcome. If you find any issues or improvements, please submit a pull request. Follow the provided guidelines for contributing and ensure that your code adheres to the coding standards.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For any inquiries or feedback, please contact:
- Pushkar Taday
- Email: pmtaday@gmail.com
- GitHub: ptaday
