//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";

// Graph Maxi Commit Reveal scheme
contract YourContract {
    event Commit(address, bytes32);
    event Reveal(address, bytes32, string);

    function getHash(string calldata _input) public pure returns (bytes32) {
        return keccak256(abi.encode(_input));
    }

    function commit(bytes32 _hash) external {
        emit Commit(msg.sender, _hash);
    }

    function reveal(string calldata _input) external {
        bytes32 _hash = getHash(_input);
        emit Reveal(msg.sender, _hash, _input);
    }
}

// Onchain Storage Maxi
// contract YourContract2 {
//     event Commit(address, bytes32);
//     event Reveal(address, bytes32, string);

//     mapping(bytes32 => string) public secrets;

//     function getHash(string memory _input) public pure returns (bytes32) {
//         return keccak256(abi.encode(_input));
//     }

//     function commit(bytes32 _hash) public {
//         require(
//             keccak256(abi.encode(secrets[_hash])) == keccak256(""),
//             "Already revealed"
//         );
//         emit Commit(msg.sender, _hash);
//     }

//     function reveal(string calldata _truth) public {
//         bytes32 _hash = getHash(_truth);
//         require(getHash(secrets[_hash]) == getHash(""), "Already Revealed");
//         emit Reveal(msg.sender, _hash, _truth);
//     }
// }

// Onchain Storage Maxi + Staking mechanism
// contract YourContract3 {
//     event Commit(address, bytes32);
//     event Reveal(address, bytes32, string);

//     mapping(bytes32 => string) public secrets;

//     function getHash(string memory _input) public pure returns (bytes32) {
//         return keccak256(abi.encode(_input));
//     }

//     function commit(bytes32 _hash) public {
//         require(
//             keccak256(abi.encode(secrets[_hash])) == keccak256(""),
//             "Already revealed"
//         );
//         emit Commit(msg.sender, _hash);
//     }

//     function reveal(string calldata _truth) public {
//         bytes32 _hash = getHash(_truth);
//         require(getHash(secrets[_hash]) == getHash(""), "Already Revealed");
//         emit Reveal(msg.sender, _hash, _truth);
//     }
// }