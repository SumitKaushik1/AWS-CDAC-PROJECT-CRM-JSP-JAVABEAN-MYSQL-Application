# CDAC-PROJECT-CRM-JSP-JAVABEAN-MYSQL

## Browser Link
https://crmpro.us.to/

## Login Credentials 
- login id - u1111111111
- Login Role Id - r1111111111
- First Name - sumit
- Last Name - kaushik
- Password - Sumit@123



## CRM Application/CRM
This folder contains the source code for the CRM Application.

## apache-tomcat-9.0.36   
This folder contains the apache tomcat server  for the CRM Application.

## Features
[screen-capture.webm](https://github.com/SumitKaushik1/CDAC-PROJECT-CRM-JSP-JAVABEAN-MYSQL/assets/110432346/43750252-264c-4305-8d74-949c59417610)

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






## Prerequisites & Tech
- Ubuntu 22.04.4 LTS Microsoft / Windows [Version 10.0.19041.1415] 
- java 11.0.14
- mysql  Ver 8.0.28
- Apache Tomcat v9 server
- mysql-connector-java-8.0.20.jar(Driver)

## Setting Up an EC2 Instance On AWS 
- Create an EC2 Instance:

- Choose Ubuntu Server 24.04 as the Amazon Machine Image (AMI).
- Select the t2.micro instance type (free tier eligible).
- Generate a .pem key file (e.g., window-demo.pem) for SSH access.
- Launch the Instance:

- Review your settings and click on Launch Instance.
- Configure Security Group:

- Go to the Security Group tab and add the following inbound rules:
 - Type: HTTPS, Source Type: Custom, Source: 0.0.0.0/0, Description: For SSL certificate
   - Note: If you don't have an SSL certificate, avoid using port numbers associated with HTTPS (typically port 443). If HTTPS is enabled on a port and there's no SSL certificate, browsers will attempt to connect via HTTPS by default. If HTTPS is disabled, traffic defaults to HTTP instead. This is why it's important to configure ports accordingly based on your SSL certificate status to ensure traffic is routed correctly.
 - Type: HTTP, Source Type: Custom, Source: 0.0.0.0/0, Description: For Apache server
 - Type: Custom TCP, Source Type: Custom, Source: 0.0.0.0/0, Port Range: 8080, Description: For tomcat server
 - Type: Custom TCP, Source Type: Custom, Source: 0.0.0.0/0, Port Range: 9100, Description: For Node Exporter
 - Save the Security Group Rules.

- Connecting to the EC2 Instance
- Open Git Bash.
- Type the following command to connect to your EC2 instance via SSH:
  - eg ssh -i "port-folio1.pem" ubuntu@ec2-65-1-114-222.ap-south-1.compute.amazonaws.com



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
    
       
         systemctl start mysql
      

   Restart tomcat server 
    
       
         systemctl restart tomcat9
           
       
  Open the browser and enter the following link: 
        
        localhost:8080/CRM/
____________________________________________________________________________________________________________________
# Redirect public ip address  directly to the web application

- Run the following commands to install and enable the required Apache modules:
``````sh
sudo apt update
sudo apt install apache2
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod rewrite
``````

- Configure Apache Virtual Host:

- Navigate to the Apache Sites-Available Directory:

`````ah
cd /etc/apache2/sites-available
`````


- Create a Configuration File:
````sh
touch ip_address.conf
````
- Open the Configuration File for Editing:

````sh
nano ip_address.conf
````
- Add the Following Lines to ip_address.conf:

`````sh
<VirtualHost *:80>
    ServerName 13.127.64.2

  

    ProxyPass / http://localhost:8080/CRM/
    ProxyPassReverse / http://localhost:8080/CRM/

    ProxyPreserveHost On
    # Ensure correct forwarding of cookies and returning the JSESSIONID to the user
    Header edit Set-Cookie "^(.*)$" "$1; Path=/; HttpOnly"

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
`````
- Save and Exit the File:

- Press Ctrl + O to save the file.
- Press Enter to confirm.
- Press Ctrl + X to exit the editor.
- Restart the Apache2 and Tomcat Servers:

````sh
sudo a2ensite ip_address.conf
sudo systemctl reload apache2
sudo systemctl restart apache2
sudo systemctl restart tomcat9
````


- These steps will configure a virtual host in Apache to proxy requests to a Tomcat server running on localhost. The ProxyPreserveHost On directive and the header modification ensure that the JSESSIONID is correctly forwarded to the user. Finally, the necessary services are restarted to apply the changes.
    - ProxyPreserveHost On
    - Header edit Set-Cookie "^(.*)$" "$1; Path=/; HttpOnly"



# Redirect domain name  directly to the web application
- Run the following commands to install and enable the required Apache modules if it is already installed then no need:
``````sh
sudo apt update
sudo apt install apache2
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod rewrite
``````
- Configure Apache Virtual Host:

- Navigate to the Apache Sites-Available Directory:

`````ah
cd /etc/apache2/sites-available
`````


- Create a Configuration File:
````sh
touch your_domain.conf
````
- Open the Configuration File for Editing:

````sh
nano your_domain.conf
````
- Add the Following Lines to your_domain.conf:

`````sh
<VirtualHost *:80>
    ServerName crmpro.us.to

  

    ProxyPass / http://localhost:8080/CRM/
    ProxyPassReverse / http://localhost:8080/CRM/

    ProxyPreserveHost On
    # Ensure correct forwarding of cookies and returning the JSESSIONID to the user
    Header edit Set-Cookie "^(.*)$" "$1; Path=/; HttpOnly"

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
`````
- Save and Exit the File:

- Press Ctrl + O to save the file.
- Press Enter to confirm.
- Press Ctrl + X to exit the editor.
- Restart the Apache2 and Tomcat Servers:

````sh
sudo a2ensite your_domain.conf
sudo systemctl restart apache2
sudo systemctl reload apache2
sudo systemctl restart tomcat9

````


- These steps will configure a virtual host in Apache to proxy requests to a Tomcat server running on localhost. The ProxyPreserveHost On directive and the header modification ensure that the JSESSIONID is correctly forwarded to the user. Finally, the necessary services are restarted to apply the changes.
    - ProxyPreserveHost On
    - Header edit Set-Cookie "^(.*)$" "$1; Path=/; HttpOnly"
_____________________________________________________________________________________________________________________

 # Getting Free Domain Name
 - Open the Website: Navigate to FreeDNS.
`````sh
https://freedns.afraid.org
`````
- Register for a New Account:

  - Click on the "Sign Up" button to create a new account.
  - Fill in the required information, such as username, email, and password.
  - Complete any verification steps, such as email confirmation, if prompted.
  - Sign In:

- Once registered, sign in to your account using your credentials.
- Access the Registry:

- After logging in, go to the "Registry" section.
- Locate the right side bar and click on it.
   - Choose a Domain Name:

   - From the available options, choose any domain name you prefer.
   - Create a Subdomain:

   - Enter the name of your desired subdomain.
   - Provide the IP address of your web application.
   - Complete the CAPTCHA verification.
   - Finalize:
   
   - Click "OK" to complete the process.






_____________________________________________________________________________________________________________________

 # Getting Free SSL Certificate 

   `````` sh
   sudo dpkg --configure -a
   sudo apt-get install -f
   sudo apt-get update
   sudo apt-get install python3-update-manager update-manager-core
   sudo apt-get dist-upgrade
   sudo apt-get install certbot python3-certbot-apache
   certbot --apache -d  crmpro.us.to
   ````````

   
   - Certainly! Here's a refined version of your instruction:
   
   - Setting Up Email Permissions
   - Provide the Email Address when prompted.
   - Grant All Permissions by selecting "Yes" for each permission request.
   - Confirm by selecting "Yes" whenever prompted.

- if you get this type of error 
````sh
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Requesting a certificate for crmpro.uk.to
An unexpected error occurred:
There were too many requests of a given type :: Error creating new order :: too many certificates already issued for "uk.to". Retry after 2024-06-17T07:00:00Z: see https://letsencrypt.org/docs/rate-limits/
Ask for help or search for solutions at https://community.letsencrypt.org. See the logfile /var/log/letsencrypt/letsencrypt.log or re-run Certbot with -v for more details
````
- it means that you have to run the commands just after time it is mentioned 

______________________________________________________________________________________________________________________________________________

 - **This final command on terminal  restarts the Apache web server service again, now that your portfolio files are in the correct location. This ensures that Apache serves your portfolio correctly from its new location.**
    `````sh
     sudo systemctl restart apache2
   `````



# Migrate EC2 instance from one region to other region on AWS
- Access the AWS EC2 Console:

  - Go to the AWS EC2 Console.
  - Navigate to the Europe (Stockholm) region (eu-north-1).
  - Create an Image:
     - Select the desired instance.
     - Go to Actions -> Image and Templates -> Create Image.
     - Set the Image name to window-demo.
     - Set the Image description to window-demo.
     - Enable No reboot by checking the box.
     - Click on Create Image.

 - Monitor AMI Creation:
   - Go to the AMI console in AWS.
   - Wait for the image status to become available, refreshing as necessary.
 - Copy the Image:
   - Once the window-demo image is available, select it.
   - Go to Actions -> Copy Image.
   - Set the AMI copy name to window-demo.
   - Select the destination region as Asia Pacific (Mumbai) (ap-south-1).
   - Ensure Copy tags is checked.
   - Click on Copy Image.

 - Launch the Instance in the Mumbai Region:
   - Switch to the Mumbai region (ap-south-1) in AWS.
   - Open the AMI console.
   - Wait for the image status to become available, refreshing as necessary.
   - Select the image and click on Launch to start a new EC2 instance.

## now follow the steps in 
<h3>Setting Up an EC2 Instance On AWS </h3>
<h3>Redirect public ip address  directly to the web application</h3>
<!--<h3>Redirect domain name   directly to the web application</h3>
<h3>Getting Free SSL Certificate</h3>-->

## Error - Web applicaion is not opening
 it may happen it does not open(chrome) in one browser so check in another browser(edge)  

## Error - apache.service 

Sometimes, a .conf file contains syntax errors, such as missing IP addresses or domain names. These mistakes can lead to various errors when the configuration is applied.


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
- To integrate the MySQL Connector JAR file into your project, follow these steps:
   - Locate the "MySQL Connector JAR File" This folder holds the MySQL Connector JAR file necessary for database connectivity.
   - Clone and Copy the Folder: Clone this folder and copy the MySQL Connector JAR file from it.
   - Paste in Tomcat Server's lib Folder: Navigate to the lib folder of your Apache Tomcat server. Typically, this folder resides at apache-tomcat-9.0.88\lib. Paste the MySQL Connector 
     JAR file here.
   - Paste in Project's lib Folder: Additionally, paste the MySQL Connector JAR file in the lib folder located at src -> main -> webapp -> WEB-INF of your project directory. 
- Add the Tomcat server runtime libraries and webapp libraries

  - To add the Tomcat server runtime libraries to a dynamic web project in Spring Tool Suite (STS), you can follow these steps:

      - Open Your Project: Open your dynamic web project in Spring Tool Suite.
      - Project Properties: Right-click on the project in the Project Explorer, then select "Properties" from the context menu.
      - Java Build Path: In the Properties dialog, navigate to "Java Build Path" from the left-hand side menu.
      - Libraries Tab: Click on the "Libraries" tab.
      - click on the classpath
      - Add Library: Click on the "Add Library..." button.
      - Select Server Runtime: In the "Add Library" dialog, select "Server Runtime" and click "Next".
      - Choose Tomcat: Select "Apache Tomcat" as the server runtime environment and click "Finish".
      - Again  click on the classpath
      - Add Library: Click on the "Add Library..." button.
      - click on webApp libraries  and click "Next".
      - Apply and Close: Click "Apply and Close" to apply the changes and close the Properties dialog.
   

 
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

 
