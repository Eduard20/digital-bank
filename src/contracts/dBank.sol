// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "./Token.sol";

contract dBank {

    //assign Token contract to variable
    Token private token;
    //add mappings
    mapping(address => uint) public etherBalanceOf;
    mapping(address => uint) public depositStart;
    mapping(address => bool) public isDeposited;
    //add events
    event Deposit(address indexed user, uint etherAmount, uint timeStart);
    //pass as constructor argument deployed Token contract
    constructor(Token _token) public {
        token = _token;
        //assign token deployed contract to variable
    }

    function deposit() payable public {
        // check for msg.sender deposit status and deposited amount
        require(isDeposited[msg.sender] == false, 'Error, deposit already active');
        require(msg.value >= 1e16, 'Error, deposit must be >= 0.01 ETH');
        // assign variables
        etherBalanceOf[msg.sender] = etherBalanceOf[msg.sender] + msg.value;
        depositStart[msg.sender] = depositStart[msg.sender] + block.timestamp;
        isDeposited[msg.sender] = true;
        // emit Deposit event
        emit Deposit(msg.sender, msg.value, block.timestamp);
    }

    function withdraw() public {
        //check if msg.sender deposit status is true
        //assign msg.sender ether deposit balance to variable for event

        //check user's hodl time

        //calc interest per second
        //calc accrued interest

        //send eth to user
        //send interest in tokens to user

        //reset depositer data

        //emit event
    }

    function borrow() payable public {
        //check if collateral is >= than 0.01 ETH
        //check if user doesn't have active loan

        //add msg.value to ether collateral

        //calc tokens amount to mint, 50% of msg.value

        //mint&send tokens to user

        //activate borrower's loan status

        //emit event
    }

    function payOff() public {
        //check if loan is active
        //transfer tokens from user back to the contract

        //calc fee

        //send user's collateral minus fee

        //reset borrower's data

        //emit event
    }
}
