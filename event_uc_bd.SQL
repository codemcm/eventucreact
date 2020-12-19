/*
Database Name: event_uc
--Created by: Ricardo Sosa Soriano   
--Creation date: 31/10/2020
--Edited by Martin Cruz
--for: Postgresql
*/

CREATE TABLE PUBLIC.user_uc(
    user_id SERIAL NOT NULL,
    user_name VARCHAR(100),
    password VARCHAR(32),
    created_date TIMESTAMP DEFAULT NOW(),
    updated_date TIMESTAMP DEFAULT NOW(),
    created_by  INTEGER,
    updated_by INTEGER
    active BOOLEAN DEFAULT TRUE,
    CONSTRAINT pk_user_uc PRIMARY KEY (user_id)
);

CREATE TABLE PUBLIC.guest(
    guest_id SERIAL NOT NULL,
    name VARCHAR(50),
    last_name VARCHAR(100),
    created_date TIMESTAMP DEFAULT NOW(),
    updated_date TIMESTAMP DEFAULT NOW(),
    created_by  INTEGER,
    updated_by INTEGER,
    active DEFAULT TRUE,
    CONSTRAINT pk_guest PRIMARY KEY (guest_id)
);

CREATE TABLE organizer(
    organizer_id SERIAL NOT NULL,
    name VARCHAR(50),
    created_date TIMESTAMP DEFAULT NOW(),
    updated_date TIMESTAMP DEFAULT NOW(),
    created_by  INTEGER,
    updated_by INTEGER,
    active DEFAULT TRUE,
    CONSTRAINT pk_organizer PRIMARY KEY(organizer_id)
);

CREATE TABLE event_uc(
    event_uc_id SERIAL NOT NULL,
    name VARCHAR(200),
    organizer_id INTEGER,
    observations VARCHAR(700),
    duration_days INTEGER,
    created_date TIMESTAMP DEFAULT NOW(),
    updated_date TIMESTAMP DEFAULT NOW(),
    created_by  INTEGER,
    updated_by INTEGER,
    active DEFAULT TRUE,
    CONSTRAINT pk_event_uc PRIMARY KEY (event_uc_id)
 );

CREATE TABLE guest_event(
    guest_id INTEGER,
    event_uc_id INTEGER,
    created_date TIMESTAMP DEFAULT NOW(),
    updated_date TIMESTAMP DEFAULT NOW(),
    created_by  INTEGER,
    updated_by INTEGER,
    CONSTRAINT pk_guest_event PRIMARY KEY(guest_id,event_uc_id)
);

CREATE TABLE event_day(
    event_day_id SERIAL NOT NULL,
    event_uc_id INTEGER,
    schedule VARCHAR(200),
    start_time TIME,
    end_time TIME,
    observations VARCHAR(300),
    CONSTRAINT pk_event_day PRIMARY KEY (event_day_id)
);
CREATE TABLE status_assistance(
   status_assistance_id SERIAL NOT NULL,
   name VARCHAR(100) UNIQUE,
   active BOOLEAN DEFAULT TRUE,
   CONSTRAINT pk_status PRIMARY KEY (status_assistance_id) 
);
CREATE TABLE assistance(
    assistance_id SERIAL NOT NULL,
    guest_id INTEGER,
    event_day_id INTEGER,
    status_assistance_id INTEGER,
   created_date TIMESTAMP DEFAULT NOW(),
    updated_date TIMESTAMP DEFAULT NOW(),
    created_by  INTEGER,
    updated_by INTEGER,
    CONSTRAINT pk_assistance  PRIMARY KEY (assistance_id)
);

--INSERT VALUES
INSERT INTO user_uc(user_name,password, created_by,active)
  VALUES('administrator','123',1,1);

/*
FOREIGN KEY CONSTRAINTS
*/


--USER
ALTER TABLE user_uc
  ADD CONSTRAINT fk_user_uc_user_uc 
  FOREIGN KEY (created_by) REFERENCES user_uc(user_id); 


--GUEST
ALTER TABLE guest
  ADD CONSTRAINT fk_guest_created
  FOREIGN KEY (created_by) REFERENCES user_uc(user_id);

ALTER TABLE guest
  ADD CONSTRAINT fk_guest_updated
  FOREIGN KEY (updated_by) REFERENCES user_uc(user_id);

--ORGANIZER

ALTER TABLE organizer
  ADD CONSTRAINT fk_organizer_created
  FOREIGN KEY (created_by) REFERENCES user_uc(user_id);

ALTER TABLE organizer
  ADD CONSTRAINT fk_organizer_updated
  FOREIGN KEY (updated_by) REFERENCES user_uc(user_id);

--EVENT_UC
ALTER TABLE event_uc
  ADD CONSTRAINT fk_event_created
  FOREIGN KEY (created_by) REFERENCES user_uc(user_id);

ALTER TABLE event_uc 
  ADD CONSTRAINT fk_event_updated
  FOREIGN KEY (updated_by) REFERENCES user_uc(user_id);

ALTER TABLE event_uc 
  ADD CONSTRAINT fk_event_organizer
  FOREIGN KEY (organizer_id) REFERENCES organizer(organizer_id);

--GUEST_EVENT
ALTER TABLE guest_event
  ADD CONSTRAINT fk_guest_event_created
  FOREIGN KEY (created_by) REFERENCES user_uc(user_id);

ALTER TABLE guest_event 
  ADD CONSTRAINT fk_guest_event_updated
  FOREIGN KEY (updated_by) REFERENCES user_uc(user_id);

ALTER TABLE guest_event 
  ADD CONSTRAINT event_guest
  FOREIGN KEY (guest_id) REFERENCES guest(guest_id);

ALTER TABLE guest_event 
  ADD CONSTRAINT guest_event_event
  FOREIGN KEY (event_uc_id) REFERENCES event_uc(event_uc_id);

--EVENT_DAY
ALTER TABLE event_day
  ADD CONSTRAINT fk_event_day_event
  FOREIGN KEY (event_uc_id) REFERENCES event_uc(event_uc_id);

--ASSISTANCE
ALTER TABLE assistance
  ADD CONSTRAINT fk_assistance_guest
  FOREIGN KEY (guest_id) REFERENCES guest(guest_id);

ALTER TABLE assistance
  ADD CONSTRAINT fk_assistance_eventday
  FOREIGN KEY (event_day_id) REFERENCES event_day(event_day_id);

ALTER TABLE assistance
  ADD CONSTRAINT fk_assistance_status
  FOREIGN KEY (status_assistance_id) REFERENCES event_day(status_assistance_id);