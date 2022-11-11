players: DynArray[address,100]
losers: DynArray[address,100]
odds: uint256
playersTurn: uint256
creator: address

@external
def __init__ (creator: address):
    self.creator = creator
    
@external
def setOdds (oneInThisMany: uint256):
    assert self.creator == msg.sender
    self.odds = oneInThisMany

@external
def addPlayer (player: address):
    for i in self.losers:
        assert not i == player
    for j in self.players:
        assert not j == player
    self.players.append(player)

@internal
def lose (player: address):
    assert player not in self.losers
    for k in self.players:
        self.players.pop()
    self.losers.append(player)

@internal
def random() -> (uint256):
    return block.timestamp % self.odds

@external 
def play ():
    num: uint256 = self.random ()
    player: address = self.players [self.playersTurn]
    if num == 1:
        self.lose (player)
    else:
        self.playersTurn+=1

@external
def isALoser(person: address) -> (bool):
    return person in self.losers
