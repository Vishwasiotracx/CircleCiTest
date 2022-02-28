-- initial database
CREATE TABLE `rider` ( `id` INT(11) NOT NULL AUTO_INCREMENT , `mobileno` TEXT NOT NULL , `country` TEXT NOT NULL , `name` TEXT NOT NULL , `addressline1` TEXT NULL , `addressline2` TEXT NULL , `pincode` TEXT NULL , `latitude` TEXT NULL , `longitude` TEXT NULL , `rc_image` TEXT NULL , `dl_image` TEXT NULL , `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP , PRIMARY KEY (`id`)) ENGINE = InnoDB; 

ALTER TABLE `rider` ADD `device_id` TEXT NULL AFTER `dl_image`; 
ALTER TABLE `rider` ADD `customer_id` TEXT NULL AFTER `dl_image`, ADD `isactive` INT NOT NULL DEFAULT '1' AFTER `customer_id`, ADD `notification` INT NOT NULL DEFAULT '1' AFTER `isactive`, ADD `isonline` INT NOT NULL DEFAULT '0' AFTER `notification`, ADD `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `isonline`; 
CREATE TABLE `rider_auth` (
  `id` int(11) NOT NULL,
  `rider_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `otp` int(11) DEFAULT NULL,
  `created_at` timestamp DEFAULT current_timestamp(),
  `updated_at` timestamp DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `rider_auth`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `rider_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

ALTER TABLE `rider` CHANGE `mobileno` `phone` TEXT NOT NULL; 
ALTER TABLE `rider` CHANGE `country` `countrycode` TEXT NOT NULL; 

CREATE TABLE `rider_addresses` (
  `id` int(11) NOT NULL,
  `riderid` int(11) NOT NULL,  
  `addressline1` text NOT NULL,
  `addressline2` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `latitude` text DEFAULT NULL,
  `longitude` text DEFAULT NULL,
  `defaultselected` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

ALTER TABLE `rider_addresses`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rider_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

ALTER TABLE `contactquery` ADD `riderid` INT NOT NULL DEFAULT '0' AFTER `merchantid`; 

CREATE TABLE `ridernotification` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `subtitle` text NOT NULL,
  `applicationid` text NOT NULL,
  `orderid` text NOT NULL,
  `alreadyread` int(11) NOT NULL DEFAULT 0,
  `Createddate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `userid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `ridernotification`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `ridernotification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;


--21-07
ALTER TABLE `rider` ADD `profile_image` TEXT NULL AFTER `rc_image`; 


--16-08
ALTER TABLE `rider`
ADD `reported_to` text COLLATE 'latin1_swedish_ci' NULL AFTER `gridname`;