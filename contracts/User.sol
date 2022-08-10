// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

error NOT_AUTHORIZED();

contract User {
    string public name;
    address public immutable userAddress;

    constructor(string memory _name, address _address) {
        name = _name;
        userAddress = _address;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function getAddress() public view returns (address) {
        return userAddress;
    }

    //set name
    function setName(string memory _name) public onlyOwner {
        name = _name;
    }

    modifier onlyOwner() {
        if (msg.sender == userAddress) revert NOT_AUTHORIZED();
        _;
    }
}
