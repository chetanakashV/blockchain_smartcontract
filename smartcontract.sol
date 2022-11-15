// SPDX-License-Identifier: GPL-3.0
 
pragma solidity 0.8.7;
 
contract SmartContract {
    struct Item{
        string title; 
        string description; 
        address payable seller; 
        uint itemId; 
        bool deploy; 
        uint price; 
        address payable buyer; 
        bool available; 
        bool delivered;
    }
 
    uint counter = 1;
    Item[] public items; 
    event registered(string _title, uint _itemId, address seller);
    event bought(uint _itemId, address buyer);
    event delivered(uint _itemId);
    event cancel( uint _itemId);
 
    function registerProduct(string memory _title, string memory _description, uint  _price) public {
        require(_price>0, "price should be  greater than zero");
        Item memory tempItem;
        tempItem.title = _title;
        tempItem.description = _description;
        tempItem.price = _price * 10**18;
        tempItem.seller = payable(msg.sender);
        tempItem.itemId = counter;
        tempItem.available = true; 
        items.push(tempItem);
        counter++;
        emit registered(_title, tempItem.itemId, msg.sender);
 
    }
 
    function deployProduct(uint _itemId) private  {
        
        items[_itemId-1].available = false; 
        items[_itemId-1].deploy = true; 
    }

    function cancelProduct(uint _itemId) payable  public {

        require(items[_itemId-1].buyer == msg.sender, "Only buyer can cancel the order");
        require(items[_itemId-1].delivered == false, "The item has already been delivered");
        items[_itemId-1].available = true;
        items[_itemId-1].deploy = false; 
        items[_itemId-1].buyer.transfer(items[_itemId-1].price);
        //items[_itemId-1].buyer = 0; 
        emit cancel(_itemId);

    }
 
     function delivery (uint _itemId) public{
      require(items[_itemId-1].deploy == true, "The item has not been bought");
      require(items[_itemId-1].buyer == msg.sender, "Only buyer can confirm "); 
      items[_itemId-1].delivered = true; 
      items[_itemId-1].deploy = false; 
      items[_itemId-1].seller.transfer(items[_itemId-1].price);
      emit delivered( _itemId);
  }
 
  function buy(uint _itemId) payable public {
      require(_itemId < counter, "No item corresponding to the given id exists");
      require( items[_itemId-1].available == true , "The item has already been brought");
      require( items[_itemId-1].price == msg.value, "Please pay the exact price"); 
      require(items[_itemId-1].seller !=  msg.sender, "Seller cannot be the buyer");
      items[_itemId-1].buyer = payable(msg.sender);
      deployProduct(_itemId);
      //this.delivery(_itemId, msg.sender);
      emit bought( _itemId, msg.sender);
      
  }
 
 
 
 
}
