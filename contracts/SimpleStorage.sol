// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./interfaces/StorageInterface.sol";

contract SimpleStorage is Istorage {
  address immutable owner;
  member[] members;
  mapping(address => string) addressToMember;
  mapping(string => uint256) numberByName;

  constructor() {
    owner = msg.sender;
  }

  function storePersonalInfo(string memory name, uint256 favoriteNumber) public virtual override {
    members.push(member(name, favoriteNumber, msg.sender));
    addressToMember[msg.sender] = name;
    numberByName[name] = favoriteNumber;
  }

  function getNumberByName(string memory name) public view virtual override returns (uint256 number) {
    return numberByName[name];
  }

  function getMemberAtIndex(uint256 _index) public view virtual override returns (member memory _member) {
    _member = members[_index];
    return _member;
  }

  function getOwner() external view virtual override returns (address _owner) {
    _owner = owner;
    return _owner;
  }

  function getNameByAddress(address _address) external view virtual override returns (string memory _name) {
    _name = addressToMember[_address];
    return _name;
  }
}
