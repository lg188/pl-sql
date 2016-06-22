/* oef 3:
 * schrijf een trigger zodat je enkel een caddy kuny maken tussen 10 en 17h
*/

create or replace trigger caddy_check
before insert on caddy
declare
  v_date date:= systimestamp;
  v_hour number(2,0);
begin
  --select sysdate into v_date from dual;
  v_hour :=  to_number(to_char(v_date, 'hh24'));
  dbms_output.put_line(to_char(v_date,'hh24'));
  if( v_hour not  between 10 and 17 ) then
    raise_application_error('-20502', 'Buiten de normale uren, insert verboden');
  else
    dbms_output.put_line('tijd controle succesvol');
  end if;
end;
/

insert into caddy (caddy_id, datum, verzendkosten,  klant_id)
values  ( 116, sysdate, 5, 1);
