pragma solidity ^0.4.17;
import "./Pauseable.sol";

contract Lottery is Pausable {
    // Array to store players
    address[] public players;
    
    // function to enter the lottery game
    function enter() public payable whenNotPaused {
        require(msg.value > .01 ether, "please Enter value >= .01 Ether");

        players.push(msg.sender);
    }
    
    // FUNCTION TO PICK RANDOM NUMBER
    function random() public view whenNotPaused returns (uint) {
        bytes32 output = keccak256(abi.encodePacked(block.difficulty, now, players));
        return uint(output);
    }
    
    // FUNCTION TO PICK A WINNER BASED ON RANDOM NUMBER
    function pickWinner() public onlyowner whenNotPaused {
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        players = new address[](0);
    }

    
    // FUNCTION TO RETRIVE ALL PLAYERS ON THE CONTRACTS 
    function getPlayers() public view whenNotPaused returns (address[]) {
        return players;
    }

}
