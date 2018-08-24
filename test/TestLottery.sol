pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Lottery.sol";

contract TestLottery {

    //Intaniate Contract 
    Lottery lottery = new Lottery();
    address expectedOwner = this;


    //Test Contract Ownership.
    function testContractOwnership() public {
        address owner = lottery.owner();
        Assert.equal(owner, expectedOwner, "Ownnnner!");
    }
    //Test Enter Lottery
    function testEnterLottery() public {
        address[] memory leng = lottery.getPlayers();
        uint length = leng.length;
        uint one = 0;
        Assert.equal(length, one, "asssss");
    }
    //Test Random Function
    function testRandom() public {
        uint ran = lottery.random();
        Assert.notEqual(ran, 0, "asssss");
    }

    //Test getPlayer Function
    function testGetPlayer() public {
        uint len = lottery.getPlayers().length;
        Assert.equal(len, 0, "not Zero!");
    }

    //Test newOwner Function
    function testNewOwner() public {
        lottery.newowner(expectedOwner);
        Assert.equal(lottery.owner(), expectedOwner, "owners");
    }
}