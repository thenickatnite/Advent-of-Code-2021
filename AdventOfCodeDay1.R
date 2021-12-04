# Advent of Code: Day 1
# Read txt file in 
wd = '/Users/NickBrown/Desktop/Advent of Code'
fname = 'input.txt'
fpath = file.path(wd, fname)
inputData = read.table(fpath)

# Find number of times depth increases
depthIncrease = 0
for(i in 1:nrow(inputData)){
  if(i == 1){
    next
  }else{
    a1 = inputData[i,]
    a0 = inputData[i-1,]
    if(a1 > a0){
      depthIncrease = depthIncrease + 1
    }
  }
}

# Part 2 of the problem
# Bind together list
sums = 0
for(i in 1:(nrow(inputData) - 3)){
  # Variables
  v1 = inputData[i,]
  v2 = inputData[i+1,]
  v3 = inputData[i+2,]
  v4 = inputData[i+3,]
  # Sliding windows
  SlidingWindow1 = v1 + v2 + v3
  SlidingWindow2 = v2 + v3 + v4
  if(SlidingWindow2 > SlidingWindow1){
    sums = sums + 1
  }
}
