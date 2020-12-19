/*
Database Name: event_uc
--Created by: Ricardo Sosa Soriano   
--Creation date: 31/10/2020
--Edited by Martin Cruz
*/

CREATE TABLE user_uc(
    user_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(100),
    password VARCHAR(32),
    created_date datetime DEFAULT NOW(),
    created_by  MEDIUMINT,
    active BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (user_id)
);


CREATE TABLE guest(
    guest_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    last_name VARCHAR(100),
    created_date datetime DEFAULT NOW(),
    created_by MEDIUMINT,
    active BOOLEAN,
    PRIMARY KEY (guest_id),
    FOREIGN KEY (created_by)
      REFERENCES user_uc(user_id)
);

CREATE TABLE organizer(
    organizer_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    created_date datetime DEFAULT NOW(),
    created_by  MEDIUMINT,
    PRIMARY KEY(organizer_id),
    FOREIGN KEY (created_by)
      REFERENCES user_uc(user_id)
);

CREATE TABLE event_uc(
    event_uc_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(200),
    organizer_id MEDIUMINT,
    start_date datetime,
    observations VARCHAR(700),
    duration_days INTEGER,
    created_date datetime DEFAULT NOW(),
    created_by  MEDIUMINT,
    edited_by INTEGER,
    edited_date datetime DEFAULT NOW(),
      PRIMARY KEY (event_uc_id),
      FOREIGN KEY(organizer_id)
        REFERENCES organizer(organizer_id),
      FOREIGN KEY (created_by)
      REFERENCES user_uc(user_id)
 );

CREATE TABLE guest_event(
    guest_id MEDIUMINT,
    event_uc_id MEDIUMINT,
    created_date datetime DEFAULT NOW(),
    created_by  MEDIUMINT,
    PRIMARY KEY(guest_id,event_uc_id),
    FOREIGN KEY(guest_id)
      REFERENCES guest(guest_id),
    FOREIGN KEY(event_uc_id)
     REFERENCES event_uc(event_uc_id),
    FOREIGN KEY(created_by)
      REFERENCES user_uc(user_id)

);

CREATE TABLE event_day(
    event_day_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    event_uc_id MEDIUMINT,
    schedule VARCHAR(200),
    start_time DATETIME,
    end_time DATETIME,
    observations VARCHAR(300),
     FOREIGN KEY (event_uc_id)
      REFERENCES event_uc(event_uc_id),
      PRIMARY KEY (event_day_id)
);
CREATE TABLE status_assistance(
   status_assistance_id MEDIUMINT NOT NULL AUTO_INCREMENT,
   name VARCHAR(100),
   PRIMARY KEY (status_assistance_id) 
);
CREATE TABLE assistance(
    assistance_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    guest_id MEDIUMINT,
    event_day_id MEDIUMINT,
    status_assistance_id MEDIUMINT,
    created_date datetime DEFAULT NOW(),
    created_by  MEDIUMINT,
    FOREIGN KEY (guest_id)
      REFERENCES guest(guest_id),
    FOREIGN KEY (event_day_id)
      REFERENCES event_day(event_day_id),
    FOREIGN KEY (status_assistance_id)
      REFERENCES status_assistance(status_assistance_id),
      PRIMARY KEY (assistance_id)
);

INSERT INTO user_uc(user_name,password, created_by,active)
  VALUES('administrator','123',1,1);

ALTER TABLE user_uc
  ADD CONSTRAINT fk_user_uc_user_uc 
  FOREIGN KEY (created_by) REFERENCES user_uc(user_id); 

