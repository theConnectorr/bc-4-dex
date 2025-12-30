//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Balloons is ERC20 {
    constructor() ERC20("Balloons", "BAL") {
        _mint(msg.sender, 1000 ether); // mints 1000 balloons!
    }

    // Nếu bạn cần emit trong một hàm custom nào đó:
    function approve(address spender, uint256 amount) public override returns (bool) {
        address owner = _msgSender();
        
        _approve(owner, spender, amount);

        // 2. Emit Event (ERC20 chuẩn đã tự emit rồi, nhưng nếu bạn override hoặc làm custom):
        emit Approval(owner, spender, amount); 
        
        return true;
    }
}
