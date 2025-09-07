// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract TodoList {
    mapping(address => string[]) public userTasks;

    event TaskAdded(address indexed user, string task);

    function addTask(string memory task) public {
        require(userTasks[msg.sender].length <= 2, "Cannot add more tasks");
        userTasks[msg.sender].push(task);
        emit TaskAdded(msg.sender, task);
    }

    function listAllTasks() public view returns (string[] memory) {
        return userTasks[msg.sender];
    }
}
