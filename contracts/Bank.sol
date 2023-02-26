// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Bank{

    mapping(address => uint) balances;

    function checkMsgSender() public view returns(address){
        //msg.sender is the address that is used to call the function.
        //the transaction sender address
        return msg.sender;
    }

    function checkUserBalance() public view returns(uint){
        return balances[msg.sender];
    }

    function deposit() public payable{
        balances[msg.sender] += msg.value;
    }

    function withDraw(uint _amount) public{
        require(balances[msg.sender] >= _amount, "you have got enough balance");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function transfer(address _receiver, uint _amount) public {
        require(balances[msg.sender] >= _amount, "you have got enough balance");
        balances[msg.sender] -= _amount;
        balances[_receiver] += _amount;
    }
    

}