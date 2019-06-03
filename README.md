# 🛴🕵🏻‍♂️ Scooter Sleuth 🛴🕵🏻‍♀️

We put a man on the moon but still need to switch between apps to find the closest electric scooter.  Not anymore!!
Sooter Sleuth aggregates scooter share apps into one map rendered based on the users location and available scooters.


## PREREQUISITES & INSTALLATION
- Fork 🍴
<<<<<<< HEAD
- Clone
- ``` bundle install ```
=======
- Clone 
- ``` bundle install ``` 
>>>>>>> 7fde27c0820aca710f29f8046e6760017c47232a
- ``` rails db:migrate ```

The app uses api keys which are stored within the encrypted Rails files.  Contact the team for access.

## USAGE
To find scooters close to you, first sign into that app by creating a new user.  

Select the scooters that you want by checking and unchecking the respective boxes.  This tells the  🛴🕵🏻‍♂️ Scooter Sleuth 🛴🕵🏻‍♀️  which companies too sleuth.  

Upon entering the address of your current location we verify it via the MapQuest API endpoint.  If the address isn't accurate enough we will ask you to try again.  

Once the address is verified it will be converted into GPS coordinates.  The coordinates are then sent to each scooter company in the form of an API request.

After receiving all of the available scooters are found we determine which scooters are closest by using the Haversine formula.

Then rendering those scooters on the map.

## VIDEO 

<div align="center">
  
  
  [![youtube video](https://i.ytimg.com/vi/PwzsgzlYaZY/maxresdefault.jpg)](https://www.youtube.com/watch?v=PwzsgzlYaZY)
  
  
  
</div>

## CONTRIBUTING

Alex Hare [[GitHub]](https://github.com/ahare14)[[Linkedin]](www.linkedin.com/in/alexander-hare-02b78633)

Chris Tero [[GitHub ]](https://github.com/takeastand)

Joe Tustin [[GitHub]](https://github.com/drbarq) [[Linkedin]](https://www.linkedin.com/in/joetustin/)


<<<<<<< HEAD
## LICENSE
=======
## License
>>>>>>> 7fde27c0820aca710f29f8046e6760017c47232a

[MIT](https://choosealicense.com/licenses/mit/)
