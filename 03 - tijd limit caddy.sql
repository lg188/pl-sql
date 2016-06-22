/* oef 3:
 * schrijfe een trigger zodate je enkel een caddy kuny maken tussen
 * 10 en 17h
 */

--

create or replace trigger caddy_check
before insert on caddy
declare
  v_time varchar(2) := to_char(sysdate,'HH');
begin
  if( v_time not between 10 and 17 ) then
    if inserting then
      raise_application_error('-20502', 'Buiten de normale uren, insert verboden');
    end if;
  end if;
end;
