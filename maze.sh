#!/bin/bash
# Test script for maze game

# Function to simulate game initialization
function test_initialize_game() {
    output=$(./maze maze_file.txt)
    if echo "$output" |grep -q "Game initialized with maze from maze_file.txt"
    then
        echo "PASS"
    else
        echo "FAIL"
    fi
}

# Function to simulate player movement
function test_player_movement() {
    output=$(./maze maze_fle.txt)
    # Simulate player moving up
    if echo "$output" | grep -q "Player moved up"
    then
        echo "PASS"
    else
        echo "FAIL"
    fi   
    # Simulate player moving left
    if echo "$output" | grep -q "Player moved left"
    then
        echo "PASS"
    else
        echo "FAIL
    fi   
    # Simulate player moving down
    if echo "$output" | grep -q "Player moved down"
    then
        echo "PASS"
    else
        echo "FAIL"
    fi
    # Simulate player moving right
    if echo "$output" | grep -q "Player moved right"
    then 
        echo "PASS"
    else
        echo "FAIL"
    fi
    # Simulate player moving into a wall
    if echo "$output" | grep -q "Cannot move into wall"
    then
        echo "PASS"
    else
        echo "FAIL"
    fi
    # Simulate player moving off the map
    if echo "$output" | grep -q "Cannot move off map"
    then
        echo "PASS"
    else
        echo "FAIL"
    fi
}

# Function to simulate displaying the map
function test_display_map() {
    output=$(echo "M" | ./maze maze_file.txt)
    if echo "$output" | grep -q "X" # Player's curret location
    then
        echo "PASS"
    else
        echo "FAIL"
    fi
}

# Function to simulate reaching the exit
function test_reach_exit() {
    output=$(./maze maze_file.txt)
    if echo "$output" | grep -q " Reached E and you have won "
    then 
        echo "PASS"
    else
        echo "FAIL"
    fi
}

# Function to simulate invalid move
function test_invalid_move() {
    output=$(echo "B" | ./maze maze_file.txt) # Assuming 'B' is an invalid move
    if echo "$output" | grep -q " It is an invalid move "
    then
        echo "PASS"
    else
        echo "FAIL"
    fi
}

# Run the tests
test_initialize_game
test_player_movement
test_display_map
test_reach_exit
test_invalid_movement

# Check if expected output function is in the command output
output=$(./maze maze_file.txt)
if echo "$output" | grep -q "$1";
then
    echo "PASS"
else
    echo "FAIL"
fi
