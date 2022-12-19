// SPDX-License-Identifer: UNLICENSED
pragma solidity ^0.8.6;

import "./IQuestion.sol";

contract Question is IQuestion {
    struct TestCase {
        bytes32 input;
        bytes32 output;
    }

    address payable public owner;
    string public description;
    mapping(uint256 => address) prizePool;
    mapping(uint256 => address) winner;
    TestCase[] public testCases;
    uint256 public testCaseId;

    constructor() {
        owner = payable(msg.sender);
        testCaseId = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function setQuestion(string memory _description) public payable onlyOwner {
        description = _description;
    }

    function addTestCase(bytes32 _input, bytes32 _output) public onlyOwner {
        TestCase memory testCase = TestCase(_input, _output);
        testCases[testCaseId] = testCase;
        testCaseId++;
    }

    /*
    function setDescription(string _description) public payable onlyOwner {
        description = _description;
    }

    function setTestCaseAddr(address _testCaseAddr) public payable onlyOwner {
        testCaseAddr = _testCaseAddr;
    }
    */
}
