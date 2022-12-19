// SPDX-License-Identifer: UNLICENSED
pragma solidity ^0.8.6;

contract Verifier {
    struct TestCase {
        bytes32 input;
        bytes32 output;
    }

    address payable public owner;
    mapping(uint256 => address) public registeredQuestionList;
    mapping(uint256 => address) public prizePool;
    mapping(uint256 => address) public winner;
    uint256 questionId;

    constructor() {
        owner = payable(msg.sender);
        questionId = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function verify(uint256 _questionId, address answerAddr)
        public
        payable
        onlyOwner
        returns (bool)
    {
        // Get contract address of the question that need to be verified
        address questionAddr = registeredQuestionList[_questionId];

        // Get the encodede testCase data
        (, bytes memory testCaseData) = questionAddr.call(
            abi.encodeWithSignature("testCases()")
        );

        // Decode the testCase data to get the test cases
        TestCase[] memory testCases = abi.decode(testCaseData, (TestCase[]));

        uint256 arrLength = testCases.length;

        for (uint256 i = 0; i < arrLength; i++) {
            bytes memory payload = abi.encodeWithSignature(
                "main()",
                testCases[i].input
            );
            (, bytes memory answerData) = answerAddr.call(payload);
            require(testCases[i].output == abi.decode(answerData, (bytes32)));
        }
    }

    function registerQuestion(address questionAddr) public payable {
        registeredQuestionList[questionId] = questionAddr;
        questionId++;
    }

    function rewardWinner(uint256 _questionId, address payable _winnerAddr)
        public
        onlyOwner
    {
        _winnerAddr.transfer(prizePool[_questionId].balance);
    }

    function deposit(uint256 _questionId) public payable {
        payable(prizePool[_questionId]).transfer(msg.value);
    }

    function withdraw(uint256 _questionId, uint256 amount) public onlyOwner {
        require(
            amount <= prizePool[_questionId].balance,
            "Insufficient balance for this prize pool."
        );
        owner.transfer(amount);
    }
}
