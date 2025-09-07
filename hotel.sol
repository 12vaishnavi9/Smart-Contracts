pragma solidity ^0.6.0;

contract Hotel {
    enum Status {Vacant, Occupied}
    Status currentStatus;

    address payable public owner;

    constructor() public {
        owner = msg.sender;
        currentStatus = Status.Vacant;
    }

    modifier onlyIfVacant {
        require(currentStatus == Status.Vacant, 'Currently occupied.');
        _;
    }

    modifier cost(uint amount) {
        require(msg.value >= amount, 'Not enough ether provided.');
        _;
    }


    function bookRoom() payable onlyIfVacant cost(2 ether) public{
        currentStatus = Status.Occupied;
        owner.transfer(msg.value);
    }
}