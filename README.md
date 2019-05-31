# Scooter Sleuth

We put a man on the moon but still need to switch between apps to find the closest electric scooter.  Not anymore!!
Sooter Sleuth aggregates scooter share apps into one google maps rendered based on the users location. 


## PREREQUISITES & INSTALLATION
- Fork 🍴
- Clone 
- ``` bundle install ``` 

The app uses api keys which are stored within the encrypted Rails files.  Contact the team for access. 

## USAGE
To find scooters close to you, first sign into that app by creating a new user.  

By selecting the scooters companies this tells the  🛴🕵🏻‍♂️ Scooter Sleuth 🛴🕵🏻‍♀️  which companies too sleuth.  

Upon entering the address of your current location we verify it via the MapQuest API endpoint.  If the address isn't accurate enough we will ask you to try again.  

Once the address is verified it will be converted into GPS coordinates.  The coordinates are then sent to each scooter company in the form of an API request. 

After receiving all of the available scooters are found we determine which scooters are closest by using the Haversine formula. 

Then rendering those scooters on the map. 


## CONTRIBUTING

Alex Hare [[GitHub]](https://github.com/ahare14)

Chris Tero [[GitHub ]](https://github.com/takeastand) 

Joe Tustin [[GitHub]](https://github.com/drbarq) [[Linkedin]](https://www.linkedin.com/in/joetustin/)
