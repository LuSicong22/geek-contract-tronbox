// SPDX-License-Identifer: UNLICENSED
pragma solidity ^0.8.6;

contract Verifier {
    address payable public owner;
    mapping(uint256 => address) public registedQuestionList;
    mapping(uint256 => address) public prizePool;
    mapping(uint256 => address) public winner;
    uint256 questionId;

    constructor() {
        owner = payable(msg.sender);
        questionId = 1;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function verify(address answer) public payable onlyOwner returns (bool) {}

    function registQuestion(address questionAddr) public payable {
        registedQuestionList[questionId] = questionAddr;
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
