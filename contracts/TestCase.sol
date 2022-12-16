// SPDX-License-Identifer: UNLICENSED
pragma solidity ^0.8.6;

import "./ITestCase.sol";

contract TestCase is ITestCase {
    address payable public owner;
    mapping(uint256 => address) prizePool;
    mapping(uint256 => address) winner;
    bytes32[] public testCases;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function setTestCase(bytes32[] memory _testCases) external payable {
        testCases = _testCases;
    }
}
