### Installation and running this solution
1. Download this repo.
2. With Docker installed on your machine, open terminal and navigate to the folder where you just downloaded the project. 
3. Type in the following to create a local image. Creating the image for the first time might take a few minutes.
  - $ docker build -t nfl-rushing .
    - should result in the following - Successfully tagged nfl-rushing:latest
4. Once the previous process is completed, type in the following in terminal. 
  - $ docker run --rm -p 3000:3000 nfl-rushing
    - If everything is successful, you will now have a live feed of the web server. 
5. Navigating to http://0.0.0.0:3000/ will take you to the list page. Here you can sort by any coloumn you like and search through all the records. The search also works on the team column. You can also copy your filtered results to clip board, or export to csv or xls. 
