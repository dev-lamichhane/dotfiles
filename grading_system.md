# Grading System

## Football Scores Problem
This is the most basic solution. Anyone who knows how to iterate through an array will do this.This passes 8/13 cases to pass
```javascript
function counts(teamA, teamB) {
  const final = []
  teamB.forEach(goalsB => {
    let count = 0
    teamA.forEach(goalsA => {
      if (goalsB >= goalsA) count++
    })
    final.push(count)
  })
  return final
}
```

The following is a little bettter and passes 12/13 cases, but this problem can be further optimized by implementing a binary search i think. 
```javascript
function counts(teamA, teamB) {
  const final = []
  const sortedA = teamA.sort((a, b) => a - b)

  teamB.forEach(goalsB => {
    const index = sortedA.findIndex(value => goalsB < value)
    final.push(index >= 0 ? index : teamA.length)
  })
  return final
}
```
### Proposed Grading System for Football Scores Problem
1. Yes: pass 9 or more test cases
2. Strong Yes: pass 12 or more test cases

## Counting Pairs Problem

basic solution. I am sure you can do worse than this, but this one passes 8/12
```javascript
function countPairs(numbers, k) {
  const numeros = [...new Set(numbers)] //remove duplicates

  if (k === 0) return numeros.length
  let count = 0

  numeros.forEach(outer => {
    numeros.forEach(inner => {
      if (outer + k === inner)
        count++
    })
  })
  return count
}
```
this is all i could think to pass all the cases 
```javascript
function countPairs(numbers, k) {
  let count = 0
  let obj = {}
  let nums = [...new Set(numbers)]

  nums.forEach(num => {
    if (!(num in obj)) {
      obj[num] = num + k
    }
  })
  nums.forEach(num => {
    if (obj[obj[num]]) count++
  })
  return count
}
```
### Proposed Grading System for Counting Pairs Problem 
1. Yes: pass 9 or more cases
// 2. Strong Yes: pass 12 or more cases

## Anagram Diff
I think this is a little tougher than the first 2. Also, this might be more about logic than optimization. 

This is what i could come up with for an optimal solutions. it passes all the tests.
```javascript
function getMinimumDifference(a, b) {
    const final = []
    
for(let i = 0;i < a.length; i++){
    let first = [...a[i]]
    let second = [...b[i]]
    if(first.length !== second.length){
        final.push(-1)
    } else {
        let count = 0
        for(let j=0; j<first.length; j++){
            const ind = second.indexOf(first[j])
            if(ind<0){
                count++
            } else{
                first[j] = "_"
                second[ind] = "_"
            }
        }
        final.push(count)
    }
}
    return final
}
```






