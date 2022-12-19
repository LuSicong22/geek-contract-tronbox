// SPDX-License-Identifer: UNLICENSED
pragma solidity ^0.8.6;

interface IQuestion {
    function setQuestion(string memory _description, address _testCaseAddr)
        external
        payable;
}
