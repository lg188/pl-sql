/* oef 9:
 * bereken de average prijs van alle boeken met de de prijs van het megegeven isbn nummer.
 * als het er onder ligt, true. Als het er boven licht false.
 * zorg voor excetion handling wanneer nodig
*/

create or replace function check_price(p_isbn in boek.isbn%type) return boolean is
       v_total number(10,2) := 0 ;
       v_avg   number(10,2) := 0 ;
       v_amount number(10,0) := 0;
       v_prijs boek.prijs%type;
begin
  -- bereken average prijs
  for rec in (select boek.prijs from boek) loop
      v_amount := v_amount + 1;
      v_total := v_total + rec.prijs;
  end loop;
  v_avg := v_total / v_amount;
  select boek.prijs   into v_prijs from boek where isbn = p_isbn;
  if(v_prijs >= v_avg) then
     return false;
  else
     return true;
  end if;
exception
  when no_data_found then
       raise_application_error(-2001, 'no data found for isbn');
end;
