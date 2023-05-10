HW1: (E)ER diagram construction

Design Choices - Entities with more connections are usually placed in the middle (YOUTUBE VIDEO) while entities with less connections are usually placed around (YOUTUBE USER, SPONSOR, COMMENT, SUBSCRIPTION and so on.)

1. YOUTUBE USER - 
   a) Youtube Users can be Video Creators or  Video Consumers or both. Hence I assume that YOUTUBE USER is supertype for subtypes YOUTUBE VIDEO CONSUMER and YOUTUBE VIDEO CREATOR with overlapping complete constraints.
   b) I assume Youtube Users can comment on zero videos or multiple videos so I connected YOUTUBE USER and COMMENT table with one to zero or many relationship.

2. SUBSCRIPTION - 
   a) I assume that the Youtube User (Video Creators, Video Consumers) can subscribe to multiple Youtube Channels hence I connected SUBSCRIPTION and YOUTUBE USER with many-to-one relationship and Youtube Channel can be subscribed by multiple Youtube Users hence I connect SUBSCRIPTION and YOUTUBE CHANNEL with many-to-many relationship.

3. YOUTUBE CHANNEL - 
   a) I assume Video Creator can create one or multiple channels hence used one-to-many relationship between YOUTUBE VIDEO CREATOR and YOUTUBE CHANNEL but channel can only have one Video Creator
   b) I used a one-to-many relationship between YOUTUBE CHANNEL and YOUTUBE VIDEO because I assume Youtube Channel can consist of zero or multiple Youtube Videos.

4. YOUTUBE VIDEO - 
   a) I assume Youtube Video belongs to only Youtube Channel hence I used one and only relationship between YOUTUBE VIDEO and YOUTUBE VIDEO CREATOR.
   b) I assume Youtube Video contains Metadata which is included in YOUTUBE VIDEO METADATA table such as duration, category, thumbnails, description etc and Youtube Video has statistics YOUTUBE VIDEO STATISTICS to gauge popularity. Each Youtube Video will have one and only one row in YOUTUBE VIDEO METADATA and STATISTICS table hence used one-to-one relationship
   c) Youtube Video can be Informational Video, Entertainment Video etc. Hence I assume that YOUTUBE VIDEO is supertype for subtypes YOUTUBE INFORMATIONAL VIDEO and YOUTUBE ENTERTAINMENT VIDEO CREATOR with disjoint partial constraints since there can be youtube videos of many other type and every type is distinct.
   d) I assume Youtube Videos can have zero or many comments which are stored in the COMMENT table and I connected YOUTUBE VIDEO and COMMENT table using a one-to-zero or many relationship.
   e) I assume Youtube Videos can have zero or many Sponsors which are stored in the SPONSOR table and I connected YOUTUBE VIDEO and SPONSOR table with the help of one-to-zero or many relationship.

5. COMMENT
   a) I assume a row in the COMMENT table can belong to a single video and connect COMMENT to YOUTUBE VIDEO table with a one-to-one relationship. 
   b) I assume comment will be commented by unique Youtube User, so connected COMMENT to YOUTUBE USER table with one-to-one relationship

6. SPONSOR
   a) I assume that if a row exist ie Sponsor exist in SPONSOR table than he will sponsor at least one video hence connected SPONSOR and YOUTUBE VIDEO with many-to-one or many relationship