void main(){
    //create a pointer and set it to the start of video memory
    char * video_memory = (char *) 0x8000;

    //put X at the address
    *video_memory = 'X';
}
