// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public name;
    string public symbol;
    uint256 public totalSupply;
    mapping(address => uint256) public balances;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(
        // string memory _name,
        // string memory _symbol,
        uint256 _totalSupply
    ) {
        // name = telegram;
        // symbol = TLM;
        totalSupply = 1000000000;
        balances[msg.sender] = _totalSupply;
    }

    function transfer(address _to, uint256 _amount) external returns (bool) {
        require(_to != address(0), "Invalid recipient");
        require(_amount > 0, "Invalid amount");
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;

        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
}
