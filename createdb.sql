CREATE TABLE "Patient" (
 	"Patient_name" varchar(20) not null,
 	"Patient_surname" varchar(20) not null,
	"Patient_ID" varchar(11) not null,
    "Patient_bloodtype" varchar(5),
    "Patient_phonenumber" char(11) not null,
  	"Patient_address" varchar(200),
  	"Patient_birthdate" date,
  	primary key ("Patient_ID")
);

CREATE TABLE "Dental Disease" (
  "Disease_name" varchar(20),
  "Disease_id" varchar(11) not null,
  PRIMARY KEY ("Disease_id")
);

CREATE TABLE "Treatment" (
  "Treatment_id" varchar(20) NOT NULL ,
  "Treatment_tool" varchar(30),
  "Treatment_name" varchar(15),
  PRIMARY KEY ("Treatment_id")
);

CREATE TABLE "Dentist" (
  "Dentist_ID" varchar(11) NOT NULL ,
  "Dentist_Name" varchar(20),
  "Dentist_Surname" varchar(20),
  "Dentist_RoomNumber" varchar(4),
  PRIMARY KEY ("Dentist_ID")
);

CREATE TABLE "Dental Clinic" (
  "Clinic_address" varchar(200),
  "Dentalclinic_name" varchar(20),
  "Clinic_phonenumber" varchar(11)
 );

CREATE TABLE "Has" (
  "Patient_ID" varchar(10),
  "Disease_id" varchar(30),
  PRIMARY KEY ("Patient_ID","Disease_id")
);

CREATE TABLE "Solved with" (
	"Disease_id" varchar(10),
	"Treatment_id" varchar(10),
	PRIMARY KEY ("Disease_id", "Treatment_id")
);

CREATE TABLE "Has Proficiency in" (
	"Treatment_id" varchar(20),
	"Dentist_ID" varchar(11),
	PRIMARY KEY ("Treatment_id", "Dentist_ID")
);

CREATE TABLE "Treated by" (
	"Patient_ID" varchar(11),
	"Disease_id" varchar(11),
	"Dentist_ID" varchar(11),
	PRIMARY KEY ("Patient_ID","Disease_id","Dentist_ID")
);

CREATE TABLE "Apply to" (
	"Patient_ID" varchar(11),
	"Dentalclinic_name" varchar(20),
	PRIMARY KEY ("Patient_ID")
);

CREATE TABLE "Works at" (
	"Dentist_ID" varchar(11),
	"Dentalclinic_name" varchar(20),
	primary key ("Dentist_ID")
	
);

ALTER TABLE public."Has" ADD CONSTRAINT has_fk FOREIGN KEY ("Patient_ID","Disease_id") REFERENCES public."Has"("Patient_ID","Disease_id");
ALTER TABLE public."Solved with" ADD CONSTRAINT solved_with_fk FOREIGN KEY ("Disease_id") REFERENCES public."Dental Disease"("Disease_id");
ALTER TABLE public."Solved with" ADD CONSTRAINT solved_with_fk_1 FOREIGN KEY ("Treatment_id") REFERENCES public."Treatment"("Treatment_id");
ALTER TABLE public."Has Proficiency in" ADD CONSTRAINT has_proficiency_in_fk FOREIGN KEY ("Treatment_id") REFERENCES public."Treatment"("Treatment_id");
ALTER TABLE public."Has Proficiency in" ADD CONSTRAINT has_proficiency_in_fk_1 FOREIGN KEY ("Dentist_ID") REFERENCES public."Dentist"("Dentist_ID");
ALTER TABLE public."Treated by" ADD CONSTRAINT treated_by_fk FOREIGN KEY ("Patient_ID") REFERENCES public."Patient"("Patient_ID");
ALTER TABLE public."Treated by" ADD CONSTRAINT treated_by_fk_1 FOREIGN KEY ("Disease_id") REFERENCES public."Dental Disease"("Disease_id");
ALTER TABLE public."Treated by" ADD CONSTRAINT treated_by_fk_2 FOREIGN KEY ("Dentist_ID") REFERENCES public."Dentist"("Dentist_ID");
ALTER TABLE public."Apply to" ADD CONSTRAINT apply_to_fk FOREIGN KEY ("Patient_ID") REFERENCES public."Patient"("Patient_ID");
ALTER TABLE public."Works at" ADD CONSTRAINT works_at_fk FOREIGN KEY ("Dentist_ID") REFERENCES public."Dentist"("Dentist_ID");



insert into "Patient" values('Melissa','Tung',43975170993,'A+',05499537146,'Delhi','1995.01.11');
insert into "Patient" values('Sieffre','Blanxart',26461400255,'AB+',05616192068,'Strasbourg','1989.11.19');
insert into "Patient" values('Raimundo','Moffrett',82884303384,'A-',05012543670,'Fullerton' ,'1976.12.03');
insert into "Patient" values('Ayla','Haig',39311235566,'0+',05550258794,'Seattle','1987.04.22');
insert into "Patient" values('Susannah','Meadows',40307876740,'B+',05102143845,'Amarillo', '1969.12.14');
insert into "Patient" values('Jessica','Wilson',60633948771,'0-',05962631512,'Nashville', '1993.08.07');
insert into "Patient" values('Anastasia','Vesela',31234224586,'AB+',05060220415,'Concord','2001.07.12');
insert into "Patient" values('Andy','Whisenhunt',78513474948,'A-',05337541437,'Berkeley','2006.09.02');
insert into "Patient" values('Hannah','Cruz',18842711970,'A+',05241058490,'Jacksonville','1998.10.25');
insert into "Patient" values('John','Parson',74604831596,'AB-',05329954915,'Greensboro','1986.03.31');

insert into "Dental Disease" values ('dental cavity',30936);
insert into "Dental Disease" values ('trapezoid teeth',72398);
insert into "Dental Disease" values ('toothache',23181);
insert into "Dental Disease" values ('gingivitis disease',28662);
insert into "Dental Disease" values ('tooth decay',70285);
insert into "Dental Disease" values ('oral cancer',46149);
insert into "Dental Disease" values ('mouth sores',21897);
insert into "Dental Disease" values ('tooth erosion',29635);
insert into "Dental Disease" values ('tooth sensitivity',51850);
insert into "Dental Disease" values ('unattractive smile',92520);

insert into "Treatment" values (21383 , 'dental drill' , 'fillings');
insert into "Treatment" values (66891 , 'dental braces' , 'invisalign');
insert into "Treatment" values (29720 , 'sond' , 'bonding');
insert into "Treatment" values (91889 , 'presel' , 'root canal');
insert into "Treatment" values (98353 , 'angle drive' , 'crowns');
insert into "Treatment" values (73189 , 'mouth mirror' , 'veneers');
insert into "Treatment" values (76806 , 'suction' , 'extractions');
insert into "Treatment" values (86782 , 'dental probe' , 'teeth cleanings');
insert into "Treatment" values (17434 , 'dental cleaner' , 'teeth whitening');
insert into "Treatment" values (46244 , 'mold' , 'dentures');

insert into "Dentist" values (31948643811, 'Kizzy', 'Norwood' ,121);
insert into "Dentist" values (30376804617 'Rick' , 'Davidson' ,122);
insert into "Dentist" values (21044144025 'Trace' , 'Greyson' , 123);
insert into "Dentist" values (31233503998 'Victor' , 'Darcy' , 124);
insert into "Dentist" values (95769584049 'Taylor' , 'Hart' , 125);
insert into "Dentist" values (02875391735 'Carly' , 'Arterberry' ,126);
insert into "Dentist" values (69181581452 'Diena' , 'Thomson' ,127);
insert into "Dentist" values (05847699319 'Rachel' , 'Greene' , 128);
insert into "Dentist" values (69488078051 'Monica' , 'Geller' , 129);
insert into "Dentist" values (79200002350) 'Phoebe' , 'Buffay' , 130);

insert into "Dental Clinic" values('Austin','Forthright Dental' , '5823338720');
insert into "Dental Clinic" values('Beaumont','Kangen Dental' , '2258630799');
insert into "Dental Clinic" values('Baltimore','Hemdale Dental Center' , '3415840753');
insert into "Dental Clinic" values('Las Vegas','New Walk Dental Clinic' , '4309852030');
insert into "Dental Clinic" values('Wichita','Sakada Dental' , '6144301819');
insert into "Dental Clinic" values('Avignon','Titanium Dental Care' , '5822226406');
insert into "Dental Clinic" values('Fatehpur','Tinmouth Dental' , '2153862895');
insert into "Dental Clinic" values('Joliet','Feng Yuan Dental' , '5205401870');
insert into "Dental Clinic" values('Montpellier','Pulizol Dental' , '3189652027');
insert into "Dental Clinic" values('Foshan','Smile Dental Clinic' , '2313258666');








