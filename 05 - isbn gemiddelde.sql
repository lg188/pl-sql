/* oef 5:
 * schrijf een functie die de isbn kleiner dan 1450011214 optelt en daar het gemiddlede van berekent.
 * maak een nieuwe gemeente aan die met een procedure
*/

-- procedure voor gemeente

create or replace procedure add_gemeente(
       p_gemeente in gemeente.gemeente%type,
       p_postcode in gemeente.postcode%type) as
begin
  insert into gemeente
  (gemeente, postcode)
  values
  (p_gemeente, p_postcode);
end;
/

create or replace function isbn_magic
return boek.isbn%type as
       v_total number(20,0) := 0; -- this might be too much
       v_ammount number(5,0) := 0;
       v_average number(10,0) := 0;
begin
  for rec in (select isbn from boek where boek.isbn < 145001214 ) loop
      v_ammount := v_ammount + 1;
      v_total := v_total + rec.isbn;
  end loop;
  if(v_ammount = 0 ) then
    raise_application_error('-20001','no rows were selected');
  end if;
  v_average := v_total / v_ammount;
  return v_average;
end isbn_magic;
/

declare
  v_str varchar2(10) := '';
begin
  v_str := to_char(isbn_magic());
end;


