/* Oef 1:
 * Print totale prijs van alle boeken
 */
declare
  v_prijs boek.prijs%type := 0 ;
begin
  for rec
  in (select prijs from boek)
  loop
    v_prijs := v_prijs + rec.prijs;
  end loop;
  dbms_output.put_line('de totale prijs is' || v_prijs );
end;
