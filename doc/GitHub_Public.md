### GitHub setup..
SOURCE: [How to Setup and Use Github in Ubuntu](http://ubuntumanual.org/posts/393/how-to-setup-and-use-github-in-ubuntu)

#### ASSUMPTION:

Git has been installed and an existing Git project exists that has no GitHub repository that is has been pushed to.

#### INSTALLATION PROCEDURE:

##### Step 1

1. Login on to the appropriate existing GitHub account and "create a new repo". [Do not 'Initialize this repository with a README' nor 'Add .gitignore']

2. If GitHub has never been updated ('pushed') from this computer before, your developement workstation's ssh public key may need to be added to your GitHub account via GitHub's web interface.  

##### Step 2

In my test case, my workstation's ssh public key was located in "~/.ssh/id_rsa.pub". So my steps needed, after logging into the GitHub website, are...  

1. Go to “Account Settings”  
2. Click “SSH Public Keys”  
3. Click “Add another public key”  
4. For 'Title', enter some text to identify this public key entry. \(I used 'Keeley Blue [Ubuntu]'\)  
5. For 'Key' paste, the entire contents of the public key. \(I used "gedit ~/.ssh/id_rsa.pub" to display, select, and copy the public key\).  
6. Press Add key.  

##### Step 3

1. GitHub will give "Push an existing repository from the command line" instructions. In my test case, the my GitHub given instructions were to run the following commands in my application directory root:   
```bash
$ git remote add origin git@github.com:techPK/library.git  
$ git push -u origin master  
```    

2. Verify that Git has a 'origin' remote:  
```bash
$ git remote
```