pragma solidity ^0.6.0;

contract Challenge_4{
    
    address payable sender;
    address payable reciever;
    
    modifier onlyReciever(){
        require(reciever == msg.sender || sender == msg.sender,"amount will withdraw by sender or provided reciever");
        _;
    }
    
    function getContractAdress() public view returns (address) {
        return address(this);
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    function deposit(address payable _reciever) payable public {
        
        require(_reciever!=address(0),"address should me valid");
        sender = msg.sender;
        reciever = _reciever;
    }
    
     function withdraw() public payable onlyReciever {
        msg.sender.transfer(address(this).balance);
    }
    
}