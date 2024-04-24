# CDAC-PROJECT-CRM-JSP-JAVABEAN-MYSQL


## CRM Application/CRM
This folder contains the source code for the CRM Application.
   
### Browser Link

- <h4>http://13.50.136.248:8080/CRM/<h4><br>


## Features

  ### CRM Application Overview:
   
<p>


Our CRM (Customer Relationship Management) application is designed to streamline customer interactions, manage product information, and optimize sales team performance. It serves as a centralized platform for organizing customer data, tracking sales activities, and facilitating communication between sales representatives and clients.

### Customer Management:

- **Customer Details:**
  The CRM stores comprehensive information about each customer, including their ID, first name, last name, contact details such as mobile number and email, and physical address.
- **Interaction History:**
  It tracks all interactions with customers, ranging from phone calls and emails to meetings and purchases, providing a complete view of the customer's journey.
Segmentation: The CRM allows for segmentation of customers based on various criteria, enabling targeted marketing campaigns and personalized communication.

### Product Management:

- **Product Catalog:**
Our application maintains a catalog of products, detailing each product's ID, type, name, quantity available, and description.
Inventory Management: It keeps track of product inventory in real-time, ensuring accurate stock levels and timely replenishment.
- **Sales and Marketing Support:**
  The CRM utilizes product information to support sales presentations, marketing initiatives, and promotions, helping sales representatives effectively communicate product features and benefits to customers.

### Salesman Management:
- **Salesman Information:**
   The CRM stores information about sales representatives, including their ID, first name, last name, contact details, and address.
- **Schedule Management:** It enables sales representatives to manage their schedules efficiently, including appointments, meetings, and other tasks.
Performance Tracking: Managers can track sales team performance metrics, such as sales targets, leads generated, and deals closed, providing insights to optimize sales strategies and allocate resources effectively.

### Functionality Highlights:

- **Lead Management:** Our CRM captures and tracks leads from various sources, assigns them to sales representatives, and nurtures them through the sales funnel until conversion.
Opportunity Management: It facilitates the management of sales opportunities, allowing sales representatives to track their progress and forecast potential revenue.
Reporting and Analytics: The CRM generates reports and provides analytics to gain insights into customer behavior, sales trends, and team performance, empowering data-driven decision-making.
- **Integration:** Our application seamlessly integrates with other systems such as email, marketing automation, and accounting software, ensuring smooth data flow and process automation across the organization.

### Example Use Case:

-  A sales representative logs into the CRM system and views their schedule for the day, which includes client meetings and follow-up calls.
  They access customer profiles to review past interactions and preferences before the meeting, enabling them to tailor their approach effectively.
  During the meeting, they showcase relevant products based on the customer's needs and preferences, leveraging the CRM's product catalog and inventory information.
- After the meeting, they schedule follow-up tasks and set reminders for future engagements, ensuring timely follow-up and nurturing of leads.

### Conclusion:

In summary, our CRM application serves as a comprehensive solution for managing customer relationships, optimizing sales processes, and driving business growth. By leveraging the provided details, we create a platform that empowers sales teams to deliver exceptional customer experiences, increase efficiency, and achieve sales targets effectively.</p>



[screen-capture.webm](https://github.com/SumitKaushik1/CDAC-PROJECT-CRM-JSP-JAVABEAN-MYSQL/assets/110432346/43750252-264c-4305-8d74-949c59417610)


## Prerequisites & Tech
- Ubuntu 22.04.4 LTS Microsoft / Windows [Version 10.0.19041.1415] 
- java 11.0.14
- mysql  Ver 8.0.28
- Apache Tomcat v9 server
- mysql-connector-java-8.0.20.jar(Driver)

## Running on Ubuntu
 - open bash
    - follow commands
     
      root privileges:
   
       ```sh
          sudo su
       ```

      update the package lists for repositories configured in the system
    
       ```sh
         apt-get-update
       ```
       
         install java 11
    
       ```sh
         apt-get install openjdk-11-jre openjdk-11-jdk
       ```

         install tomcat9 server
    
       ```sh
         apt-get install tomcat9
       ```

       start tomcat server 
    
       ```sh
         systemctl start tomcat9
       ```
       
      install mysql-server

          apt-get install mysql-server
       
      mysql secure intallaiton

          mysql_secure_installation
       
   - following  instructions      
     - would  you like to setup validate password plugin ?
        - yes
     - please enter 0= LOW ,1=MEDIUM and 2=STRONG:0
        - 0
        - and set the password
     - Do you wish to continue with password provided?
       - Y
     - Remove anonymous users?
       - y
     - Disallow  root login remotely?
       - y
     - Remove test database and acccess to it ?
       - n
     - Reload privilages tables now?
       - y

______________________________________________________________________________



  login in mysql server

       mysql -u root -p
     
     
  - give password


  Replace 'new_password' with the new password you want to set. 
 
     ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';
  
  flush privileges to apply the changes immediately
    
     FLUSH PRIVILEGES;

  Grants all privileges to the 'root' user from the 'localhost' hostname, and it includes the WITH GRANT OPTION to allow the user to grant privileges to other users.

    GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;

  ### Entity-Relationship diagram.
   ![Screenshot (328019)](https://github.com/SumitKaushik1/CDAC-PROJECT-CRM-JSP-JAVABEAN-MYSQL-Application/assets/110432346/35be2c6b-27c0-44ef-ab4b-87e3919f17fe)

 ## Table Formation And Value Insertion
   - This folder contains SQL commands for table creation and insertion of values into those tables.
   ### mysql-Commands-Schema and Table formation
  - This file contains SQL commands for table creation
  ### my-sql commands-inserting values into Table
  - This file contains SQL commands for value insertion

## Mysql-Connector-Jar File
  - This folder contains mysql-connector jar file
 
 - Open bash
- Use the mv command to move the mysql connector jar  file to the lib directory of Apache Tomcat.
  
````sh
  mv /path/to/your/mysql-connector-java-8.0.20 /usr/share/tomcat9/lib
`````

- Replace /path/to/your/mysql-connector-java-8.0.20 with the absolute path to your mysql connector jar file

```sh
 mv /path/with/mysql-connector-java-8.0.20 /usr/share/tomcat9/lib
```

_________________________________________________________________________________________________________________________________________________________

- Create .war file of your web dynamic project (Web Application)Ensure that you have built your web application project and generated the .war file.

- Move .war file to the webapps folder of Apache Tomcat
- Open a terminal.
- Use the mv command to move the .war file to the webapps directory of Apache Tomcat.
  
````sh
  mv /path/to/your/project/ABC.war /var/lib/tomcat9/webapps
`````

- Replace /path/to/your/project/ABC.war with the absolute path to your .war file

```sh
mv /path/with/special chars/ABC.war /var/lib/tomcat9/webapps
```

___________________________________________________________________________________________________________________________________________________________

Note: The MySQL server login credentials must match the web project database login  credentials.

   start mysql server 
    
       
         systemctl start nysql
      

   Restart tomcat server 
    
       
         systemctl restart tomcat9
           
       
  Open the browser and enter the following link: 
        
        localhost:8080/CRM/

____________________________________________________________________________________________________________________________
  ## Running on Local  Window Machine    

### Configuring MySQL
 - Visit the  website
  ````````sh
   https://www.mysql.com/downloads/.
 ````````
 - click on "MySQL Community (GPL) Downloads"
 - Click on "MySQL Installer for Windows".
 - Select version 8.0.36 and choose "Microsoft Windows" as the operating system.
 - Click on the "Downloads" link next to "Windows (x86, 32-bit), MSI (285.3 M)Installer".
 - Click on "No thanks, just start my download."
 - After downloading, open the installer.
 - In the setup type selection, choose "Custom".
 - Click "Next".
 - Select "MySQL Servers" under the product selection dropdown.
 - Choose "MySQL Server 8.0" and drag it to the right side.
 - Also, drag "Workbench" and "Shell".
 - Click "Next" and proceed.
 - In the accounts and roles tab, set the MySQL root password.
 - Click "Next" to install.
 - Add the location of MySQL to the classpath in the environment variables.
 - Go to the start menu, type "services", and open "MySQL80".
 - Right-click on it and select "Start". The server will start.
 - Open CMD from the start menu.
 - Type mysql -u root -p and enter the password.

  <h3>Table Formation And Value Insertion</h3>
  
   - This folder contains SQL commands for table creation and insertion of values into those tables.
 
   #### mysql-Commands-Schema and Table formation
  - This file contains SQL commands for table creation
  
  #### my-sql commands-inserting values into Table
  - This file contains SQL commands for value insertion



### Configuring Spring Tool Suite

- Download the Spring Tool Suite from the following link: 
  ``````sh
      https://spring.io/tools
  ``````
- Once downloaded, extract the JAR file.
- Locate 'contents'  Zip archive file
- Extract the 'contents'  Zip archive file 
- Navigate to the folder named 'sts-4.22.0.RELEASE.'
- Locate and run the 'SpringToolSuite4.exe' file.
- When prompted, specify the directory where your CRM web dynamic project is located.
- Proceed by clicking 'OK' 
- After opening, access the Eclipse Marketplace within the Spring Tool Suite.
- Install the following plugins from the Eclipse Marketplace:
     - Eclipse Enterprise Java and Web Developer Tools version 3.33
     - Eclipse Web Developer Tools version 3.33

- step to add the tomcat server to ide
   - go to this website
  ``````sh
   https://tomcat.apache.org/download-90.cgi
  ````````
  - click on the 64-bit Windows zip (pgp, sha512)
  - it will download the zip file
 
 -  Download Apache Tomcat:
- Visit the official Apache Tomcat website: https://tomcat.apache.org/download-90.cgi
- Click on the "64-bit Windows zip (pgp, sha512)" link to download the zip file.
- Extract the Zip File:
- Once the download is complete, locate the downloaded zip file.
- Extract the contents of the zip file to a desired location on your computer.
- Open IDE:
- Launch your preferred integrated development environment (IDE).
- Navigate to Preferences:
   - Click on the "Window" tab in the menu bar.
   - Select "Preferences" from the dropdown menu.
   - Configure Runtime Environment:
   - In the search bar within Preferences, type "server" and press Enter.
   - Click on "Runtime Environments" from the search results.
   - Click on "Add" to configure a new runtime environment.
   - Select "Apache Tomcat v9.0" from the list and click "Next."
   - Browse to the location where Apache Tomcat v9.0 is installed, then click "OK."
   - Apply the changes and close the Preferences window.
- Show Server View:
   - Again, click on the "Window" tab.
   - Choose "Show View" and then click on "Servers."
   - Add New Server:
   - Right-click within the empty window of the Servers view.
   - Navigate to "New" and select "Server."
   - Choose "Apache" folder, then "Tomcat v9.0 Server."
   - Click "Next."
   - Select Projects:
   - In the configuration wizard, all the projects inside the CRM folder should be listed.
   - Select the CRM dynamic project.
   - Click "Finish."
- Run the Project:
   - Go to the CRM dynamic project within your IDE.
   - Right-click on the project.
   - Choose "Run on Server."
- Restart IDE:
- Restart your IDE to ensure all changes take effect.
