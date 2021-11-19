// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.6.0 < 0.9.0;

contract Token {
 address public creator;
 mapping (address => uint) public balances;

event sent (address from, address to, uint amount);

constructor () {
    creator = msg.sender;
} 

function create (address receiver, uint amount) public{
    require ( msg.sender == creator);
    balances[receiver] =  balances[receiver] + amount;
}

function send (address receiver, uint amount) public {
    if (amount > balances[msg.sender])
    revert LowBalance ({
        requested: amount,
        available: balances[msg.sender]
    });
    balances[msg.sender] -= amount;
    balances[receiver] += amount;
}

error LowBalance (uint requested, uint available);


}
