# Grading and Interviewing Guide

## Grading System

### 1. Easy Coding Challenge
**This challenge should not be used.** 

### 2. Longest Even Length Word
This is an 'EASY' question, there is no optimization or logic needed for this. If candidates can write basic code, they will be able to pass 12/14 cases. Only failing cases are with sentences that dont have even words.

**This challenge should also not be used.** Maybe we can add two more challenges in place of this and above. 

This passes 12/14 cases.

```javascript
function longestEvenWord(sentence) {
  const arr = sentence.split(" ");
  let longest = "";
  for (let word of arr) {
    if (word.length % 2 === 0 && word.length > longest.length) longest = word;
  }
  console.log(longest);
  return longest;
}
```

### 3. Football Scores Problem
This is the easiest of the three difficult challenges.
This is the most basic solution. Anyone who knows how to iterate through an array will do this.This passes 8/13 cases to pass. I saw a candidate use two for loops and pass 9/13 challenges.

```javascript
function counts(teamA, teamB) {
  const final = [];
  teamB.forEach((goalsB) => {
    let count = 0;
    teamA.forEach((goalsA) => {
      if (goalsB >= goalsA) count++;
    });
    final.push(count);
  });
  return final;
}
```

The following is a little bettter and passes 12/13 cases, but this problem can be further optimized by implementing a binary search i think.

```javascript
function counts(teamA, teamB) {
  const final = [];
  const sortedA = teamA.sort((a, b) => a - b);

  teamB.forEach((goalsB) => {
    const index = sortedA.findIndex((value) => goalsB < value);
    final.push(index >= 0 ? index : teamA.length);
  });
  return final;
}
```

### Proposed Grading System for Football Scores Problem

1. Yes: pass 10 or more test cases
2. Strong Yes: pass 12 or more test cases

### 4. Counting Pairs Problem

The wording on this solution is cryptic even for native/fluent speakers of english. I have seen candidates struggle to understand this problem. 

Basic solution. I am sure a worse than this is possible, but this one passes 8/12

```javascript
function countPairs(numbers, k) {
  const numeros = [...new Set(numbers)]; //remove duplicates

  if (k === 0) return numeros.length;
  let count = 0;

  numeros.forEach((outer) => {
    numeros.forEach((inner) => {
      if (outer + k === inner) count++;
    });
  });
  return count;
}
```

This is all i could think to pass all the cases.

```javascript
function countPairs(numbers, k) {
  let count = 0;
  let obj = {};
  let nums = [...new Set(numbers)];

  nums.forEach((num) => {
    if (!(num in obj)) {
      obj[num] = num + k;
    }
  });
  nums.forEach((num) => {
    if (obj[obj[num]]) count++;
  });
  return count;
}
```

### Proposed Grading System for Counting Pairs Problem

1. Yes: pass 9 or more cases
2. Strong Yes: pass 12 or more cases

### 5. Anagram Diff

I think this is a little tougher than the first 2. Also, this might be more about logic than optimization.

I copied this from GeeksForGeeks and it passes 9/14 test cases

```javascript
function countManipulations(s1, s2) {
  let count = 0;

  let char_count = new Array(26);
  for (let i = 0; i < char_count.length; i++) {
    char_count[i] = 0;
  }

  for (let i = 0; i < s1.length; i++) {
    char_count[s1[i].charCodeAt(0) - "a".charCodeAt(0)]++;
  }

  for (let i = 0; i < s2.length; i++) {
    char_count[s2[i].charCodeAt(0) - "a".charCodeAt(0)]--;
  }

  for (let i = 0; i < 26; ++i) {
    if (char_count[i] != 0) {
      count += Math.abs(char_count[i]);
    }
  }
  return count / 2;
}

function getMinimumDifference(a, b) {
  const final = [];
  for (let i = 0; i < a.length; i++) {
    if (a[i].length !== b[i].length) {
      final.push[-1];
    } else {
      final.push(countManipulations(a[i], b[i]));
    }
  }
  return final;
}
```

This is what i could come up with for an optimal solutions. it passes all the tests.

```javascript
function getMinimumDifference(a, b) {
  const final = [];

  for (let i = 0; i < a.length; i++) {
    let first = [...a[i]];
    let second = [...b[i]];
    if (first.length !== second.length) {
      final.push(-1);
    } else {
      let count = 0;
      for (let j = 0; j < first.length; j++) {
        const ind = second.indexOf(first[j]);
        if (ind < 0) {
          count++;
        } else {
          first[j] = "_";
          second[ind] = "_";
        }
      }
      final.push(count);
    }
  }
  return final;
}
```

### Proposed Grading System for Anagram Difference

1. Yes: pass 10 or more cases
2. Strongly Yes: pass 13 or 14 test cases

## 2. Explaining Questions to candidates
I have noticed that when i explain the question to candidates, I am almost solving the problem for them. I haven't gotten a clear answer from Gabe on this one so we will have to use our discretion on this one. 

This mostly applies to the counting pairs problem: if we explain to them how (1,1), (1,2) and (2,2) are the only possible pairs from the array [1,1,1,2], they wont have to do any thinking. Since they have 30 minutes and the actual coding time is less than 5 minutes once they understand the problem, I think we should not explain it all the way. Again, use your judgement on this one. If a good coder is stuck on this problem, it might be a good idea to nudge them in the right direction by explaining the problem a little more, but let's not break down the problem right off the bat. 

## 3. Alternative Questions
If you have suspicion that a candidate had access to the questions/solutions before the test or cheating in some manner, please have them solve alternative problems from leetcode. Asking the candidate to solve the same problem in a different language (if the candidate claims to know other languages) could also be way to a way to go. We will provide links to alternative questions on the canvas section of interview team group on slack. Some tell-tale signs of candidates having access to problems/solutions before the test:
1. Solving problem without having to think / taking very little time
2. Writing code without making any mistakes / not having to think about it.
3. Running the tests before running the code to see if it works.

## 4. Identity
We are seeing more and more people applying for this job multiple times and with fake/partial names. In the next lot of emails to be sent, we've added language that they will be required to login with github and that might deter some, but for now I am proposing the following:
1. Ask the candidate to state their FULL LEGAL NAME once we start recording
2. If the name is different from the one in the sheet, update the name and mention in the note that you've updated their name
