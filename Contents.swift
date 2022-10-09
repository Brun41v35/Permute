
// MARK: - Public Methods

func permute(with value: String) -> [String] {
    let firstCharacter = String(describing: value.first!)
    return findPermutationWith(value, position: 1, [firstCharacter])
}

func findPermutationWith(_ value: String, position: Int,
                         _ permutations: [String]) -> [String] {
    
    let currentIndex = String.Index(utf16Offset: position, in: value)
    let lastIndex = currentIndex == value.endIndex
    
    if lastIndex { return permutations }
    
    let currentCharacter = value[currentIndex]
    var newArray = [String]()
    
    for permutation in permutations {
        let share = sharingValues(currentCharacter, permutation)
        newArray.append(contentsOf: share)
    }
    
    let newPosition = position + 1
    return findPermutationWith(value, position: newPosition, newArray.sorted())
}

func checkIfItIsLastIndex(_ currentIndex: String.Index,
                          _ value: String,
                          _ permutations: [String]) -> [String] {
    let lastIndex = currentIndex == value.endIndex
    if lastIndex {
        return permutations
    }
    return []
}

func sharingValues(_ newCharacter: Character,
                   _ permutation: String) -> [String] {
    var newValues = [String]()
    
    for i in 0..<permutation.count + 1 {
        var newPermutation = permutation
        let currentIndex = String.Index(utf16Offset: i, in: permutation)
        
        newPermutation.insert(newCharacter, at: currentIndex)
        newValues.append(newPermutation)
    }
    return newValues
}

permute(with: "ABC")
