// Suggest to add TestCase into Question contract

// // SPDX-License-Identifer: UNLICENSED
// pragma solidity ^0.8.6;

// import "./ITestCase.sol";

// contract TestCase is ITestCase {
//     struct TestCaseStruct {
//         bytes32 input;
//         bytes32 output;
//     }

//     address payable public owner;
//     mapping(uint256 => address) prizePool;
//     mapping(uint256 => address) winner;
//     mapping(uint256 => TestCaseStruct) public testCases;
//     uint256 public testCaseId;

//     constructor() {
//         owner = payable(msg.sender);
//         testCaseId = 0;
//     }

//     modifier onlyOwner() {
//         require(msg.sender == owner, "Not owner");
//         _;
//     }

//     function addTestCase(bytes32[] memory _testCases) public payable {
//     }
// }
