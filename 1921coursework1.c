#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_WIDTH 100
#define MIN_WIDTH 5
#define MAX_HEGHT 100
#define MIN_HEGHT 5

//Definition of position structure
typedef struct {
    int x; //X coordinate
    int y; //y coordinate
} Position;

//Definition of maze structure
typedef struct {
    int width; //width of maze
    int height; //height of maze
    char grid[MAX_WIDTH][MIN_WIDTH][MAX_HEGHT][MIN_HEGHT]; //2D array representing the maze grid
    Position start; //start position in the maze
    Position exit; //exit position in the maze
} Maze;

//Definition of player structure
typedef struct {
    Position current; //current position of player
} Player;

//Function declaration
void initialize_maze(Maze *maze, const char *filename);
void find_start_position(Maze *maze);
void find_exit_position(Maze *maze);
void print_maze(const Maze *maze);
void player_movement(Player *player, char direction, const Maze *maze);
void print_player_position(const Maze *maze);
int check_if_win(const Player *player, const Maze *maze);

//Main function to run the maze 
int main(int argc, char *argv[]) {
    if(argc != 2) {
        printf("Usage: % <maze_file>\n", argv[0]);
        return 1;
    }
    Maze maze;
    Player player;
    initialize_maze(&maze, argv[1]);
    find_start_position(&maze);
    find_exit_position(&maze);
    player.current = maze.start;
    //initialize player's position to start
    while(!check_if_win(&player, &maze)) {
        print_maze(&maze);
        print_player_position(&player);
    }
    //move player baed on player's input for movement and check with win condition 
    printf("Reached E, and you have won!\n");
    return 0;
}

//Function to initialize the maze
void initialize_maze(Maze *maze, const char *filename){
    //open the maze file
    //read the data in the maze file
    //set the width and height of the maze
    //transmit the data to maze->grid
}
//Function to find start position in the maze
void find_start_position(Maze *maze){
    //find 'S' in the maze->grid
    //set maze->start.x and maze->start.y
}
//Function to find exit position in the maze
void find_exit_position(Maze *maze){
    //find 'E' in the maze->grid
    //set maze->exit.x and maze->exit.y
}
//Function to print the maze
void print_maze(const Maze *maze){
    //print maze->grid including every character
}
//Function to move the player based on the input directon
void player_movement(Player *player, char direction, const Maze *maze){
    //move the player->current position based on direction
    //make sure the movement doesn't go through walls or out of bounds
}
//Function to print player's current position
void print_player_position(const Maze *maze){
    //print the player's current position
}
//Function to check if the player has won the maze game
int check_if_win(const Player *player, const Maze *maze){
    //Check if player->current is the same as maze->exit
    //if player has reached exit , return 1, else, return 0
}