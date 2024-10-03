// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VirtualLand is ERC721, Ownable {
    uint256 public nextTokenId;
    mapping(uint256 => string) public landMetadata;

    constructor() ERC721("VirtualLand", "LAND") {}

    function mintLand(string memory metadata) external onlyOwner {
        uint256 tokenId = nextTokenId;
        nextTokenId++;

        _mint(msg.sender, tokenId);
        landMetadata[tokenId] = metadata; // Store metadata for the land
    }

    function transferLand(address to, uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "Not the land owner");
        _transfer(msg.sender, to, tokenId);
    }

    function getLandMetadata(uint256 tokenId) external view returns (string memory) {
        return landMetadata[tokenId];
    }
}
