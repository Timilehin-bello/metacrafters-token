// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Token {
    // State Variables for token creation
    string public name = "Cryptite";
    string public symbol = "CPT";
    uint8 public constant decimals = 18;
    uint256 public totalSupply;
    address public owner;

    // Declaring mappings
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    // Declaring events..
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    constructor(
        uint256 _totalSupply
    ) {
        owner = msg.sender;
        totalSupply = _totalSupply * (10 ** (decimals));
        balanceOf[msg.sender] = totalSupply;
    }

    modifier invalidAddress(address _address) {
        require(_address != address(0), "Token: Invalid Address");
        _;
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Token: only Owner can call this function"
        );
        _;
    }

    function transfer(
        address _to,
        uint256 _value
    ) public invalidAddress(_to) returns (bool success) {
        require(
            balanceOf[msg.sender] >= _value,
            "Token: transfer amount exceeds balance"
        );
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function approve(
        address _spender,
        uint256 _value
    ) public invalidAddress(_spender) returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(
            balanceOf[_from] >= _value,
            "Token: insufficient Token to complete Transfer"
        );
        require(
            allowance[_from][msg.sender] >= _value,
            "Token: transfer amount exceeds allowance"
        );

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);

        return true;
    }

    function mint(address _to, uint256 _value) public onlyOwner {
        require(_to != address(0), "Token: mint to the zero address");

        totalSupply += _value;
        balanceOf[_to] += _value;

        emit Transfer(address(0), _to, _value);
    }

    function burn(uint256 _value) public  {
        require(msg.sender != address(0), "Token: burn from the zero address");
        require(
            balanceOf[msg.sender] >= _value,
            "Token: burn _value exceeds balance"
        );

        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        totalSupply = totalSupply - _value;
        emit Transfer(msg.sender, address(0), _value);
    }
}
