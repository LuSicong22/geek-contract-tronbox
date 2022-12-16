// SPDX-License-Identifer: UNLICENSED
pragma solidity ^0.8.6;

import "./IQuestion.sol";

contract Question is IQuestion {
    address payable public owner;
    bytes32 public description;
    address public testCaseAddr;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function setQuestion(bytes32 _description, address _testCaseAddr)
        external
        payable
        onlyOwner
    {
        description = _description;
        testCaseAddr = _testCaseAddr;
    }

    /*
    function setDescription(bytes32 _description) external payable onlyOwner {
        description = _description;
    }

    function setTestCaseAddr(address _testCaseAddr) external payable onlyOwner {
        testCaseAddr = _testCaseAddr;
    }
    */
}
