// Get funds from users
// Withdraw funds 
// Set a minimum funding value in USD
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.34;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint256 public minimumUsd = 5 * (10 ** 18) ;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable{

        require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH"); //1e18 = 1ETH = 1*10**18 / (1*10^18)
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
   
    }

    // function withdraw() public {}

}