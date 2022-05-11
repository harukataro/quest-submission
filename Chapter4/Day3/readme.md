# Day3

## 1. Why did we add a Collection to this contract? List the two main reasons.

- To easy to manage multiple resources
- Storage path is complicated if independent resource is used.

## 2. What do you have to do if you have resources "nested" inside of another resource? ("Nested resources")

I have to link the nested resource to the parent resource.

## 3. Brainstorm some extra things we may want to add to this contract. Think about what might be problematic with this contract and how we could fix it

### Idea #1: Do we really want everyone to be able to mint an NFT? 🤔

No, I want to make limit with paying.

### Idea #2: If we want to read information about our NFTs inside our Collection, right now we have to take it out of the Collection to do so. Is this good?

This is not good. I may make function to provide information of NFT with metadata style like ERC721.