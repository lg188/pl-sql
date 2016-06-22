/* oef 6:
 * vind een caddy met datum 01/03/2016 is
*/

declare
  v_date date;
  v_check date := to_date('01/03/2016', 'dd/mm/yyyy');
  v_cont boolean := true ;
begin
  for rec in (select datum from caddy )
  loop
    v_date = rec.datum;
    if(v_check = v_date) then
             v_cont := false;
             exit
    end if;
  end loop;
  if(v_cont) then
             dbms_output.print_line('datum gevonden');
  else
    raise no_data_found;
  end if;
exception
  when no_data_found then
       raise_application_error(-2001, 'no date found');
end;
