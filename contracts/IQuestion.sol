// SPDX-License-Identifer: UNLICENSED
pragma solidity ^0.8.6;

interface IQuestion {
    function setQuestion(string memory _description) external payable;

    function addTestCase(bytes32 _input, bytes32 _output) external;
}
