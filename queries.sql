-SUBQUERY THAT RETURNS 1 SINGLE-ROW
-Find the patient whose Patient_id is ‘39311235566’.

select "Patient_id"
from "Patient" p
where "Patient_id" = (select "Patient_id" from "Patient" where "Patient_id" = '39311235566');

-SUBQUERY THAT RETURNS 1 MULTIPLE-ROW
-Find the dentists whose name include a substring ‘ac’.

select "Dentist_Name"
from "Dentist" d
where "Dentist_Name" in (select "Dentist_Name"
from "Dentist"
where "Dentist_Name" like '%ac%');

-2 TABLE JOIN
-Find the dentists’ names and the treatment id’s they have proficiency in.

select "Dentist_Name" , "Treatment_id"
from "Dentist" d natural join "Has Proficiency in" hpi
where d."Dentist_ID" = hpi."Dentist_ID";

-3 TABLE JOIN
-Find the patients names and dental diseases they have.

select "Patient_name" , "Disease_name"
from "Patient" p , "Dental Disease" dd , "Treated by" tb
where p."Patient_id" = tb."Patient_ID" and dd."Disease_id" = tb."Disease_id" ;

-OUTER JOIN
- Find the patient names, their diseases id, and their belonging dentist id.

select p."Patient_name" , tb."Disease_id" , tb."Dentist_ID"
from "Patient" p full outer join "Treated by" tb ON p."Patient_id" = tb."Patient_ID" ;

-UPDATE QUERY
-Update the existing treatment table by adding a new treatment tool.

update "Treatment"
set "Treatment_tool" = 'floss'
where "Treatment_name" = 'teeth whitening';

-COUNT QUERY EXAMPLE 1
-Count the names of the patients whose name starts with ‘A’

select count(*) as "Patients name starts with the letter 'A' "
from "Patient" p
where p."Patient_name" in (select "Patient_name"
from "Patient"
where "Patient_name" like '%A%');

-COUNT QUERY EXAMPLE 2
-Count the patient’s id’s whose blood type is ‘AB+’ and address is ‘Strasbourg’.

select count ("Patient_id")
from "Patient"
where "Patient_bloodtype" = 'AB+' and "Patient_address" = 'Strasbourg';

-LENGTH QUERY
-Find the patient’s name and its length whose address is ‘Nashville’.

select "Patient_name", length("Patient_name")
from "Patient"
where "Patient_address" ='Nashville';

-ALTER TABLE, INSERT INTO AND UPDATE QUERY
-Add an ‘Salary’ column to the existing Dentist table. Insert new dentists to the Dentist table. Update the Dentist table by adding salaries to existing dentists.

alter table "Dentist" add column "Salary" int;
insert into "Dentist" values (12695879632,'Shawn','Nixon',131,2500);
insert into "Dentist" values (58963214567,'Eldon','Watts',132,3000);
insert into "Dentist" values (78963201210,'Jayda','Atkins',133,2800);
insert into "Dentist" values (11987463250,'Paula','Stark',134,2700);
insert into "Dentist" values (29123658711,'Barry','Jefferson',135,2300);
UPDATE public."Dentist" set "Salary"=2100 WHERE "Dentist_ID"='31948643811';
UPDATE public."Dentist" set "Salary"=2700 WHERE "Dentist_ID"='30376804617';
UPDATE public."Dentist" set "Salary"=3200 WHERE "Dentist_ID"='21044144025';
UPDATE public."Dentist" set "Salary"=3100 WHERE "Dentist_ID"='31233503998';
UPDATE public."Dentist" set "Salary"=2900 WHERE "Dentist_ID"='95769584049';
UPDATE public."Dentist" set "Salary"=2600 WHERE "Dentist_ID"='2875391735';
UPDATE public."Dentist" set "Salary"=2400 WHERE "Dentist_ID"='69181581452';
UPDATE public."Dentist" set "Salary"=2850 WHERE "Dentist_ID"='5847699319';
UPDATE public."Dentist" set "Salary"=null WHERE "Dentist_ID"='69488078051';
UPDATE public."Dentist" set "Salary"=null WHERE "Dentist_ID"='79200002350';

-SUM QUERY
-Find the sum of the dentist’s salaries whose salary is higher than 2500.

select sum(d."Salary") as "Sum of the dentist's salaries whose salary is higher than 2500"
from "Dentist" d
where d."Salary" > 2500;

-UPDATE QUERY
-Update the dentist room numbers 121 to 125 to 120, 126 to 129 to 130,and 131 to 135 to 140.

UPDATE "Dentist"
SET "Dentist_RoomNumber"='120'
WHERE "Dentist_RoomNumber"='125';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='120'
WHERE "Dentist_RoomNumber"='124';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='120'
WHERE "Dentist_RoomNumber"='123';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='120'
WHERE "Dentist_RoomNumber"='122';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='120'
WHERE "Dentist_RoomNumber"='121';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='130'
WHERE "Dentist_RoomNumber"='126';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='130'
WHERE "Dentist_RoomNumber"='127';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='130'
WHERE "Dentist_RoomNumber"='128';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='130'
WHERE "Dentist_RoomNumber"='129';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='140'
WHERE "Dentist_RoomNumber"='131';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='140'
WHERE "Dentist_RoomNumber"='132';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='140'
WHERE "Dentist_RoomNumber"='133';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='140'
WHERE "Dentist_RoomNumber"='134';
UPDATE "Dentist"
SET "Dentist_RoomNumber"='140'
WHERE "Dentist_RoomNumber"='135';

-AVG AND GROUP BY QUERY
-Find the dentist’s avg salary and group by dentist room number.

select "Dentist_RoomNumber" , avg("Salary")
from "Dentist" d
group by "Dentist_RoomNumber" ;

-GROUP BY, HAVING AND ORDER BY QUERY
-Find the dentist’s name whose average salary is higher than 3000 and group them by dentist name and salary. Order salary by ascending order.

select "Dentist_Name" , avg ("Salary")
from "Dentist" d
group by "Salary" , "Dentist_Name"
having avg ("Salary") > 3000
order by "Salary" asc;

-DESCENDING QUERY
-Find the dentist’s names and order them by descending order.

select distinct "Dentist_Name"
from "Dentist" d
order by "Dentist_Name" desc;

-NULL QUERY
-Find the dentist’s name whose salary is null.

select "Dentist_Name"
from "Dentist" d
where "Salary" is null;

-ALL QUERY
-Find the dentist’s name’s whose salary is smaller than the dentist whose id is '31233503998'.

select "Dentist_Name"
from "Dentist" d
where d."Salary" < all (select "Salary"
from "Dentist" d
where d."Dentist_ID" = '31233503998');

-SOME QUERY
-Find the dentist’s name whose salary is lower than some of the dentist’s salary whose room number is ‘140’.

select "Dentist_Name"
from "Dentist" d
where d."Salary" < some (select "Salary"
from "Dentist" d
where "Dentist_RoomNumber" = '140');

-UNION QUERY
-Find the union of the patient’s id’s whose dentist id is ‘31233503998’ and whose disease id is ‘23181’

(select "Patient_ID" from "Treated by" tb where "Dentist_ID" = '31233503998')
union
(select "Patient_ID" from "Treated by" tb2 where "Disease_id" = '23181')

-EXCEPT QUERY
-Find the dentist’s id’s who is work for ‘Hemdale Dental Center’ but not for ‘Sakada Dental’

(select "Dentist_ID" from "Works at" wa where "Dentalclinic_name"
= 'Hemdale Dental Center')
except
(select "Dentist_ID" from "Works at" wa2 where "Dentalclinic_name" = 'Sakada Dental');

-INTERSECT QUERY
-Find the patient id’s whose Dentist ID is ‘69181581452’ and disease id is ‘21897’

(select "Patient_ID" from "Treated by" tb where "Dentist_ID" = '69181581452')
intersect
(select "Patient_ID" from "Treated by" tb2 where "Disease_id" = '21897')

-EXIST QUERY
-Find the patient’s phone number whose exist in the inner query which shows the patient’s surname’s end with the letter ‘g’.

select "Patient_phonenumber"
from "Patient" p
where exists (select all
from "Treated by" tb
where p."Patient_surname" like '%g');

-NOT EXISTS QUERY
-Find the dentist’s surnames whose not exist in the inner query which shows the dentist’s room number is ‘130’ or ’140’.

select "Dentist_Surname"
from "Dentist" d
where not exists (select *
from "Has Proficiency in" hpi
where d."Dentist_RoomNumber" = '130' or d."Dentist_RoomNumber" ='140');

-MAX QUERY
-Find the dentist’s room number and the maximum salaries the room have and group by dentist’s room number.

select d."Dentist_RoomNumber" , max("Salary") as "Highest salary in the belonging room"
from "Dentist" d
where d."Dentist_RoomNumber" = '130' or d."Dentist_RoomNumber" = '120' or "Dentist_RoomNumber" = '140'
group by d."Dentist_RoomNumber";

-MIN QUERY
-Find the dentist’s room number and the minimum salaries the room have. Group by dentist’s room number in descending order.

select d."Dentist_RoomNumber", min("Salary") as "Minimum salary in the belonging room"
from "Dentist" d
where d."Dentist_RoomNumber" = '120' or "Dentist_RoomNumber" = '140' or "Dentist_RoomNumber" = '130'
group by d."Dentist_RoomNumber"
order by d."Dentist_RoomNumber" desc;

-UPDATE AND CASE QUERY
-Update Dentist table by multiplying salary by 1.08 if salary <= 2500 else multiplying salary by 1.05.

update "Dentist"
set "Salary" = case
when "Salary" <= 2500 then "Salary" * 1.08
else "Salary" * 1.05
end;

-IN QUERY
-Find the patient blood type whose id is start with the number 3.

select "Patient_bloodtype"
from "Patient" p
where p."Patient_id" in (select "Patient_id"
from "Patient"
where "Patient_id" like '%3');

-NOT IN QUERY
-Find the treatment names whose id’s last digit is not in the query which shows the treatment id’s last digit is not 4.

select distinct"Treatment_name"
from "Treatment"
where "Treatment_id" not in (select distinct"Treatment_id"
from "Treatment" t
where "Treatment_id" not like '%4')
