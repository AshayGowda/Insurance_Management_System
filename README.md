In the insurance database,
Relation between client and his policies is a one to many relationship, but policy type to clients is a many to many relationship.
• Data would be handled using different tables and relations using MySQL.
• A policy taken by a client has attributes like premium, sum assured, date of commencement, etc.
• A client has attributes including personal details as well as details about the policy he/she has taken.
• Create many other tables where records of policies taken by different clients would be present depending on its status like active, lapsed, etc.
The developed system should allow admin users to register insured persons with their name, date of birth, residence address and also policy details.
Every agent and the customer’s phone number must be unique among the rest in their category. Once the intial entries are done for the table containing agent details, create triggers to block new entries and also block the option for the already existing agents to update their details

 
