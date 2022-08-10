// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Post {
    string public title;
    string public image_cid;
    address public immutable author;

    constructor(
        string memory _title,
        string memory _image_cid,
        address _author
    ) {
        title = _title;
        image_cid = _image_cid;
        author = _author;
    }

    function getTitle() public view returns (string memory) {
        return title;
    }

    function getImageCid() public view returns (string memory) {
        return image_cid;
    }

    function getAuthor() public view returns (address) {
        return author;
    }
}
