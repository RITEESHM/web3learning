// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ILending {
    function open(string memory _collateralType, address _owner) external returns (uint256);
    function lock(uint256 _cdpId, uint256 _amount) external;
    function generate(uint256 _cdpId, uint256 _amount) external;
    function getDai(uint256 _cdpId) external view returns (uint256);
}

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
}

contract MakerDAODai {
    ILending public lending;
    IERC20 public daiToken;

    constructor(address _lending, address _daiToken) {
        lending = ILending(_lending);
        daiToken = IERC20(_daiToken);
    }

    function generateDai(
        string memory _collateralType,
        uint256 _collateralAmount,
        uint256 _daiAmount
    ) external {
        // Open a new collateralized debt position (CDP)
        uint256 cdpId = lending.open(_collateralType, msg.sender);

        // Transfer collateral (ETH) to this contract
        // Note: This is simplified; you'd normally need to handle ETH directly
        require(msg.value == _collateralAmount, "Incorrect ETH amount sent");

        // Lock the collateral in the CDP
        lending.lock(cdpId, _collateralAmount);

        // Generate Dai against the locked collateral
        lending.generate(cdpId, _daiAmount);

        // Transfer Dai to the user
        daiToken.transfer(msg.sender, _daiAmount);
    }

    receive() external payable {}
}
