// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./Post.sol";
import "./User.sol";

contract SocialMedia {
    uint256 public numPosts = 0;
    mapping(uint256 => Post) public posts;

    mapping(address => User) public users;
    mapping(string => User) public usersByName;

    mapping(address => mapping(uint256 => Post)) public userPosts;
    mapping(address => uint256) public userPostCount;

    // function upload() {}

    function changeNickName(string memory newNickName) public {
        //change nickname
        address userAddress = msg.sender;

        //if user exists, change nickname
        if (users[userAddress].getAddress() == userAddress) {
            users[userAddress].setName(newNickName);

            usersByName[newNickName] = users[userAddress];
            delete usersByName[users[userAddress].getName()];
        } else {
            //if user does not exist, create new user
            User newUser = new User(newNickName, userAddress);
            users[userAddress] = newUser;
            usersByName[newNickName] = newUser;
        }
    }

    //get user nickname by address
    function getNickName(address userAddress)
        public
        view
        returns (string memory)
    {
        return users[userAddress].getName();
    }

    function getUserByName(string memory name) public view returns (User) {
        return usersByName[name];
    }

    //get user posts as array
    function getUserPosts(address userAddress)
        public
        view
        returns (Post[] memory)
    {
        uint256 userPostCounter = userPostCount[userAddress];
        Post[] memory userPostsArray = new Post[](userPostCounter);
        for (uint256 i = 0; i < userPostCounter; i++) {
            userPostsArray[i] = userPosts[userAddress][i];
        }
        return userPostsArray;
    }
}
