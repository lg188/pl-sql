/* oef 8:
 * check als auteur met naam an bestaat, zoja print het nummer 
*/


declare
  v_ok boolean := false;
begin
  for rec in (select auteurnr, achternaam from auteur where voornaam = 'An') loop
      for i in 1..3 loop
          dbms_output.put_line(rec.auteurnr || rec.achternaam );
          v_ok := true;
      end loop;
  end loop;
  if(not v_ok) then
         raise NO_DATA_FOUND;
exception
  when NO_DATA_FOUND then
       raise_application_error(-2001,'no data found');
end;
