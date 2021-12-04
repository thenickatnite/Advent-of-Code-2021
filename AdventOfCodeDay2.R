# Advent of Code Day 2
# Set up high level variables
wd = '/Users/NickBrown/Desktop/Advent of Code'
filename = 'input_2.txt'
fPath = file.path(wd, filename)
# Read in data
inputData = read.table(fPath)

# Get positions
horizontal = 0
depth = 0
for(i in 1:nrow(inputData)){
  row = inputData[i,]
  if(row$V1 == 'forward'){
    horizontal = horizontal + row$V2
  }else if(row$V1 == 'down'){
    depth = depth + row$V2
  }else if(row$V1 == 'up'){
    depth = depth - row$V2
  }
}

# Final position calculation
answer = depth * horizontal

# Part 2
aim = 0
horizontal = 0
depth = 0
for(i in 1:nrow(inputData)){
  row = inputData[i,]
  if(row$V1 == 'down'){
    aim = aim + row$V2
  }else if(row$V1 == 'up'){
    aim = aim - row$V2
  }else if(row$V1 == 'forward'){
    horizontal = horizontal + row$V2
    depth = depth + (aim * row$V2)
  }
}

# Answer
answer2 = depth * horizontal
