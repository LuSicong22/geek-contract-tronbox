var Question = artifacts.require("./Question.sol");
var Answer = artifacts.require("./Answer.sol");
var Verifier = artifacts.require("./Verifier.sol");

module.exports = function (deployer) {
  deployer.deploy(Question);
  deployer.deploy(Answer);
  deployer.deploy(Verifier);
};
