var Voting = artifacts.require("./Voting.sol");

module.exports = function(deployer) {
  deployer.deploy(Voting, ['Mario', 'Luigi', 'Peach', 'Toad'], {gas: 420000});
};