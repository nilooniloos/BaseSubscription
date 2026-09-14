// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseSubscription {
    mapping(address => uint256) public subscriptionEnd;

    function subscribe(uint256 daysCount) external {
        require(
            daysCount == 30 ||
            daysCount == 90 ||
            daysCount == 365,
            "Invalid period"
        );

        uint256 start = block.timestamp;

        if (subscriptionEnd[msg.sender] > start) {
            start = subscriptionEnd[msg.sender];
        }

        subscriptionEnd[msg.sender] = start + (daysCount * 1 days);
    }

    function isActive(address user) external view returns (bool) {
        return block.timestamp < subscriptionEnd[user];
    }

    function remainingDays(address user) external view returns (uint256) {
        if (block.timestamp >= subscriptionEnd[user]) {
            return 0;
        }

        return (subscriptionEnd[user] - block.timestamp) / 1 days;
    }
}
        return (subscriptionEnd[user] - block.timestamp) / 1 days;
    }
}
