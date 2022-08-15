from typing import List
class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        self.horizonalApproach(strs)

    def horizonalApproach(self, strs: List[str]) -> str:
        prefix = strs[0]
        for str in strs[1:]:
            print(str)

    def commonPrefix(self, str1: str, str2: str) -> str:
        


if __name__ == "__main__":
    s = Solution()
    s.longestCommonPrefix([1,2,3,4,5,6])
