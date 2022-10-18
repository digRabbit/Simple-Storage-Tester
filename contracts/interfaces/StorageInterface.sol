// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

interface Istorage {
  struct member {
    string name;
    uint256 favoriteNumber;
    address _address;
  }

  function storePersonalInfo(string memory name, uint256 number) external;

  function getNumberByName(string memory name) external view returns (uint256 number);

  function getMemberAtIndex(uint256 index) external view returns (member memory _member);

  function getOwner() external view returns (address _owner);

  function getNameByAddress(address _address) external view returns (string memory _name);
}
