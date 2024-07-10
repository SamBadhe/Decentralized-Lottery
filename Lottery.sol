// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public manager;
    address[] private players;
    uint256 public ticketPrice;
    uint256 public minimumPlayers;
    address public winner;

    event NewPlayer(address indexed player);
    event Winner(address indexed winner);

    constructor(uint256 _ticketPrice, uint256 _minimumPlayers) {
        manager = msg.sender;
        ticketPrice = _ticketPrice;
        minimumPlayers = _minimumPlayers;
    }

    function buyTicket() public payable {
        require(msg.value == ticketPrice, "Incorrect ticket price");
        players.push(msg.sender);
        emit NewPlayer(msg.sender);
    }

    function getPlayersCount() public view returns (uint256) {
        return players.length;
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    function pickWinner() public restricted {
        require(players.length >= minimumPlayers, "Not enough players");
        uint256 index = random() % players.length;
        winner = players[index];
        payable(winner).transfer(address(this).balance);
        emit Winner(winner);
        //delete players; 
    }

    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), players.length)));
    }

    modifier restricted() {
        require(msg.sender == manager, "Only manager can call this function");
        _;
    }
}
