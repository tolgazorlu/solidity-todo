// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract Todo{

    //struct is costumable variable
    struct Task {
        string text;
        bool status;
    }

    Task[] public tasks;

    //Adding Task

    function addTask(string memory _taskText) public{
        Task memory task;
        task.text = _taskText;
        tasks.push(task);
    }

    //Update Status

    function updateStatus(uint index) public{
        tasks[index].status = !tasks[index].status;
    }

    //Update Text

    function updateText(string memory newText, uint index) public{
        tasks[index].text = newText;
    }

    //List all tasks

    function list() public view returns(Task[] memory){
        return tasks;
    }

    //Deleting Task
    function removeTask(uint index) public {
        for(uint i = index; i < tasks.length - 1; i++){
            tasks[i] = tasks[i+1];
        }
        tasks.pop();
    }

}