//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";

    /*
    
    0 - 'X' - player1
    1 - 'O' - player2
    2 - '' -  empty

    */

    /*
    all match:
    
     1 ^ 1 ^ 1 ^ 1 => 0 
     0 ^ 0 ^ 0 ^ 0 => 0 

    */


contract TicTacToe {
    bool started;
    uint8 public currentPlayerIndex; // = 0;   
    address [2] public players;
    uint8[3][3] public state = [[2, 2, 2], [2, 2, 2], [2, 2, 2]];
    // uint8 size = 3;
    
    event NewTurn(address indexed player);
    event TurnCompleted(uint8 indexed row, uint8 indexed col, address indexed player);
    event GameCompleted(address indexed winner);
    
    modifier onlyCurrentPlayer() {
        // tx.origin ? (phishing)
        require(msg.sender == players[currentPlayerIndex], "Not your turn!");
        _;
    }

    constructor() payable {
        console.log("Deploying a TicTacToe: ", address(this));
    }
    
    receive() external payable {
        require(!started, "2 Players already");
        require(msg.value >= 0.5 ether, "Need >= 0.5 ether");
        
        if (currentPlayerIndex == 1 && msg.sender == players[0]) revert("Must be a different player!");

        players[currentPlayerIndex] = msg.sender;
        switchPlayer();

        if (currentPlayerIndex == 0) {
            started = true;
            emit NewTurn(players[currentPlayerIndex]);
        }
    }
    
    function completeTurn(uint8 row, uint8 col) external onlyCurrentPlayer returns(bool) {
        require(started, "Haven't started yet!");
        require(state[row][col] == 2, "Cell invalid!");

        state[row][col] = currentPlayerIndex;
        
        if (check(row, col)) {
            emit GameCompleted(players[currentPlayerIndex]);
            payable(players[currentPlayerIndex]).transfer(address(this).balance);
            reset();
        } else {
            emit TurnCompleted(row, col, players[currentPlayerIndex]); 
            switchPlayer();
            emit NewTurn(players[currentPlayerIndex]);
        }
        
        return true;
    }

    function check(uint8 row, uint8 col) private view returns(bool) {
        // row-strike
        if ((state[row][0] == state[row][1]) && (state[row][1] == state[row][2]) && (state[row][2] == currentPlayerIndex)) return true;

        // col-strike
        if ((state[0][col] == state[1][col]) && (state[1][col] == state[2][col]) && (state[2][col] == currentPlayerIndex)) return true;
        
        // diagonal-strike
        if ((state[0][0] == state[1][1]) && (state[1][1] == state[2][2]) && (state[2][2] == currentPlayerIndex)) return true;

        // reverse diagonal-strike
        if ((state[0][2] == state[1][1]) && (state[1][1] == state[2][0]) && (state[2][0] == currentPlayerIndex)) return true;

        return false;
    }

    function reset() private {
        started = false;
        currentPlayerIndex = 0;
        players = [address(0), address(0)];
        state = [[2, 2, 2], [2, 2, 2], [2, 2, 2]];
    }

    function switchPlayer() private {
        currentPlayerIndex ^= 1;
    }
}
