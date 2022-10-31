@external
def evenOdd(nums: uint256[100]) -> uint256[100]:
    evens: uint256 = 0
    odds: uint256 = 100 - 1
    arr: uint256[100] = empty(uint256[100])
    for i in range(0, 100):
        if nums[i] % 2 == 0:
            arr[evens] = nums[i]
            evens+= 1
        if nums[i] % 2 == 1:
            arr[odds] = nums[i]
            odds=odds - 1        
    return (arr)

