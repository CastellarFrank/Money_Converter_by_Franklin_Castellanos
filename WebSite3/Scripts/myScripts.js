
        function updateClock() {            

            var month_names=new Array("January","February", "March","April", "May", "June",
             "July", "August","September","October", "November", "December");

            var day_names=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
            
            var currentTime = new Date();

            var date_name=day_names[currentTime.getDay()];
            var month_name=month_names[currentTime.getMonth()];
            var year=currentTime.getFullYear();
            var currentDate=date_name+", "+month_name+" "+currentTime.getDate()+", "+year;

            var currentHours = currentTime.getHours();
            var currentMinutes = currentTime.getMinutes();
            var currentSeconds = currentTime.getSeconds();

            // Pad the minutes and seconds with leading zeros, if required
            currentMinutes = (currentMinutes < 10 ? "0" : "") + currentMinutes;
            currentSeconds = (currentSeconds < 10 ? "0" : "") + currentSeconds;

            // Choose either "AM" or "PM" as appropriate
            var timeOfDay = (currentHours < 12) ? "AM" : "PM";

            // Convert the hours component to 12-hour format if needed
            currentHours = (currentHours > 12) ? currentHours - 12 : currentHours;

            // Convert an hours component of "0" to "12"
            currentHours = (currentHours == 0) ? 12 : currentHours;

            // Compose the string for display
            var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds + " " + timeOfDay;

            // Update the time display

            document.getElementById("clock").innerHTML = "Date: " + currentDate + "<br /> " + "Time: " + currentTimeString;

        }