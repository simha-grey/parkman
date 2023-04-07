# parkman
ParkMan app displays parking garages information on the map.

Hi,everyone!

1.parkman.sql.
Here sql for db data. 

2. I decided to store latitude and logtitude separately as float(10.6).
Seems it's enough for quite accurate garage positioning. Approx 11cm.
In such way I hope to save some disk space for db storage.
Moreover it is more convenient to search for garage with float value than with string.

3.And I create index on latitude. We may use it for preliminary garage selection.
It's to be developed.

4. mytest directory.
I have created unit test. 
