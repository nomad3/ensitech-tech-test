def product_except_index(nums):
    """
    Given an array of integers, return a new array such that each element at index i of the
    new array is the product of all the numbers in the original array except the one at i.
    For example:
    product_except_index([1, 2, 3, 4, 5]) == [120, 60, 40, 30, 24]
    product_except_index([3, 2, 1]) == [2, 3, 6]
    """
    n = len(nums)
    output = [1] * n
    prefix = 1
    postfix = 1
    for i in range(n):
        output[i] *= prefix
        prefix *= nums[i]
    for i in range(n - 1, -1, -1):
        output[i] *= postfix
        postfix *= nums[i]
    return output

if __name__ == '__main__':
    print(product_except_index([1, 2, 3, 4, 5]))
    print(product_except_index([3, 2, 1]))
