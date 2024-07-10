# Lottery Smart Contract

## Description
This Solidity smart contract implements a decentralized lottery system where participants can buy tickets using cryptocurrency. The contract is managed by an administrator who initiates and concludes the lottery, randomly selecting a winner from the pool of participants who meet the minimum ticket requirement.

## Features
- **Ticket Purchase**: Participants can buy tickets by sending the specified ticket price in cryptocurrency.
- **Random Winner Selection**: When enough tickets are sold, a winner is randomly chosen using a secure algorithm.
- **Transparency**: All transactions and participant addresses are recorded on the blockchain for transparency and auditability.
- **Security**: Implements restrictions to ensure only the contract manager can start the lottery and pick the winner.

## Usage
1. **Initialization**: Deploy the contract with initial parameters including ticket price and minimum players.
2. **Ticket Purchase**: Participants buy tickets by sending the exact ticket price.
3. **Winner Selection**: When the required number of tickets is reached, the manager selects a winner randomly.
4. **Payout**: The winner receives the lottery's balance in cryptocurrency.


