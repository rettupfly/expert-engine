pragma solidity ^0.8.0;

contract SwapContract {

    address public token1;

    address public token2;

    mapping(address => uint256) public balances;

    event Swap(address indexed sender, uint256 amount1, uint256 amount2);

    constructor(address _token1, address _token2) {

        token1 = _token1;

        token2 = _token2;

    }

    function swap(uint256 amount1, uint256 amount2) external {

        require(amount1 > 0 && amount2 > 0, "Amount must be greater than zero");

        require(

            balances[token1] >= amount1 && balances[token2] >= amount2,

            "Insufficient balance"

        );

        balances[token1] -= amount1;

        balances[token2] += amount2;

        emit Swap(msg.sender, amount1, amount2);

    }

    function deposit(address token, uint256 amount) external {

        require(amount > 0, "Amount must be greater than zero");

        // Transfer the tokens from the sender to this contract

        // You need to have approved the contract to spend your tokens beforehand

        // Use the token contract's transferFrom() function

        // Example: ERC20(token).transferFrom(msg.sender, address(this), amount);

        balances[token] += amount;

    }

    function withdraw(address token, uint256 amount) external {

        require(amount > 0, "Amount must be greater than zero");

        require(balances[token] >= amount, "Insufficient balance");

        // Transfer the tokens from this contract back to the sender

        // Use the token contract's transfer() function

        // Example: ERC20(token).transfer(msg.sender, amount);

        balances[token] -= amount;

    }

}
