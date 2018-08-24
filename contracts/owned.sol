pragma solidity ^0.4.24;

contract owned{

  constructor() public{
    owner = msg.sender;
  }

  function newowner(address addr) onlyowner public {
    owner = addr;
  }

  modifier onlyowner() {
    if(msg.sender==owner) _;
  }

  address public owner;
}