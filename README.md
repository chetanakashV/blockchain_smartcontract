## Group information: 
Vishnu Praneeth Palavali - 2020A7PS0126H <br/>
Chetan  Akash Vankadara -  2020A7PS2196H <br/>
Srikanth Mangipudi -       2020A8PS1162H <br/>
Ch Sree Nihitha -          2020B4TS1384H <br/>

## Problem statement: 
Suppose you want to buy some items like spectacles, clothes, etc. the go to place
for us is either Amazon or Flipkart. Suppose there is a new website named xyz.com
which is offering heavy discounts and also there is a website abc.com which is
offering high-quality items at the same price as of Amazon. But any normal user
will be hesitant to buy any item from abc.com or xyz.com due to the lack of trust
(ie after payment xyz.com may not deliver the item, etc) although xyz.com and
abc.com are offering better products at a lower price.

So you need to try to solve this problem by building a smart contract that sends
the amount to xyz.com only when the item has been delivered to the user and off-
loading of the item starts only when the user has paid the amount of the item to
the smart contract which is deployed on the blockchain.

## Features: 
1. Sellers can register new products on the platform. <br/>
2. Buyers can buy the registered products. <br/>
3. The product is deployed after the buyer pays the price of the item .<br/>
4. The Seller gets the amount only after the buyer confirms that the item is delivered<br/>
5. Users can view all the registered products and their availability<br/>



## Directions to use: 
1. Load the file in Remix ide. <br/> 
2. Deploy the smart contract. <br/>
3. Functions can be triggered by using the gui functionalities present in the panel on the left side.<br/>
4. The sender and the amount sent can also be changed from the left side panel to simulate different users.<br/> <br/>

## Smart Contracts<br/>
Smart Contracts are programs on a blockchain that are triggered when certain pre conditions are met. These are used for automation. 

### Usage of Smart Contracts
To buy the product, the buyer has to pay the price of the item to the smart contract. This amount is held by the contract till the buyer confirms that the item is delivered. Upon the confirmation, the amount held by the smart contract is transferred to the seller. If the seller doesn't deliver the product, the buyer can cancel the order and get a refund from the smart contract. The smart contract thus ensures that a seller couldn't default on the product, they make the platform trustworthy. 
<br/>

## Structures Used: 
### Product 
Title of the product, description of the product, seller address, buyer address, price, itemId, availability, delivered, deployed  <br/>

## Description of functions: 
  1. registerProduct() - The function takes inputs(title, descrip, price) and creates a new product with the given arguments, the address of the seller and the generated itemId. The function also checks if the product's price is greater than zero.
  2. buy() - The function takes the itemID as an input, collects payment from the buyer. After checking if the payment is valid, the function confirms that the buyer has bought the item. The function deploys the product bought after the payment(calls the deployProduct function).
  3. deployProduct() - The function takes itemID as an argument and deploys the item selected.
  4. cancelProduct() - The function takes itemID as an argument and checks if the msg sender is the buyer of the product and the product hasn't been delivered yet. If yes, the amount held by the contract is transferred to the owner and the product is made available again. 
  5. delivery() - The function takes itemID as an argument. The function checks if the user trying to mark the item as delivered is actually the buyer, if yes, the amount held by the contract is transferred to the seller.
