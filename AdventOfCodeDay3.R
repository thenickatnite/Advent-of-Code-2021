# Advent of Code Day 3
# Set up high level variables
wd = '/Users/NickBrown/Desktop/Advent of Code'
filename = 'input_3.txt'
fPath = file.path(wd, filename)
# Read in data
inputData = read.table(fPath, colClasses = "character")

# Make into Matrix
inputData = data.table::transpose(strsplit(inputData$V1, ''))

gamma_list = list()
epsilon_list = list()
for(i in 1:length(inputData)){
  i_list = inputData[[i]]
  i_list = as.numeric(i_list)
  i_list = i_list[i_list == 1]
  if(sum(i_list) > 500){
    gamma_list = append(gamma_list, 1)
    epsilon_list = append(epsilon_list, 0)
  }else{
    gamma_list = append(gamma_list, 0)
    epsilon_list = append(epsilon_list, 1)
  }
}

gamma = strtoi(paste(as.character(unlist(gamma_list)), collapse = ''), base = 2)
epsilon = strtoi(paste(as.character(unlist(epsilon_list)), collapse = ''), base = 2)

answer = as.numeric(gamma * epsilon)

# Part 2
library(dplyr)
widths = c(1,1,1,1,1,1,1,1,1,1,1,1)
inputData2 = read.fwf(fPath, widths = widths)
gamma = inputData2
# Get Gamma
for(i in 1:ncol(gamma)){
  column = gamma[,i]
  filterName = colnames(gamma)[i]
  count1 = 0
  count0 = 0
  for(j in 1:length(column)){
    if(column[j] == 1){
      count1 = count1 + 1
    }else{
      count0 = count0 + 1
    }
  }
  maxCount = ifelse(count1 >= count0, 1, 0)
  gamma = dplyr::filter(gamma, dplyr::select(gamma, filterName) == maxCount)
  if(nrow(gamma) == 1){
    break
  }
}

gamma = strtoi(paste(as.character(unlist(gamma)), collapse = ''), base = 2)

epsilon = inputData2
for(i in 1:ncol(epsilon)){
  column = epsilon[,i]
  filterName = colnames(epsilon)[i]
  count1 = 0
  count0 = 0
  for(j in 1:length(column)){
    if(column[j] == 1){
      count1 = count1 + 1
    }else{
      count0 = count0 + 1
    }
  }
  maxCount = ifelse(count1 >= count0, 0, 1)
  epsilon = dplyr::filter(epsilon, dplyr::select(epsilon, filterName) == maxCount)
  if(nrow(epsilon) == 1){
    break
  }
}

epsilon = strtoi(paste(as.character(unlist(epsilon)), collapse = ''), base =2)

answer2 = as.numeric(gamma * epsilon)
