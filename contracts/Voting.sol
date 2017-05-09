pragma solidity ^0.4.6;
// We have to specify what version of compiler this code will compile with

contract Voting {
  /* mapping field below is equivalent to an associative array or hash.
  The key of the mapping is character name stored as type bytes32 and value is
  an unsigned integer to store the vote count
  */
  
  mapping (bytes32 => uint8) public votesReceived;
  
  /* Solidity doesn't let you pass in an array of strings in the constructor (yet).
  We will use an array of bytes32 instead to store the list of characters
  */
  
  bytes32[] public characterList;

  /* This is the constructor which will be called once when you
  deploy the contract to the blockchain. When we deploy the contract,
  we will pass an array of characters who will be contesting in the election
  */
  function Voting(bytes32[] characterNames) {
    characterList = characterNames;
  }

  // This function returns the total votes a character has received so far
  function totalVotesFor(bytes32 character) returns (uint8) {
    if (validCharacter(character) == false) throw;
    return votesReceived[character];
  }

  // This function increments the vote count for the specified character. This
  // is equivalent to casting a vote
  function voteForCharacter(bytes32 character) {
    if (validCharacter(character) == false) throw;
    votesReceived[character] += 1;
  }

  function validCharacter(bytes32 character) returns (bool) {
    for(uint i = 0; i < characterList.length; i++) {
      if (characterList[i] == character) {
        return true;
      }
    }
    return false;
  }
}