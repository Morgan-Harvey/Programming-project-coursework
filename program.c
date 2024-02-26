int moveUp(){
    printf("you have moved up");
        /*if (there is no wall above you)
    {
        // move up
    }
    else{
        // dont move
        printf("you have hit a wall");
    }*/
}

int moveDown(){
    printf("you have moved Down");
       /*if (there is no wall below you)
    {
        // move up
    }
    else{
        // dont move
        printf("you have hit a wall");
    }*/
}

int moveLeft(){
    printf("you have moved Left");
    /*if (there is no wall to your left)
    {
        // move up
    }
    else{
        // dont move
        printf("you have hit a wall");
    }*/
}

int moveRight(){
    printf("you have moved right");
    /*if (there is no wall to your right)
    {
        // move up
    }
    else{
        // dont move
        printf("you have hit a wall");
    }*/
}

int showMap(){
    //will show the user the most upda to date map
}

int MapGeneration(){
// asks and reads maze file, storing it into the 2d array
// add conditions to check the height and width of the maze
// will loop through the 2d array checking for the presence of the symbols on the map
// updates the map after each movement
}

int goal(){
    printf("you have reached the goal");
}

int main(int argc, char const *argv[])
{
    //initialises the 2d map array
    MapGeneration();
    /* create a switch in a while loop watching for user inputs  */
    moveUp();
    moveDown();
    moveLeft();
    moveRight();
    return 0;
}
